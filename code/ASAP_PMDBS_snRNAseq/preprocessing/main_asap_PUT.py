#!/bin/python
"""
Script for registering and processing ASAP snRNA-seq samples for the Putamen (PUT) region.

Workflow steps:
1. Load the region-specific sample sheet and post-QC samples.
2. Register samples with the trusTEr `Experiment` object.
3. Quantify gene expression with CellRanger/STAR.
4. Set output directories for quantification and merged data.
5. Process cluster-level outputs, generating gene counts per cluster.

Assumptions:
- This script is run in the region-specific folder (or parent folder is correctly set).
- `input_postQC.txt` contains the list of post-QC sample IDs for this region.
- Paths to genome indexes, GTFs, and configuration files are correctly set.

Modules required (as loaded via environment or module system):
- GCC
- Pysam
- OpenMPI (optional, if used)
- Biopython
"""

# --------------------------------------------------------------------
# Imports
# --------------------------------------------------------------------
import truster
import pandas as pd
import os

# --------------------------------------------------------------------
# Paths to references and configuration
# --------------------------------------------------------------------
cellranger_index = "/scale/gr01/shared/common/genome/10Xindexes/cellranger/6.0/refdata-gex-GRCh38-2020-A/"
star_index = "/path/to/processed/raquelgg_fs5_jakobssonlab/indices/GRCh38.p13_gencode.v38_STAR/"
gene_gtf = "/path/to/processed/raquelgg_fs3_jakobssonlab/annotations/hg38/gencode/v38/gencode.v38.annotation.gtf"
te_gtf = "/path/to/processed/raquelgg_fs3_jakobssonlab/annotations/hg38/rmsk/hg38_rmsk_TEtranscripts_FL_L1_marked.gtf"
herv_gtf = "/path/to/processed/raquelgg_fs3_jakobssonlab/annotations/hg38/rmsk/hg38_HERVs_prediction.gtf"

path_parent = os.path.dirname(os.getcwd())
lunarc = "config_files/lunarc_config.json"          # Cluster submission config
modules = "config_files/software_modules.json"      # Module/software environment config

# --------------------------------------------------------------------
# Experiment setup
# --------------------------------------------------------------------
region = "PUT"  # Putamen region
asap_region = truster.Experiment(region, lunarc, modules)

# --------------------------------------------------------------------
# Load sample sheet and post-QC list
# --------------------------------------------------------------------
samplesheet_path = "register_ASAP_samples.tab"
samplesheet = pd.read_csv(samplesheet_path, sep="\t")

# Keep only samples for this region
samplesheet = samplesheet[samplesheet["region"].isin([region])]

# Load post-QC sample IDs (exclude hypoxic or failed samples)
with open("input_postQC.txt", "r") as fin:
    samples = fin.read().splitlines()
print(f"Number of post-QC samples: {len(samples)}")

# Keep only samples present in both lists
keep = [i for i in samplesheet["sample_id"].to_list() if i in samples]
samplesheet = samplesheet[samplesheet["sample_id"].isin(keep)]

# Save filtered sample sheet for registration
samplesheet_fout = f"samplesheet_registered_{region}.tab"
samplesheet.to_csv(samplesheet_fout, sep="\t")

# Register samples in the trusTEr Experiment
asap_region.register_samples_from_file(samplesheet_fout)

# --------------------------------------------------------------------
# Quantification
# --------------------------------------------------------------------
quantification_dir = os.path.join(path_parent, "1_counts")

# Quantify gene expression
# nuclei dict specifies which samples are nuclei; adjust per region (put + amy + sn + pfc)
asap_region.quantify(
    cr_index=cellranger_index,
    outdir=quantification_dir,
    jobs=8,
    nuclei={sample: True for sample in (put + amy + sn + pfc)}
)

print(f"Total registered samples: {len(asap_region.samples.keys())}")

# Assign quantification output directories per sample
for sample_id in list(asap_region.samples.keys()):
    asap_region.set_quantification_outdir(
        sample_id=sample_id,
        cellranger_outdir=os.path.join(quantification_dir, sample_id)
    )

# --------------------------------------------------------------------
# Merging and cluster-level processing
# --------------------------------------------------------------------
merged_dir = os.path.join(path_parent, "barcodes/")
merged_pipeline_dir = os.path.join(path_parent, "trusTEr_output/", region)

# Set merge directory
asap_region.set_merge_samples_outdir(os.path.join(merged_dir, region))

# Process clusters with trusTEr
# TE_counts=False for Putamen; only gene counts included
asap_region.process_clusters(
    mode="merged",
    outdir=merged_pipeline_dir,
    gene_gtf=gene_gtf,
    te_gtf=gene_gtf,
    star_index=star_index,
    RAM=132312156009,
    jobs=10,
    groups={i: [i] for i in keep},
    include_genes=True,
    multi_subset_bam=True,
    modules_path="/scale/gr01/shared/common/modules/",
    unique=True
)

print(f"Done with {region}!")
