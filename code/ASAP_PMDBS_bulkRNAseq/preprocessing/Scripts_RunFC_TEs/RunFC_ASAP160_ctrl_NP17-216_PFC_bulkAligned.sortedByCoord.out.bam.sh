#!/bin/bash
#SBATCH -n 30
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 90:00:00
#SBATCH -J FC_ASAP160_ctrl_NP17-216_PFC_bulkAligned.sortedByCoord.out.bam
#SBATCH -o FC_ASAP160_ctrl_NP17-216_PFC_bulkAligned.sortedByCoord.out.bam.out
#SBATCH -e FC_ASAP160_ctrl_NP17-216_PFC_bulkAligned.sortedByCoord.out.bam.err
# Run Fc for  bam files
cd /scale/gr01/shared/jjakobsson/processed/ASAP/Unique_hg38_STAR

module purge
ml subread

subread-parse.sh featureCounts -p -F GTF -s 2 -T 30 -g transcript_id -a /scale/gr01/shared/jjakobsson/backup/raquelgg_fs3_jakobssonlab/annotations/hg38/rmsk/hg38_rmsk_TEtranscripts.gtf -o /scale/gr01/shared/jjakobsson/processed/ASAP/Fcounts_TEs_Unique/ASAP160_ctrl_NP17-216_PFC_bulk.txt ASAP160_ctrl_NP17-216_PFC_bulkAligned.sortedByCoord.out.bam

