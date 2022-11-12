#' Evaluate ppEffect in scRNA-seq dataset
#'
#' @param object A seruat object, which have been pre-processed
#' (after normalization, dimension reduction, and marker gene identification).
#' @param ppDEGs a vector of protoplasting induced genes.
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
#' #                 ppDEGs = ppDEGs,
#' #                 marker_genes = Markers,
#' #                 report_dir = "./ppEffect_eval_report-example.html")
#'
eval_ppEffect <- function(object, ppDEGs, group.by = "seurat_clusters", marker_genes, report_dir = "./ppEffect_report.html", ...) {
  object <- Seurat::AddModuleScore(object = object, features = list(ppDEGs), name = "ppDEGs")
  object@meta.data$ppDEGs <- object@meta.data$ppDEGs1
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

  rmarkdown::render(input = "./man/test.Rmd", output_file = report_dir, encoding = "UTF-8")
}
