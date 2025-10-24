# 🧫 ASAP_invitro

This directory contains **scripts and notebooks** related to the *in vitro* model analyses conducted as part of the study:

*Activation of transposable elements is linked to a region- and cell-type-specific interferon response in Parkinson’s disease* (Garza et al., 2025).

These analyses focus on cultured cell models used to model findings from postmortem brain datasets, including the **transcriptional activation of transposable elements (TE)** under interferon treatment.

---

## 🗂 Structure

```
code/ASAP_invitro/
├── preprocessing/ # 🧹 QC, normalization, and preparation of count data
└── processing/ # 📈 Statistical analyses, TE activation, and comparison to postmortem datasets
```

---

## 🧹 Preprocessing

Scripts in `preprocessing/` handle import, cleaning, and normalization of *in vitro* expression data. Tasks include:

* Alignment to the reference genome (using STAR)  
* Quantification of **gene expression** and **transposable elements**

**Output:** Clean expression matrices and metadata for downstream analysis.

---

## 📈 Processing

The `processing/` folder contains R scripts and notebooks used for the main *in vitro* analyses, including:

* Importing count matrices  
* Quality control  
* Normalization  
* **Gene differential expression analysis** between treatment and control  
* **TE differential expression analysis** between treatment and control  
* Overlap and correlation with PMDBS dataset  
* Gene set enrichment analysis and summary statistics  

**Output:** Differential gene and TE expression tables.

---

## 🚀 How to run

1. Navigate to either `preprocessing/` or `processing/`.  
2. Open the corresponding R or Python script/notebook.  
3. Adjust the input/output paths at the top of each script as required.  

Scripts can be executed independently in standard R or Python environments. No specific container or reproducibility environment is provided.

---

## 📄 Outputs

* **Preprocessing:** Gene and TE count matrices, sample metadata.  
* **Processing:** Differential expression analysis of genes and TEs, summary plots, and cross-dataset comparison outputs.
