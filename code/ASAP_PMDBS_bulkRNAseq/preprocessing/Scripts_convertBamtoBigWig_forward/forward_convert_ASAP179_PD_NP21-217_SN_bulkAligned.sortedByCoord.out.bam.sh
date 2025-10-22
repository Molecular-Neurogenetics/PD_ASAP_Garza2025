#!/bin/bash
#SBATCH -n 30
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 100:00:00
#SBATCH -J bw_ASAP179_PD_NP21-217_SN_bulkAligned.sortedByCoord.out.bam
#SBATCH -o bw_ASAP179_PD_NP21-217_SN_bulkAligned.sortedByCoord.out.bam.out
#SBATCH -e bw_ASAP179_PD_NP21-217_SN_bulkAligned.sortedByCoord.out.bam.err
# convert to bigwig
cd /home/yogitas/ASAP_Analysis/Unique_hg38_STAR
module purge
ml GCC/10.2.0  OpenMPI/4.0.5 deepTools/2.5.4

bamCoverage --normalizeUsingRPKM --filterRNAstrand forward -b ASAP179_PD_NP21-217_SN_bulkAligned.sortedByCoord.out.bam -o ASAP179_PD_NP21-217_SN_bulk_forward.bw

