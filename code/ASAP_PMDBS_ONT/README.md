# Oxford Nanopore (ONT) Analysis Workflow

This directory contains the **Snakemake** workflow for processing **Oxford Nanopore Technologies (ONT)** long-read RNA and DNA sequencing data used in the *PD_ASAP_Garza2025* study.

The workflow automates basecalling, mapping for both **direct RNA** and **DNA WGS** datasets.

---

## Folder structure
```
code/ASAP_PMDBS_ONT/
├── src/
│   ├── Snakefile                  # Main Snakemake pipeline
│   ├── config_files/
│   │   ├── config.json            # Sample list (RNA & DNA)
│   │   └── lunarc_config.json     # SLURM cluster configuration
│   └── singularities/             # Container images (e.g. regtools, modkit)
└── README.md                      # This file
```

---

## Workflow overview

The main Snakemake file (`src/Snakefile`) defines a modular workflow with rules for both RNA and DNA data.

### **1️⃣ Basecalling**
Performed using **Dorado**:
- `basecall_RNA`: Basecalls direct RNA reads with modified base (m6A) detection.
- `basecall_DNA`: Basecalls genomic DNA reads with 5mC/5hmC detection.
- `modfastq_DNA`: Converts externally basecalled BAMs into FASTQ.

### **2️⃣ Mapping**
Reads are aligned using **Minimap2**:
- `map_rna`: RNA → hg38 reference genome.  
- `map_rna_L1`: RNA → L1 consensus sequences.  
- `map_dna`: DNA → hg38 genome.  

Each rule outputs a sorted, indexed BAM file in:
```
/scale/gr01/shared/jjakobsson/processed/ASAP_ONT/1_map/
```

### **3️⃣ Coverage tracks**
`bigwig` creates strand-specific **bigWig** files normalized by RPKM using **deepTools**.

### **4️⃣ Feature extraction**
- `bamtobed`: Converts BAM to BED using **BEDTools**.
- `extract_junctions`: Extracts splice junctions using **regtools** (run via Singularity).

### **5️⃣ Regional signal matrices**
`computeMatrix` aggregates strand-specific signal across **L1HS**, **L1PA2**, and **L1PA3** families for positive and negative regions.

### **6️⃣ DNA methylation calling**
`modkit_pileup` runs **modkit** (via Singularity) to call CpG methylation and outputs compressed BED files.

---

## ⚙️ Configuration

The pipeline depends on two JSON configuration files in `src/config_files/`:

### `config.json`
Defines the RNA and DNA samples:
```json
{
  "rna": {
      "sample1" : "raw/path/sample1", 
      "sample2" : "raw/path/sample2"},
  "dna": {
      "sampleA" : "raw/path/sampleA", 
      "sampleB" : "raw/path/sampleB"}
}
```

### `lunarc_config.json`
Defines SLURM job parameters:
```json
{
  "account": "proj123",
  "partition": "core",
  "tasks-per-node": 20,
  "time": "48:00:00",
  "output": "logs/{rule}.out",
  "error": "logs/{rule}.err",
  "job-name": "{rule}",
  "nodes": 1
}
```

---

## 🚀 Running the workflow

From the `src/` directory:
```bash
snakemake -j 5   --cluster-config config_files/lunarc_config.json   --cluster "sbatch -A {cluster.account} -p {cluster.partition}     --tasks-per-node {cluster.tasks-per-node} -t {cluster.time}     -o {cluster.output} -e {cluster.error} -J {cluster.job-name} -N {cluster.nodes}"   --latency-wait 60
```

---

## 🧰 Software requirements
Loaded via `module load` statements inside each rule:
- **Dorado ≥ 0.7.1**
- **Minimap2 ≥ 2.24**
- **SAMtools ≥ 1.16**
- **deepTools ≥ 2.5.4**
- **BEDTools ≥ 2.31.0**
- **regtools ≥ 1.0.0**
- **modkit** (Singularity image)
- **Singularity** ≥ 3.9

---

## 📤 Input / Output summary

| Step | Input | Output | Description |
|------|--------|---------|-------------|
| basecall_RNA | pod5 files | `0_basecall/{sample}_RNA.fastq` | Direct RNA basecalling |
| map_rna | RNA fastq | `1_map/{sample}_RNA.sorted.bam` | RNA→hg38 alignment |
| map_rna_L1 | RNA fastq | `1_map/{sample}_RNA_L1consensus.sorted.bam` | RNA→L1 consensus alignment |
| bigwig | RNA BAM | `1_map/{sample}_RNA.sorted.bw` | Coverage tracks |
| bamtobed | RNA BAM | `1_map/{sample}_RNA.sorted.bed` | BED format |
| extract_junctions | RNA BAM | `1_map/{sample}_RNA.sorted.junctions.bed` | Splice junctions |
| computeMatrix | bigWigs + L1 BEDs | `deeptools/FL_L1PAs/{sample}_*.mtx` | L1 signal matrices |
| basecall_DNA | pod5 | `0_basecall/{sample}_DNA.fastq` | DNA basecalling |
| map_dna | DNA fastq | `1_map/{sample}_DNA.sorted.bam` | DNA alignment |
| modkit_pileup | DNA BAM | `2_modkit/{sample}_DNA_cpg.bed.gz` | CpG methylation calls |

---

## 🧠 Notes

- Working directory (`WD`) is hardcoded as `/scale/gr01/shared/jjakobsson/processed/ASAP_ONT/`.  
  Update it in the Snakefile.
- Large intermediate files (e.g., BAMs) are not stored in this repo.
- The `rna` and `dna` sample IDs in `config.json` must correspond to the folder names of raw inputs.
