#' Define a S3 object in class of ppDEGs to store each dataset
#'
#' @param ID ID number of the dataset
#' @param name name of the dataset,E.g "Species_Tissue_Author_Year"
#' @param species Species
#' @param sample Tissue or Organs of the sample
#' @param treatment Time,temperature, and othe protoplasting conditions
#' @param ref DOI of the ref.
#' @param genes a vector of ppDEGs
#'
#' @return
#' @export
#'
#' @examples
#'  # A1 <- ppDEGs(ID="01",
#'  #              name = "ara_root_Wang_2020",
#'  #              species = "ara",
#'  #              sample = "root",
#'  #              treatment ="3H",
#'  #              ref = "DOI:001",
#'  #              genes = c("ATgene1","ATgene2","ATgene3"))
#'
ppDEGs <- function(ID,name, species, sample, treatment, ref, genes){
  structure( list(ID = ID,
                  name =name,
                  species=species,
                  sample = sample,
                  treatment = treatment,
                  ref =ref,
                  genes = genes),
             class="ppDEGs")
}


# 给泛型函数print针对ppDEGs类型添加方法
#' Information of ppDEGs
#'
#' @param x a object in class of pp.DEGs
#'
#' @return
#' @export
#'
#' @examples
Information <- function(x){
  cat("\n")
  cat("*************************\n")
  cat("\n")
  cat("ID:", x$ID, "\n")
  cat("name:", x$name, "\n")
  cat("species:",x$species ,"\n")
  cat("sample:", x$sample,"\n")
  cat("treatment:", x$treatment,"\n")
  cat("ref:", x$ref,"\n")
  cat("ppDEGs: total", length(x$genes$gene_name),"genes in this dataset, E.g", x$genes$gene_name[1:2],"\n")
  cat("\n")
  cat("*************************\n")
}
