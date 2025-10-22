#!/bin/bash
#SBATCH -n 10
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 10:00:00
#SBATCH -J index_ASAP221_ctrl_NP19-218_PFC_bulkAligned.sortedByCoord.out.bam
#SBATCH -o index_ASAP221_ctrl_NP19-218_PFC_bulkAligned.sortedByCoord.out.bam.out
#SBATCH -e index_ASAP221_ctrl_NP19-218_PFC_bulkAligned.sortedByCoord.out.bam.err
# Generate index for bam files
cd /home/yogitas/ASAP_Analysis/Unique_hg38_STAR
module purge
ml GCC/12.3.0 SAMtools/1.18
samtools index -b ASAP221_ctrl_NP19-218_PFC_bulkAligned.sortedByCoord.out.bam

