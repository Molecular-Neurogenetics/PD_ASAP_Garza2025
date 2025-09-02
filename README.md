# Activation of transposable elements is linked to a region- and cell-type-specific interferon response in Parkinson’s disease

This repository contains code and processed data supporting the publication. It is organized by data type and analysis stage, with a focus on transparency, reproducibility, and clarity.

---

## Repository Structure

ASAP_publication_repo/
├── data/ # Clean processed data (tables, annotations, results)
├── code/ # Analysis code organized by data type and workflow stage
├── envs/ # Environment files (conda, Docker, R sessionInfo)
├── docs/ # Documentation and supplementary material
└── README.md

---

### Data Types
- `ASAP_invitro`  
- `ASAP_PMDBS_bulkRNAseq`  
- `ASAP_PMDBS_snRNAseq`  
- `ASAP_PMDBS_ONT`  

Each data type has its own subfolders in both `data/` and `code/`.

---

## Code Organization

Within each data type:

- **`preprocessing/`**  
  - Snakemake workflows, Python scripts, and Jupyter notebooks for initial data handling.  

- **`processing/`**  
  - R Markdown notebooks and scripts for statistical analyses and transformations.  

- **`visualization/`**  
  - R Markdown notebooks and scripts for generating figures and plots used in the publication.  

---

## Data

The `data/` directory contains cleaned and analysis-ready results such as:
- Tables  
- Annotations  
- Test results  

⚠️ **Note**: Raw data is not stored in this repository due to size and privacy restrictions.  

---

## Reproducibility

- Environment files are stored in `envs/` (conda `.yml`, Dockerfiles, or R `sessionInfo`).  
- Please install environments as needed before running workflows. Example:

```bash
conda env create -f envs/asap_preprocessing.yml
conda activate asap_preprocessing
```

---

## Getting Started

Clone the repository:
```bash
git clone git@github.com:Molecular-Neurogenetics/PD_ASAP_Garza2025.git
cd PD_ASAP_Garza2025
```

Install required environments (see envs/).
Navigate to the relevant data type in code/ and follow the workflow.

---

## License

MIT License unless otherwise specified.

---

## Citation

If you use this repository, please cite:

[Full citation for the ASAP publication will go here]

---

## Contact

For questions, please contact Raquel Garza (raquel.garza@med.lu.se).

