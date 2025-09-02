#!/bin/python
"""
Script for registering and processing microglia ASAP snRNA-seq samples for Putamen (PUT).

Workflow steps and notes are identical to PFC script.
"""

import truster
import pandas as pd
import os

# Paths to references and configs
cellranger_index = "/scale/gr01/shared/common/genome/10Xindexes/cellranger/6.0/refdata-gex-GRCh38-2020-A/"
star_index = "/path/to/processed/raquelgg_fs5_jakobssonlab/indices/GRCh38.p13_gencode.v38_STAR/"
gene_gtf = "/path/to/processed/raquelgg_fs3_jakobssonlab/annotations/hg38/gencode/v38/gencode.v38.annotation.gtf"
te_gtf = "/path/to/processed/raquelgg_fs3_jakobssonlab/annotations/hg38/rmsk/hg38_rmsk_TEtranscripts_FL_L1_marked.gtf"
herv_gtf = "/path/to/processed/raquelgg_fs3_jakobssonlab/annotations/hg38/rmsk/hg38_HERVs_prediction.gtf"

path_parent = os.path.dirname(os.getcwd())
lunarc = "config_files/lunarc_config.json"
modules = "config_files/software_modules.json"

region = "PUT"
asap_region = truster.Experiment(region, lunarc, modules)

samplesheet_path = "register_ASAP_samples.tab"
samplesheet = pd.read_csv(samplesheet_path, sep="\t")
samplesheet = samplesheet[samplesheet["region"].isin([region])]

with open("input_postQC.txt", "r") as fin:
    samples = fin.read().splitlines()
print(f"Number of post-QC samples: {len(samples)}")

keep = [i for i in samplesheet["sample_id"].to_list() if i in samples]
samplesheet = samplesheet[samplesheet["sample_id"].isin(keep)]

samplesheet_fout = f"samplesheet_registered_{region}.tab"
samplesheet.to_csv(samplesheet_fout, sep="\t")
asap_region.register_samples_from_file(samplesheet_fout)

quantification_dir = os.path.join(path_parent, "1_counts")

for sample_id in list(asap_region.samples.keys()):
    asap_region.set_quantification_outdir(
        sample_id=sample_id,
        cellranger_outdir=os.path.join(quantification_dir, sample_id)
    )

merged_dir = os.path.join(path_parent, "barcodes_microglia/")
merged_pipeline_dir = os.path.join(path_parent, "trusTEr_output_microglia/", region)
asap_region.set_merge_samples_outdir(os.path.join(merged_dir, region))

asap_region.process_clusters(
    mode="merged",
    outdir=merged_pipeline_dir,
    gene_gtf=gene_gtf,
    te_gtf=herv_gtf,
    star_index=star_index,
    RAM=132312156009,
    jobs=10,
    groups={i: [i] for i in keep},
    multi_subset_bam=True,
    modules_path="/scale/gr01/shared/common/modules/",
    unique=True
)

print(f"Done with {region} microglia!")
