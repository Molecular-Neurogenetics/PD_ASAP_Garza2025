#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 30:00:00
#SBATCH -J bw_ASAP220_PD_NP19-137_PUT_bulkAligned.sortedByCoord.out.bam
#SBATCH -o bw_ASAP220_PD_NP19-137_PUT_bulkAligned.sortedByCoord.out.bam.out
#SBATCH -e bw_ASAP220_PD_NP19-137_PUT_bulkAligned.sortedByCoord.out.bam.err
# convert to bigwig
cd /home/yogitas/ASAP_Analysis/Unique_hg38_STAR
module purge
ml GCC/10.2.0  OpenMPI/4.0.5 deepTools/2.5.4

bamCoverage --normalizeUsingRPKM --filterRNAstrand reverse -b ASAP220_PD_NP19-137_PUT_bulkAligned.sortedByCoord.out.bam -o ASAP220_PD_NP19-137_PUT_reverse.bw

