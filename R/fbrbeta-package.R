#' FBRbeta: A package for the FBR method based on beta series
#'
#' The Finite BOLD Response (FBR) is a method to analyze fMRI
#' data. This method convolves the HRF with a design matrix.
#' This design matrix includes several boxcars with a particular length. The
#'FBR is a superior method in event-related designs and in models with lag
#' between HRF onset and stimulus onset. The advantange of the FBR is that it
#' is a flexible method, and it can estimate the BOLD. This current
#' implication of the FBR is based on beta-series. Each BOLD will get several
#' beta-values, depending on the amount and the length of the boxcars.
#' The \code{\link{fbrbetafunc}} is the general functions for the FBR.
#' This code consists of several other functions:
#'
#' @section FBRbeta functions:
#' The \code{\link{fbrbetafunc}} is the general functions for the FBR.
#' This code consists of several other functions:
#' A function to shuffle the first timing, \code{\link{timingmatrix}}
#' A function to obtain the beta's from X and y, \code{\link{betafunc}},
#' A code to make boxcars of a particular timing  \code{\link{boxcars}},
#' A code that combines \code{\link{timingmatrix}} and \code{\link{boxcars}}
#' in a function called \code{\link{designmatrix}}
#' @section Example:
#' See the vignette for a nice example and step-by-step explanation.
#' @name FBRbeta
#' @docType package
NULL
