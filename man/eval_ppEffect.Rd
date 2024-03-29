% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/eval_ppEffect.R
\name{eval_ppEffect}
\alias{eval_ppEffect}
\title{Evaluate ppEffect in scRNA-seq dataset}
\usage{
eval_ppEffect(
  object,
  Up_ppDEGs,
  Down_ppDEGs,
  group.by = "seurat_clusters",
  marker_genes,
  report_dir = "./ppEffect_report.html",
  ...
)
}
\arguments{
\item{object}{A seruat object, which have been pre-processed
(after normalization, dimension reduction, and marker gene identification).}

\item{Up_ppDEGs}{a vector of up-regulated protoplasting induced genes.
You can obtain the dataset from ppDEGs_DB or input your own geneList.}

\item{Down_ppDEGs}{a vector of down-regulated protoplasting induced genes.
You can obtain the dataset from ppDEGs_DB or input your own geneList.}

\item{group.by}{a slot to group cells. The default is "suerat_clusters".}

\item{marker_genes}{a data.frame about marker_genes,
We recommend you produce it from the seurat function "FindAllMarkers"}

\item{report_dir}{the path to output the ppEffect Report.}

\item{...}{Other arguments passed on to methods. Not currently used.}
}
\value{
The ppEffect Report using html format
}
\description{
Evaluate ppEffect in scRNA-seq dataset
}
\examples{
# library(ppEffect)
# eval_ppEffect(  object = data_obj,
#                 Up_ppDEGs = Up_ppDEGs,
#                 Down_ppDEGs= Down_ppDEGs,
#                 marker_genes = Markers,
#                 report_dir = "./ppEffect_eval_report-example.html")

}
