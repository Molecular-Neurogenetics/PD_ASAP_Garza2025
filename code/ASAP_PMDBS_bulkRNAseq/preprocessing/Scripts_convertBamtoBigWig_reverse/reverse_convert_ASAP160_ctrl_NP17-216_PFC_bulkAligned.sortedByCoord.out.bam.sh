#!/bin/bash
#SBATCH -n 30
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 98:00:00
#SBATCH -J bw_ASAP160_ctrl_NP17-216_PFC_bulkAligned.sortedByCoord.out.bam
#SBATCH -o bw_ASAP160_ctrl_NP17-216_PFC_bulkAligned.sortedByCoord.out.bam.out
#SBATCH -e bw_ASAP160_ctrl_NP17-216_PFC_bulkAligned.sortedByCoord.out.bam.err
# convert to bigwig
#cd /home/yogitas/ASAP_Analysis/Unique_hg38_STAR
cd /scale/gr01/shared/jjakobsson/processed/ASAP/Unique_hg38_STAR
module purge
ml GCC/10.2.0  OpenMPI/4.0.5 deepTools/2.5.4

bamCoverage --normalizeUsingRPKM -p max --filterRNAstrand reverse -b ASAP160_ctrl_NP17-216_PFC_bulkAligned.sortedByCoord.out.bam -o ASAP160_ctrl_NP17-216_PFC_reverse.bw
