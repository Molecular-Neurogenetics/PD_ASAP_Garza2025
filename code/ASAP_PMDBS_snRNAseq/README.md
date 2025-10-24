# 🧬 ASAP_PMDBS_snRNAseq

This directory contains all **scripts, notebooks, and workflows** used for the **single-nucleus RNA sequencing (snRNA-seq)** component of the study:

*Activation of transposable elements is linked to a region- and cell-type-specific interferon response in Parkinson’s disease* (Garza et al., 2025).  

Raw data used for these analyses are deposited in Zenodo: [DOI:10.5281/zenodo.15162835](https://zenodo.org/records/15162835).

Analyses were performed on the **Parkinson’s Disease Molecular Atlas (PMDBS)** dataset, focusing on the transcriptional and **transposable element (TE)** landscape across different brain regions and cell types.

---

## 🗂 Structure

```
code/ASAP_PMDBS_snRNAseq/
├── preprocessing/ # 🧹 Scripts for raw data QC, filtering, and normalization
├── processing/ # 📈 Scripts for clustering, integration, annotation, and TE quantification
```

Each subfolder contains **self-contained scripts or R Markdown notebooks** organized by analysis stage.

---

## 🧹 Preprocessing

Scripts in `preprocessing/` handle **raw count matrices** and **metadata curation** prior to downstream analyses. Tasks include:

* Running **10X Cellranger** to map and quantify gene expression  
* Running **[trusTEr](https://github.com/Molecular-Neurogenetics/truster)** for TE quantification per cluster

**Outputs:**  

* Single-nucleus count matrices and metadata  
* Pseudobulk TE count matrices

---

## 📈 Processing

The `processing/` folder contains R and Python scripts for core analyses, including:

**Jupyter notebooks:**

* Importing and QC of raw count matrices  
* Filtering low-quality nuclei and genes  
* Normalization and variance stabilization  
* Dimensionality reduction (PCA, UMAP)  
* Integration of samples across donors and regions  
* Cell clustering and annotation (e.g., neuron, glia subtypes)

**R Markdown notebooks:**  

* Differential expression and TE activation analyses  
* Gene differential expression and gene set enrichment analyses

**Output:** Tables summarizing cluster assignments, differential expression results, and TE activation scores

---

## 🚀 How to run

Each subfolder can be executed independently:

1. Navigate to the desired subfolder (e.g., `preprocessing/`)  
2. Open the notebook (`.Rmd` or `.ipynb`) or run the corresponding script  
3. Adjust input/output paths for your environment  

Ensure your R/Python installations include the required packages (listed in code headers or comments).

---

## 📄 Outputs

* **Intermediate data:** Cleaned expression matrices, cell metadata, and TE quantification tables  
* **Final results:** Differential expression results and TE activation summaries by region and cell type  
* **Figures:** All main and supplementary snRNA-seq visualizations
