# Activation of transposable elements is linked to a region- and cell-type-specific interferon response in Parkinson’s disease

This repository contains code, processed data, and environment files supporting the publication:

*Activation of transposable elements is linked to a region- and cell-type-specific interferon response in Parkinson’s disease* (Garza et al., 2025).  

The goal is to make analyses **transparent and reproducible**: each analysis step (preprocessing → processing) is organized by data type.

> ⚠️ **Note:** Raw sequencing data are **not** included due to size and privacy restrictions. Processed, analysis-ready tables and annotations are provided in `data/`.

---

## 🗂 Repository layout


```
ASAP_publication_repo/

├── data/ # 📊 Clean processed data (tables, annotations, results)
├── code/ # 💻 Analysis code organized by data type and workflow stage
│ ├── ASAP_invitro/
│ ├── ASAP_PMDBS_bulkRNAseq/
│ ├── ASAP_PMDBS_snRNAseq/
│ └── ASAP_PMDBS_ONT/
└── README.md # 📝 This file
```

Each data type subfolder under `code/` follows the same structure:

* `preprocessing/` — 🧹 Snakemake workflows, Python scripts, and notebooks for raw → cleaned data  
* `processing/` — 📈 R Markdown notebooks and scripts for statistical analyses, derived tables, and publication figures

---

## 📊 Data

Processed data (tables and annotations) required to reproduce figures and analyses are included in the `data/` directory. Large or restricted raw datasets are available from the corresponding repositories or upon request. Please follow any applicable data-use agreements.

Associated Zenodo repositories for raw data:

* 🧬 Single nuclei sequencing of brain regions from healthy and PD individuals: [DOI:10.5281/zenodo.15162835](https://zenodo.org/records/15162835)  
* 🧪 Deep bulk RNAseq of neurological controls and PD brains: [DOI:10.5281/zenodo.16929448](https://zenodo.org/records/16988140)  
* 🧫 Bulk RNAseq of dopaminergic neurons in vitro cultures: [DOI:10.5281/zenodo.17149266](https://zenodo.org/records/17149267)  
* 🧫 Bulk RNAseq of microglia in vitro cultures: [DOI:10.5281/zenodo.17149290](https://zenodo.org/records/17149291)

---

## 📜 License

Unless otherwise specified in subfolders, **code and data** in this repository are released under the **MIT License**.

---

## 📖 Citation

If you use these data or code, please cite the article:

**Activation of transposable elements is linked to a region- and cell-type-specific interferon response in Parkinson’s disease**  
Raquel Garza, Anita Adami, Arun Thiruvalluvan, Sasvi Wijesinghe, Annabel Curle, Oliver Tam, Talitha Forcier, Danai A Lagka, Nina L Kazakou, Diahann A.M Atacho, Yogita Sharma, Marie Jönsson, Vivien Horvath, Sara Bermudez, Jenny Johansson, Daniel B. Rainbow, Laura Castilla-Vallmanya, Joanne L. Jones, Annelies Quaegebeur, Molly Gale Hammell, Agnete Kirkeby, Roger A. Barker, Johan Jakobsson  
bioRxiv 2025.09.03.673956; doi: [https://doi.org/10.1101/2025.09.03.673956](https://doi.org/10.1101/2025.09.03.673956)

---

## ✉️ Contact

For questions about the repository or data access, please contact **Raquel Garza**: [raquel.garza@med.lu.se](mailto:raquel.garza@med.lu.se)
