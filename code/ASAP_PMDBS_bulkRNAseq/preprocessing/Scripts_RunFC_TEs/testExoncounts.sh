#!/bin/bash
#SBATCH -n 10
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 98:00:00
#SBATCH -J EX_ASAP180_ctrl_NP16-119_SN_bulkAligned.sortedByCoord.out.bam
#SBATCH -o EX_ASAP180_ctrl_NP16-119_SN_bulkAligned.sortedByCoord.out.bam.out
#SBATCH -e EX_ASAP180_ctrl_NP16-119_SN_bulkAligned.sortedByCoord.out.bam.err
# Run Fc for  exon counts on bam files
cd /scale/gr01/shared/jjakobsson/processed/ASAP/Unique_hg38_STAR

module purge
ml subread

subread-parse.sh featureCounts -p -F GTF -s 2 -T 10 -g exon_id -a /home/yogitas/GenomeAssemblies/gencode.v47.primary_assembly.CHRonly.basic.annotation.gtf -o /scale/gr01/shared/jjakobsson/processed/ASAP/TempFolder/ASAP180_ctrl_NP16-119_SN_bulk.txt ASAP180_ctrl_NP16-119_SN_bulkAligned.sortedByCoord.out.bam
