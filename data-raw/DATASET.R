## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

#### prepare ppDEGs_DB
dataset <- read.csv("../data_dir/At_root_GSE123818_up_ppDEGs_log2fc2_padj0.05.txt",sep = "\t")


At_root_Denyer_2019 <- ppDEGs(
  ID ="01",
  name ="At_root_Denyer_2019",
  species = "Arabidopsis thaliana",
  sample ="root",
  treatment = "6-day-old; 120mins",
  ref = "Denyer et al., 2019",
  Up_ppDEGs = read.csv("../data_dir/At_root_GSE123818_up_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean),
  Down_ppDEGs = read.csv("../data_dir/At_root_GSE123818_Down_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean)
)


At_leaf_Kim_2021 <- ppDEGs(
  ID ="02",
  name ="At_leaf_Kim_2021",
  species = "Arabidopsis thaliana",
  sample ="leaf",
  treatment = "6-weeks-old; 120mins",
  ref = "Kim et al., 2021",
  Up_ppDEGs = read.csv("../data_dir/At_leaf_GSE161411_up_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean),
  Down_ppDEGs = read.csv("../data_dir/At_leaf_GSE161411_down_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean)
)


Zm_ear_Xu_2021 <- ppDEGs(
  ID ="03",
  name ="Zm_ear_Xu_2021",
  species = "Zea mays",
  sample ="ear",
  treatment = "45mins",
  ref = "Xu et al., 2021",
  Up_ppDEGs = read.csv("../data_dir/Zm_ear_PRJNA647196_up_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean),
  Down_ppDEGs = read.csv("../data_dir/Zm_ear_PRJNA647196_down_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean)
)


Zm_leaf_Bezrutczyk_2021 <- ppDEGs(
  ID ="04",
  name ="Zm_leaf_Bezrutczyk_2021",
  species = "Zea mays",
  sample ="leaf",
  treatment = "V2-leaf; 210mins",
  ref = "Bezrutczyk et al., 2021",
  Up_ppDEGs = read.csv("../data_dir/Zm_leaf_GSE157758_up_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean),
  Down_ppDEGs = read.csv("../data_dir/Zm_leaf_GSE157758_down_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean)
)



Os_root_Wang_2021 <- ppDEGs(
  ID ="05",
  name ="Os_root_Wang_2021",
  species = "Oryza sativa",
  sample ="root",
  treatment = "3-day-old; 150mins",
  ref = "Wang et al., 2021",
  Up_ppDEGs = read.csv("../data_dir/Os_mixed_CRA004082_up_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean),
  Down_ppDEGs = read.csv("../data_dir/Os_mixed_CRA004082_down_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean)
)

# Os_root_ppDEGs <- read.csv("../data_dir/Os_CRA004082_mixed_ppDEGs.txt",sep = "\t")
# Os_root_ppDEGs <- rename(Os_root_ppDEGs,gene_name=Gene)
# write.table(Os_root_ppDEGs,"../data_dir/Os_CRA004082_mixed_ppDEGs.txt",sep = "\t",quote = F,row.names = F)


Nt_BY2_Yao_2023 <- ppDEGs(
  ID ="06",
  name ="Nt_BY2_Yao_2023",
  species = "Nicotiana tabacum",
  sample ="BY-2 cell lines",
  treatment = "3-day-old; 120mins",
  ref = "unpublished",
  Up_ppDEGs = read.csv("../data_dir/Nt_BY2_up_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean),
  Down_ppDEGs = read.csv("../data_dir/Nt_BY2_down_ppDEGs_log2fc2_padj0.05.txt",sep = "\t") %>% select(Gene, log2FoldChange,pvalue,padj,baseMean)

)


# Nt_ppDEGs <- read.csv("../data_dir/Nt_BY2_ppDEGs.txt",sep = "\t")
# Nt_ppDEGs <- rename(Nt_ppDEGs,gene_name=Gene)
# write.table(Nt_ppDEGs,"../data_dir/Nt_BY2_ppDEGs.txt",sep = "\t",quote = F,row.names = F)


ppDEGs_DB <- ppDEGs_DB(list(
  "01" = At_root_Denyer_2019,
  "02" = At_leaf_Kim_2021,
  "03" = Zm_ear_Xu_2021,
  "04" = Zm_leaf_Bezrutczyk_2021,
  "05" = Os_root_Wang_2021,
  "06" = Nt_BY2_Yao_2023
))

Overview(ppDEGs_DB)

Details(ppDEGs_DB, ID = "01")
Details(ppDEGs_DB, ID = "02")
Details(ppDEGs_DB, ID = "03")
Details(ppDEGs_DB, ID = "04")
Details(ppDEGs_DB, ID = "05")
Details(ppDEGs_DB, ID = "06")

ppDEGs <- ppDEGsExtra(ppDEGs_DB, ID = "01")




### 检查无误，我们应该把ppDEGs_DB打包放到包里面
usethis::use_data(ppDEGs_DB,overwrite = T)





### prepare example dataset (Too big, we can not put it into package)
library(Seurat)
library(ppEffect)
data_obj <- readRDS("../data_dir/GSE123818_at_root_anno_simple.rds")
data_obj <- SCTransform(data_obj, verbose = FALSE)

data_obj <- RunPCA(data_obj, verbose = FALSE, approx = FALSE, npcs = 10,seed.use = NULL)
data_obj <- RunUMAP(data_obj, dims = 1:10)
data_obj <- RunTSNE(data_obj, dims = 1:10)
data_obj <- FindNeighbors(data_obj, reduction = "pca",dims = 1:10)
data_obj <- FindClusters(data_obj,resolution =0.8)
data_obj <- readRDS("../data_dir/GSE123818_at_root_anno_pre-processed-ppEffected.rds")

Markers <- FindAllMarkers(data_obj,logfc.threshold = 2)

Up_ppDEGs <- ppDEGsExtra(ppDEGs_DB, ID ="01",type = "Up_ppDEGs")

Down_ppDEGs <- ppDEGsExtra(ppDEGs_DB, ID ="01",type = "Down_ppDEGs")


eval_ppEffect(
  object = data_obj,
  #Up_ppDEGs = Up_ppDEGs$Gene,
  Up_ppDEGs = Up_ppDEGs,
  Down_ppDEGs = Down_ppDEGs$Gene,
  marker_genes = Markers,
  report_dir = "F:/Learn_Create_R_package/ppEffect_eval_report-At_root_Denyer_2019_V2.html"
)

getwd()




