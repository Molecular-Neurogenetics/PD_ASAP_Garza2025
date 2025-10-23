# Code Directory Overview

This directory contains all analysis scripts and notebooks supporting the study *Activation of transposable elements is linked to a region- and cell-type-specific interferon response in Parkinson’s disease* (Garza et al., 2025).

Each subfolder corresponds to a major data type or experimental component analyzed in the project. Within each, analyses are organized into two main stages — preprocessing and processing — to maintain consistency across workflows.

---

## Structure

```
code/
├── ASAP_invitro/            # In vitro cell model analyses
├── ASAP_PMDBS_bulkRNAseq/   # Bulk RNA-seq analysis pipeline
├── ASAP_PMDBS_snRNAseq/     # Single-nucleus RNA-seq (snRNA-seq) analysis pipeline
└── ASAP_PMDBS_ONT/          # Oxford Nanopore (ONT) long-read data analyses
```

Each of the above subfolders contains:

* **preprocessing/** — scripts for input QC, filtering, normalization, and preparation
* **processing/** — core analyses (e.g., clustering, DE, TE activation, visualization)

---

## Usage

Navigate to the folder corresponding to the data type you wish to analyze (for example, `ASAP_PMDBS_snRNAseq/`). Each of these contains its own `README.md` detailing inputs, workflow order, and expected outputs.

There are no unified execution commands at this level — analyses are modular and can be run independently within each subfolder.

---

## Notes

* File paths in scripts are relative to their own folder.
* Each analysis stage (preprocessing → processing) generates outputs saved to the corresponding `data/` directory at the top level.
