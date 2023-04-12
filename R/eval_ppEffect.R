#' Evaluate ppEffect in scRNA-seq dataset
#'
#' @param object A seruat object, which have been pre-processed
#' (after normalization, dimension reduction, and marker gene identification).
#' @param Up_ppDEGs a vector of up-regulated protoplasting induced genes.
#' You can obtain the dataset from ppDEGs_DB or input your own geneList.
#' @param Down_ppDEGs a vector of down-regulated protoplasting induced genes.
#' You can obtain the dataset from ppDEGs_DB or input your own geneList.
#' @param group.by a slot to group cells. The default is "suerat_clusters".
#' @param marker_genes a data.frame about marker_genes,
#' We recommend you produce it from the seurat function "FindAllMarkers"
#' @param report_dir  the path to output the ppEffect Report.
#' @param ... Other arguments passed on to methods. Not currently used.
#'
#' @return The ppEffect Report using html format
#' @export
#'
#' @examples
#' # library(ppEffect)
#' # eval_ppEffect(  object = data_obj,
#' #                 Up_ppDEGs = Up_ppDEGs,
#' #                 Down_ppDEGs= Down_ppDEGs,
#' #                 marker_genes = Markers,
#' #                 report_dir = "./ppEffect_eval_report-example.html")
#'
eval_ppEffect <- function(object, Up_ppDEGs,Down_ppDEGs, group.by = "seurat_clusters", marker_genes, report_dir = "./ppEffect_report.html", ...) {
  object <- Seurat::AddModuleScore(object = object, features = list(Up_ppDEGs,Down_ppDEGs), name = c("Up_ppDEGs","Down_ppDEGs"),)
  object@meta.data$Up_ppDEGs <- object@meta.data$Up_ppDEGs1
  object@meta.data$Down_ppDEGs <- object@meta.data$Down_ppDEGs2
  featurePlotCols <- c(
    "lightgrey", "lightgrey", "lightgrey", "#ffffcc", "#ffeda0", "#fed976",
    "#feb24c", "#fd8d3c", "#fc4e2a", "#e31a1c", "#bd0026", "#800026", "#800026"
  )
  selCols <- (c(
    "#DCB717", "#E2272E", "#5EA5C9", "#76AB62", "#91217F", "#fdb462", "#EA9014", "#5A7FB9", "#757C98", "#178F3B",
    "#F1A1BF", "#33B9C1", "#B39BC2", "#851B3B", "#fb8072", "#80b1d3", "#b3de69", "#fccde5", "#d9d9d9", "#bc80bd",
    "#9ebcda", "#5d65d9"
  ))

  # print(plot1+plot2)
  # if(!file.exists("C:/tmp/test.rmd")){
  #   download.file(
  #     url="https://gitee.com/YAOJ-bioin/pp-effect/raw/master/test.Rmd",
  #     destfile = "C:/tmp/test.Rmd"
  #   )
  # }
  input_file <- system.file("rmd", "./ppEffect_report_template_V2_up_down.Rmd", package = "ppEffect")

  rmarkdown::render(input = input_file, output_file = report_dir, encoding = "UTF-8")

  object$Up_ppDEGs1 <- NULL
  object$Down_ppDEGs2 <- NULL
  return(object)

}
