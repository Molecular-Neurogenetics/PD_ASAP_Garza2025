### Overlap upregulated HERVs and L1s with nearby genes

## Purpose:
# This script identifies genes located near upregulated transposable elements (TEs) — specifically HERVs and L1s — in microglia from different brain regions (SN and PUT). It uses bedtools window to find genes within specified distances (windows) of each TE. This can reveal potential regulatory relationships between TEs and nearby genes.

## Inputs
# 1. HERV BED files (upregulated in a given cluster and region):
#    Example: HERVs_cluster_4_DEA_snRNAseq_SN_upreg.bed
#             Contains genomic coordinates of upregulated HERVs.
# 2. L1 BED files (upregulated in a given cluster and region):
#    Example: l1s_cluster_4_DEA_snRNAseq_SN_upreg.bed
#             Contains genomic coordinates of upregulated L1 elements.
# 3. Gene BED files (all genes in the same cluster and region):
#    Example: gene_cluster_4_DEA_snRNAseq_res_SN.bed
#             Contains genomic coordinates of genes.

## Outputs
# For each TE type, cluster, and region, the script generates BED files listing genes within a certain distance from the TEs:
# Naming pattern:
# <TE>_cluster_<N>_<REGION>_upreg_intersect_<WINDOW>bps_genes.bed

## Examples:
# HERVs_cluster_4_SN_upreg_intersect_500bps_genes.bed
# l1s_cluster_4_PUT_upreg_intersect_250000bps_genes.bed

## Window sizes used:
# 500 bp
# 1,000 bp
# 10,000 bp
# 100,000 bp
# 250,000 bp
# 500,000 bp

## Commands and Explanation
# bedtools window -w <WINDOW> -a <TE_bed> -b <GENE_bed> > <OUTPUT>
# -w <WINDOW>: Defines the distance (in bp) around each TE to look for genes.
# -a <TE_bed>: Input BED file of upregulated TEs (HERVs or L1s).
# -b <GENE_bed>: Input BED file of genes.

## Output: BED file with all gene regions within the specified window of each TE.
#          Example command for HERVs in SN cluster 4, 500 bp window:
# bedtools window -w 500 \
#  -a HERVs_cluster_4_DEA_snRNAseq_SN_upreg.bed \
#  -b gene_cluster_4_DEA_snRNAseq_res_SN.bed \
#  > HERVs_cluster_4_SN_upreg_intersect_500bps_genes.bed

## Regions and Clusters Covered
# Regions: SN, PUT
# Clusters: 1, 4 (as per BED file naming)
# TE types: HERVs, L1s

## Usage Context
# This script helps link upregulated TEs to nearby genes in single-nucleus RNA-seq datasets.
# Useful for downstream analyses such as identifying potential TE-driven gene regulation, enhancer activity, or functional enrichment analysis.

bedtools window -w 500 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_SN_upreg_intersect_500bps_genes.bed
bedtools window -w 1000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_SN_upreg_intersect_1000bps_genes.bed
bedtools window -w 10000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_SN_upreg_intersect_10000bps_genes.bed
bedtools window -w 100000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_SN_upreg_intersect_100000bps_genes.bed
bedtools window -w 250000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_SN_upreg_intersect_250000bps_genes.bed
bedtools window -w 500000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_SN_upreg_intersect_500000bps_genes.bed
bedtools window -w 500 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_PUT_upreg_intersect_500bps_genes.bed
bedtools window -w 1000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_PUT_upreg_intersect_1000bps_genes.bed
bedtools window -w 10000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_PUT_upreg_intersect_10000bps_genes.bed
bedtools window -w 100000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_PUT_upreg_intersect_100000bps_genes.bed
bedtools window -w 250000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_PUT_upreg_intersect_250000bps_genes.bed
bedtools window -w 500000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_4_PUT_upreg_intersect_500000bps_genes.bed
bedtools window -w 500 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_1_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_1_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_1_PUT_upreg_intersect_500bps_genes.bed
bedtools window -w 1000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_1_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_1_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_1_PUT_upreg_intersect_1000bps_genes.bed
bedtools window -w 10000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_1_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_1_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_1_PUT_upreg_intersect_10000bps_genes.bed
bedtools window -w 100000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_1_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_1_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_1_PUT_upreg_intersect_100000bps_genes.bed
bedtools window -w 250000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_1_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_1_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_1_PUT_upreg_intersect_250000bps_genes.bed
bedtools window -w 500000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/HERVs_cluster_1_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_1_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/HERVs_cluster_1_PUT_upreg_intersect_500000bps_genes.bed
bedtools window -w 500 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_SN_upreg_intersect_500bps_genes.bed
bedtools window -w 1000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_SN_upreg_intersect_1000bps_genes.bed
bedtools window -w 10000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_SN_upreg_intersect_10000bps_genes.bed
bedtools window -w 100000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_SN_upreg_intersect_100000bps_genes.bed
bedtools window -w 250000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_SN_upreg_intersect_250000bps_genes.bed
bedtools window -w 500000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_SN_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_SN.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_SN_upreg_intersect_500000bps_genes.bed
bedtools window -w 500 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_PUT_upreg_intersect_500bps_genes.bed
bedtools window -w 1000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_PUT_upreg_intersect_1000bps_genes.bed
bedtools window -w 10000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_PUT_upreg_intersect_10000bps_genes.bed
bedtools window -w 100000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_PUT_upreg_intersect_100000bps_genes.bed
bedtools window -w 250000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_PUT_upreg_intersect_250000bps_genes.bed
bedtools window -w 500000 -a ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/l1s_cluster_4_DEA_snRNAseq_PUT_upreg.bed -b ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/input/gene_cluster_4_DEA_snRNAseq_res_PUT.bed  > ./PD_ASAP_Garza2025/data/ASAP_PMDBS_snRNAseq/results/tables/enhancer_tables/upreg_PD/results/l1s_cluster_4_PUT_upreg_intersect_500000bps_genes.bed
