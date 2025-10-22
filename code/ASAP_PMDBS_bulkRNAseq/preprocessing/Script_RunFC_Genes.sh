#!/bin/bash
#SBATCH -n 10
#SBATCH --ntasks-per-node=20
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 19:00:00
#SBATCH -J FCcount
#SBATCH -o %j.FCcount.out
#SBATCH -e %j.FCcount.err

module purge
ml subread
gtffile='/home/yogitas/fs3_files/AnnotationFiles/GRCh38/gencode.v38.annotation.gtf'
path='/scale/gr01/home/yogitas/ASAP_Analysis'
bamfiledir=$path/Unique_hg38_STAR
files=$(ls $bamfiledir/*.out.bam)

# Gencode exon
subread-parse.sh featureCounts -p -F GTF -s 2 -g gene_name \
    -a $gtffile \
    -o $path/Fcounts_uniMapping_ASAPbulkRNA.txt $files
