# ASAP\_PMDBS\_snRNAseq – Processing Code

This folder contains the **processing workflows** for the ASAP PMDBS single-nucleus RNA-seq (snRNA-seq) dataset.
The workflows focus on transforming pre-processed data into analysis-ready formats, such as BAM indexing, normalized coverage tracks, and strand-specific bigWigs.

---

## Directory Structure

processing/
├── Snakefile\_ASAP\_PMDBS\_snRNAseq # Snakemake workflow for PFC cluster coverage tracks
├── intersect\_upregulated\_TEs\_genes.sh # Bedtools window to map upregulated TEs to nearby genes
├── ASAP\_PMDBS\_snRNAseq\_integrated\_umap.ipynb # Integration and UMAP reduction of all samples
├── ASAP\_PMDBS\_snRNAseq\_celltyping.ipynb # Cell typing, marker plots, and normalized gene tables
├── ASAP\_PMDBS\_snRNAseq\_microglia\_subclustering.ipynb # Integration and UMAP reduction of microglia
└── README.md

---

## Current Workflows

### `Snakefile_ASAP_PMDBS_snRNAseq`

* **Purpose:**

  * Index cluster-level BAM files (SAMtools).
  * Generate normalized bigWig coverage tracks (deepTools).
  * Create strand-specific bigWigs for forward and reverse transcription reads.

* **Inputs:**

  * BAM files from `trusTEr_output/{region}/map_cluster/unique/`.
  * Cluster/sample configuration in `src/config_files/config_{region}.yaml`.

* **Outputs:**

  * Indexed BAM files (`.bam.bai`).
  * Normalized bigWig files (`.bw`).
  * Strand-specific bigWigs (`_forward.bw` / `_reverse.bw`).

* **Run Example:**

```bash
snakemake -j 5 \
  --cluster-config /path/to/lunarc_config.json \
  --cluster "sbatch -A {cluster.account} -p {cluster.partition} \
             --tasks-per-node {cluster.tasks-per-node} \
             -t {cluster.time} -o {cluster.output} -e {cluster.error} \
             -J {cluster.job-name} -N {cluster.nodes}" \
  --latency-wait 60
```

---

### `intersect_upregulated_TEs_genes.sh`

* **Purpose:**

  * Use bedtools window to identify genes that are within a specified distance from upregulated TEs (HERVs or L1s) per cluster.
  * Multiple window sizes are tested (500 bp, 1 kb, 10 kb, 100 kb, 250 kb, 500 kb).

* **Inputs:**

  * BED file of upregulated TEs per cluster (e.g., `HERVs_cluster_4_DEA_snRNAseq_SN_upreg.bed`).
  * BED file of genes per cluster (e.g., `gene_cluster_4_DEA_snRNAseq_res_SN.bed`).

* **Outputs:**

  * BED files with TE-gene overlaps for each window size (e.g., `HERVs_cluster_4_SN_upreg_intersect_500bps_genes.bed`).

* **Run Example:**

```bash
bash intersect_upregulated_TEs_genes.sh
```

---

### `ASAP_PMDBS_snRNAseq_integrated_umap.ipynb`

* **Purpose:**

  * Integrate all samples.
  * Generate integrated UMAP plots for visualization of global structure (Figure 1B).

* **Inputs:**

  * Preprocessed count matrices per sample.

* **Outputs:**

  * Integrated AnnData object.
  * UMAP embeddings and plots.

---

### `ASAP_PMDBS_snRNAseq_celltyping.ipynb`

* **Purpose:**

  * Annotate cell types for clusters based on marker gene expression.
  * Generate visualizations of marker genes per cluster (Figure 1C).
  * Export normalized gene tables for downstream analyses.

* **Inputs:**

  * Integrated or per-sample AnnData object with clusters defined.

* **Outputs:**

  * Cluster cell-type assignments.
  * Plots of marker gene expression.
  * Exported tables of normalized expression values.

---

### `ASAP_PMDBS_snRNAseq_microglia_subclustering.ipynb`

* **Purpose:**

  * Focused integration and UMAP reduction of microglia cells across samples (Figure 6I).
  * Generate microglia-specific embeddings for downstream analyses.

* **Inputs:**

  * Preprocessed subset AnnData object.

* **Outputs:**

  * Integrated microglia AnnData object.
  * Microglia UMAP embeddings and plots.

---

### Future Additions

* R scripts or R Markdown notebooks for downstream analyses.
* Additional Snakemake workflows for alternative datasets or clusters.
* Documentation on expected input formats and output directories.
