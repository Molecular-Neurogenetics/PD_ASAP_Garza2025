# ASAP_PMDBS_bulkRNAseq

This directory contains scripts and notebooks for the bulk RNA-seq analyses performed as part of the study *Activation of transposable elements is linked to a region- and cell-type-specific interferon response in Parkinson’s disease* (Garza et al., 2025).

These analyses were conducted on the Parkinson’s Disease Molecular Atlas (PMDBS) bulk RNA-seq dataset, focusing on transcriptome-wide detection of transposable elements (TE) across brain regions using deep bulk RNAseq.

---

## Structure

```
code/ASAP_PMDBS_bulkRNAseq/
├── preprocessing/     # Scripts for raw data QC, alignment, and quantification
└── processing/        # Scripts for normalization, and list of expressed TEs
```

Each subfolder contains self-contained scripts or notebooks corresponding to one stage of the bulk RNA-seq workflow.

---

## Preprocessing

The `preprocessing/` folder includes scripts and pipelines for processing raw FASTQ files into gene- and TE-level count matrices. Typical tasks include:

* Alignment to the reference genome (using STAR or similar)
* Quantification of gene expression and transposable elements

Output: processed count matrices for genes and TEs.

---

## Processing

The `processing/` folder contains R scripts and notebooks for the main analytical steps, including:

* Normalization using gene size factors
* Narrowing down expressed TEs in these samples

Output: result tables, statistical summaries, and intermediate objects for figure generation.

---

## How to run

1. Navigate to the desired subfolder (e.g., `processing/`).
2. Open the relevant R or Python script/notebook.
3. Adjust the input/output file paths at the top of each script as needed.

No unified workflow or container is provided; run scripts individually in a standard R or Python environment with the required packages installed.

---

## Outputs

* **Preprocessing:** Count matrices.
* **Processing:** TE expression summaries.

