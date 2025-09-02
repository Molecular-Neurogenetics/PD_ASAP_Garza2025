# ASAP\_PMDBS\_snRNAseq Preprocessing

This directory contains scripts for **preprocessing single-nucleus RNA-seq data** from the ASAP study. 

The full-region preprocessing scripts were ran in **two** steps to handle the:

*  **First step** of full-region preprocessing scripts: Execution of cellranger per sample. 
*  **Second step** of full-region preprocessing scripts: Ran after `processing/ASAP_PMDBS_snRNAseq_integrated_umap.ipynb`. Cellranger output set via `asap_region.set_quantification_outdir`:
	-  Registration samples' pseudobulks based on clustering performed by `processing/ASAP_PMDBS_snRNAseq_integrated_umap.ipynb` 
	-  Filtering, unique mapping, gene and TE quantification for four brain regions: **AMY, PFC, PUT, and SN**. 
	
Microglia subclustering scripts are also included (Cellranger output set via `asap_region.set_quantification_outdir`).

---

## Directory Contents

```
preprocessing/
├── main_asap_AMY.py           # Full-region preprocessing for Amygdala
├── main_asap_PFC.py           # Full-region preprocessing for Prefrontal Cortex
├── main_asap_PUT.py           # Full-region preprocessing for Putamen
├── main_asap_SN.py            # Full-region preprocessing for Substantia Nigra
├── main_asap_AMY_microglia.py # Microglia subclustering in Amygdala
├── main_asap_PFC_microglia.py # Microglia subclustering in Prefrontal Cortex
├── main_asap_PUT_microglia.py # Microglia subclustering in Putamen
└── main_asap_SN_microglia.py  # Microglia subclustering in Substantia Nigra
```

---

## Workflow Overview

### 1. Sample Registration

* Scripts read `register_ASAP_samples.tab` (path to raw files) and `input_postQC.txt` (sample names passing QC) to select **post-QC samples**.
* Filters by **region** (SN, PFC, PUT, AMY).
* Registers samples with the `truster.Experiment` class.
* Generates a region-specific `samplesheet_registered_<region>.tab` for downstream analysis.

### 2. Quantification Preparation

* Sets up output directories for **CellRanger** and **STAR** alignments.
* Configures `trusTEr` output directories (`barcodes/` and `trusTEr_output/`).
* Optional **nuclei filtering** for microglia subclustering.

### 3. Alignment and Merging

* Scripts prepare input for **TE/gene quantification**.
* Subclustering scripts adjust TE quantification to **focus on microglia**.
* Handles BAM/TSV merging and sets up downstream processing inputs.

---

## Region-Specific Scripts

| Script                       | Purpose                                                     |
| ---------------------------- | ----------------------------------------------------------- |
| `main_asap_AMY.py`           | Preprocess full-region Amygdala samples.                    |
| `main_asap_PFC.py`           | Preprocess full-region Prefrontal Cortex samples.           |
| `main_asap_PUT.py`           | Preprocess full-region Putamen samples.                     |
| `main_asap_SN.py`            | Preprocess full-region Substantia Nigra samples.            |
| `main_asap_AMY_microglia.py` | Preprocess and subcluster microglia from Amygdala.          |
| `main_asap_PFC_microglia.py` | Preprocess and subcluster microglia from Prefrontal Cortex. |
| `main_asap_PUT_microglia.py` | Preprocess and subcluster microglia from Putamen.           |
| `main_asap_SN_microglia.py`  | Preprocess and subcluster microglia from Substantia Nigra.  |

---

**Notes**:

* All scripts rely on `truster.Experiment` for registration, quantification, and output management.
* Post-QC samples are read from `input_postQC.txt`.
* Output directories are structured to feed directly into the **processing pipeline** (`trusTEr_output/` and `barcodes/`).

---

## Required Files

* `register_ASAP_samples.tab` – Sample table with path to raw files
* `input_postQC.txt` – List of post-QC samples
* **Indices**: CellRanger and STAR
* **Annotations**: Gencode GTF, TE GTF, HERV GTF

---

