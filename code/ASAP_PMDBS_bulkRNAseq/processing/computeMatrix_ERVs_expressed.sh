#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 50:00:00
#SBATCH -J computeMatrixHERVs
#SBATCH -o computeMatrixHERVs.out 
#SBATCH -e computeMatrixHERVs.err


# In order to know what LTRs to plot, I've intersected LTRs in repeatmasker with the retrotector annotations and only kept the longest hit (top hit) among the LTRs, the result of which is hg38_HERVs_intersect_LTR_rmsk_top.bed. In other words, I've kept the longest LTR that is overlapping a prediction
regions="hg38_HERVs_intersect_LTR_rmsk_top.bed" # I extract directionality from that
expressed="/Volumes/MyPassport/ASAP/data/ASAP_PMDBS_bulkRNAseq/results/tables/expressed_ervs_expressed.tab" # These are just the retrotector ids

awk '{if($6=="+"){print $0}}' $regions > regions_positive_HERVs.bed
awk '{if($6=="-"){print $0}}' $regions > regions_negative_HERVs.bed

grep -w -f $expressed regions_positive_HERVs.bed > regions_positive_HERVs_expressed.bed 
grep -w -f $expressed regions_negative_HERVs.bed > regions_negative_HERVs_expressed.bed 

ml GCC/10.2.0  OpenMPI/4.0.5 deepTools/2.5.4

computeMatrix scale-regions -R  regions_positive_HERVs_expressed.bed -S ../BigWigFiles_ASAP_bulkRNA/*forward.bw ../BigWigFiles_ASAP_bulkRNA/*reverse.bw --regionBodyLength 1000 -b 5000 -a 5000 -o ../deeptools/HERVs/HERVs_positive_expressed.mtx

computeMatrix scale-regions -R regions_negative_HERVs_expressed.bed -S ../BigWigFiles_ASAP_bulkRNA/*_reverse.bw ../BigWigFiles_ASAP_bulkRNA/*_forward.bw --regionBodyLength 1000 -b 5000 -a 5000 -o ../deeptools/HERVs/HERVs_negative_expressed.mtx 

