## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

#### prepare ppDEGs_DB

At_root_Denyer_2019 <- ppDEGs(
  ID ="01",
  name ="At_root_Denyer_2019",
  species = "Arabidopsis thaliana",
  sample ="root",
  treatment = "6-day-old; 120mins",
  ref = "Denyer et al., 2019",
  genes = read.csv("../data_dir/At_root_GSE123818_ppDEGs.txt",sep = "\t")[["gene_name"]]
)


At_leaf_Kim_2021 <- ppDEGs(
  ID ="02",
  name ="At_leaf_Kim_2021",
  species = "Arabidopsis thaliana",
  sample ="leaf",
  treatment = "6-weeks-old; 120mins",
  ref = "Kim et al., 2021",
  genes = read.csv("../data_dir/At_leaf_GSE161411_ppDEGs.txt",sep = "\t")[["gene_name"]]
)


Zm_ear_Xu_2021 <- ppDEGs(
  ID ="03",
  name ="Zm_ear_Xu_2021",
  species = "Zea mays",
  sample ="ear",
  treatment = "45mins",
  ref = "Xu et al., 2021",
  genes = read.csv("../data_dir/Zm_ear_PRJNA647196_ppDEGs.txt",sep = "\t")%>% rownames()
)


Zm_leaf_Bezrutczyk_2021 <- ppDEGs(
  ID ="04",
  name ="Zm_leaf_Bezrutczyk_2021",
  species = "Zea mays",
  sample ="leaf",
  treatment = "V2-leaf; 210mins",
  ref = "Bezrutczyk et al., 2021",
  genes = read.csv("../data_dir/Zm_leaf_GSE157758_ppDEGs.txt",sep = "\t")[["Gene"]]
)



Os_root_Liu_2021 <- ppDEGs(
  ID ="05",
  name ="Os_root_Liu_2021",
  species = "Oryza sativa",
  sample ="root",
  treatment = "3-day-old; 150mins",
  ref = "Liu et al., 2021",
  genes = read.csv("../data_dir/Os_CRA004082_mixed_ppDEGs.txt",sep = "\t")[["Gene"]]
)




Nt_BY2_Yao_2023 <- ppDEGs(
  ID ="06",
  name ="Nt_BY2_Yao_2023",
  species = "Nicotiana tabacum",
  sample ="BY-2 cell lines",
  treatment = "3-day-old; 120mins",
  ref = "unpublished",
  genes = read.csv("../data_dir/Nt_BY2_ppDEGs.txt",sep = "\t")[["Gene"]]
)

ppDEGs_DB <- ppDEGs_DB(list(
  "01" = At_root_Denyer_2019,
  "02" = At_leaf_Kim_2021,
  "03" = Zm_ear_Xu_2021,
  "04" = Zm_leaf_Bezrutczyk_2021,
  "05" = Os_root_Liu_2021,
  "06" = Nt_BY2_Yao_2023
))

Overview(ppDEGs_DB)

Details(ppDEGs_DB, ID = "06")

ppDEGs <- ppDEGsExtra(ppDEGs_DB, ID = "01")

### 检查无误，我们应该把ppDEGs_DB打包放到包里面
usethis::use_data(ppDEGs_DB)





### prepare example dataset (Too big, we can not put it into package)

data_obj <- readRDS("../data_dir/GSE123818_at_root_anno_simple.rds")
data_obj <- SCTransform(data_obj, verbose = FALSE)

data_obj <- RunPCA(data_obj, verbose = FALSE, approx = FALSE, npcs = 10,seed.use = NULL)
data_obj <- RunUMAP(data_obj, dims = 1:10)
data_obj <- RunTSNE(data_obj, dims = 1:10)
data_obj <- FindNeighbors(data_obj, reduction = "pca",dims = 1:10)
data_obj <- FindClusters(data_obj,resolution =0.8)

Markers <- FindAllMarkers(data_obj,logfc.threshold = 2)

ppDEGs <- ppDEGsExtra(ppDEGs_DB, ID ="01")

eval_ppEffect(
  object = data_obj,
  ppDEGs = ppDEGs,
  marker_genes = Markers,
  report_dir = "F:/Learn_Create_R_package/ppEffect_eval_report-At_root_Denyer_2019.html"
)

getwd()




