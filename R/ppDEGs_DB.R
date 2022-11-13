#' Define the class of ppDEGs_DB to store multiply ppDEGs datasets
#'
#' @param ppDEGs a object of ppDEGs
#'
#' @return
#' @export
#'
#' @examples
#' # A1 <- ppDEGs(ID="01",name = "ara_root_Wang_2020",species = "ara",sample = "root",
#' # treatment ="3H",ref = "DOI:001",genes = c("ATgene1","ATgene2","ATgene3"))
#'
#' # A2 <- ppDEGs(ID="02",name = "Os_root_Yao_2022",
#' # species = "Os",sample = "root",treatment ="1H",ref = "DOI:002",genes = c("Osgene1","Osgene2","Osgene3"))
#'
#' ppDEGs_DB <- ppDEGs_DB(list("01"=A1,"02"=A2))
ppDEGs_DB <- function(ppDEGs){
  structure( list(dataset =ppDEGs),class="ppDEGs_DB")
}







#' Print the datasets overview in ppDEGs_DB
#'
#' @param x an object in ppDEGs_DB class
#'
#' @return
#' @export
#'
#' @examples
Overview <- function(x){
  cat("*** Protoplasting induced gene sets (ppDEGs) from bulk RNA-seq analysis (log2FC=1)
between protoplasted cells and un-protoplasted sample.*** \n")
  cat("\n")
  cat("ID  |     ", "Dataset name \n")
  for (i in names(x$dataset)){
    cat(x$dataset[[i]]$ID,' |     ',x$dataset[[i]]$name, "\n" )
  }

}






########## 针对对象的方法 ##########
# 1. 根据ID查看特一定数据集的信息，采用Details

#' View the details about the ppDEGs_DB
#'
#' @param x a object in ppDEGs_DB class
#' @param ID ID of the dataset you interested, E.g "01"
#'
#'
#' @example
#' # Details(ppDEGs_DB_example,ID ="01")
Details <- function(x,ID){
  Information(x$dataset[[ID]])
}





# 2. 根据ID提取特定基因集的信息

#' Extra ppDEGs
#'
#' @param x a object in ppDEGs_DB class
#' @param ID ID of the dataset you interested, E.g "01"
#'
#' @example
#' # ppDEGsExtra(ppDEGs_DB_example,ID ="01")
ppDEGsExtra <- function(x,ID){
  x$dataset[[ID]]$gene
}


