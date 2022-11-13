
#' Correct ppEffect
#'
#' @param object Seurat object,have been well pre-propcessed
#' @param ppDEGs a vector of protoplasting induced genes
#' @param method we provided several methods to correct the ppDEGs,
#' Options include 'regress.out.ppDEGs', 'remove.ppCells','remove.ppDEGs'
#' @param pp.Score.TH You can choose the threshold of pp.Score when try to remove the cells which were
#' highly stimulated by protoplasting. The default one is
#'
#' @return a new seruat object after ppEffect correction.
#' @export
#'
#' @examples
#' # object_corr <- corr_ppEffect(object = object,ppDEGs =ppDEGs, method = "regress.out.ppDEGs")
corr_ppEffect <- function(object,ppDEGs, method = "regress.out.ppDEGs", pp.Score.TH= "pp.Score Q3" ){

  if (method == "regress.out.ppDEGs"){
    object <- Seurat::AddModuleScore(object = object, features = list(ppDEGs), name = "ppDEGs")
    object@meta.data$ppDEGs <- object@meta.data$ppDEGs1
    object@active.assay <- "RNA"
    object_sub <- SCTransform(object,vars.to.regress = "ppDEGs")

    cat('Completed successfully!
We have corrected ppEffect by the method "regress.out.ppDEGs".
The dimensional reduction should be re-runned following up')

    return(object_sub)
  }

  else if (method == "remove.ppCells"){
    object <- Seurat::AddModuleScore(object = object, features = list(ppDEGs), name = "ppDEGs")
    object@meta.data$ppDEGs <- object@meta.data$ppDEGs1
    if(pp.Score.TH=="pp.Score Q3"){pp.Score.TH =quantile(object$ppDEGs,0.75)}

    object_sub <- subset(x = object, ppDEGs <= pp.Score.TH) %>%
      GetAssayData( slot = "counts", assay = "RNA")  %>%
      CreateSeuratObject()

    print("Completed successfully!")
    cat("We have corrected ppEffect by the method 'remove.ppCells'.\n")
    cat(length(rownames(filter( object@meta.data,ppDEGs > pp.Score.TH))), "cell has been removed\n")
    cat("Please re-run the pre-process pipeline following up.")

    return(object_sub)
  }

  else if (method =="remove.ppDEGs"){
    object_sub <- object[setdiff(rownames(object),ppDEGs),] %>%
      GetAssayData( slot = "counts", assay = "RNA")  %>%
      CreateSeuratObject()

    print("Completed successfully!")
    cat("We have corrected ppEffect by the method 'remove.ppDEGs'.\n")
    cat("Please re-run the pre-process pipeline following up.")

    return(object_sub)
  }

  else {cat("Please select a method. Options include 'regress.out.ppDEGs', 'remove.ppCells','remove.ppDEGs'.")}

}
