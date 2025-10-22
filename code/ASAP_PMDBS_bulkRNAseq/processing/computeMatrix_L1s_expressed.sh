#!/bin/bash
#SBATCH -n 20
#SBATCH -N 1
#SBATCH -A csens2024-3-2
#SBATCH -t 50:00:00
#SBATCH -J computeMatrixL1
#SBATCH -o computeMatrixL1.out 
#SBATCH -e computeMatrixL1.err

regions="/scale/gr01/shared/jjakobsson/backup/raquelgg_fs3_jakobssonlab/annotations/hg38/rmsk/hg38_rmsk_TEtranscripts_FL_L1_marked.bed"
expressed="expressed_FL_L1HS_L1PA3_expressed.tab"

negative_l1hs=regions_negative_l1hs.bed
positive_l1hs=regions_positive_l1hs.bed

negative_l1pa2=regions_negative_l1pa2.bed
positive_l1pa2=regions_positive_l1pa2.bed

negative_l1pa3=regions_negative_l1pa3.bed
positive_l1pa3=regions_positive_l1pa3.bed

grep -w -f $expressed $positive_l1hs > regions_positive_l1hs_expressed.bed 
grep -w -f $expressed $negative_l1hs > regions_negative_l1hs_expressed.bed 

grep -w -f $expressed $positive_l1pa2 > regions_positive_l1pa2_expressed.bed 
grep -w -f $expressed $negative_l1pa2 > regions_negative_l1pa2_expressed.bed 

grep -w -f $expressed $positive_l1pa3 > regions_positive_l1pa3_expressed.bed 
grep -w -f $expressed $negative_l1pa3 > regions_negative_l1pa3_expressed.bed 

cat regions_positive_l1hs_expressed.bed regions_positive_l1pa2_expressed.bed regions_positive_l1pa3_expressed.bed > regions_positive_expressed.bed
cat regions_negative_l1hs_expressed.bed regions_negative_l1pa2_expressed.bed regions_negative_l1pa3_expressed.bed > regions_negative_expressed.bed

ml GCC/10.2.0  OpenMPI/4.0.5 deepTools/2.5.4

computeMatrix scale-regions -R  regions_positive_l1hs_expressed.bed regions_positive_l1pa2_expressed.bed regions_positive_l1pa3_expressed.bed -S ../BigWigFiles_ASAP_bulkRNA/*_forward.bw ../BigWigFiles_ASAP_bulkRNA/*_reverse.bw --regionBodyLength 6000 -b 6000 -a 6000 -o ../deeptools/FL_L1PAs/FL_L1PAs_positive_expressed.mtx

computeMatrix scale-regions -R regions_negative_l1hs_expressed.bed regions_negative_l1pa2_expressed.bed regions_negative_l1pa3_expressed.bed -S ../BigWigFiles_ASAP_bulkRNA/*_reverse.bw ../BigWigFiles_ASAP_bulkRNA/*_forward.bw --regionBodyLength 6000 -b 6000 -a 6000 -o ../deeptools/FL_L1PAs/FL_L1PAs_negative_expressed.mtx 

