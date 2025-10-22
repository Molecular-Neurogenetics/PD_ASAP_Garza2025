#!/bin/bash
#SBATCH -n 10
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 10:00:00
#SBATCH -J ASAP226_PD_NP16-285_PFC_bulk.u.STAR
#SBATCH -o ASAP226_PD_NP16-285_PFC_bulk.u.STAR.out
#SBATCH -e ASAP226_PD_NP16-285_PFC_bulk.u.STAR.err
ml purge
ml GCC/10.2.0 STAR/2.7.8a
STAR --genomeDir /scale/gr01/shared/jjakobsson/backup/raquelgg_fs5_jakobssonlab/GRCh38.p13_gencode.v38_STAR  --readFilesIn /home/yogitas/ASAP_Analysis/FastQFilesCat_ASAP_Seq319/ASAP226_PD_NP16-285_PFC_bulk_R1.fastq.gz /home/yogitas/ASAP_Analysis/FastQFilesCat_ASAP_Seq319/ASAP226_PD_NP16-285_PFC_bulk_R2.fastq.gz  --readFilesCommand gunzip -c  --runThreadN 20  --limitBAMsortRAM 7963119355  --outFilterMultimapNmax 1 --outFilterMismatchNoverLmax 0.03  --outSAMattributes All  --outSAMtype BAM SortedByCoordinate  --sjdbGTFfile /home/yogitas/fs3_files/AnnotationFiles/GRCh38/gencode.v38.annotation.gtf  --outFileNamePrefix /home/yogitas/ASAP_Analysis/Unique_hg38_STAR/ASAP226_PD_NP16-285_PFC_bulk
