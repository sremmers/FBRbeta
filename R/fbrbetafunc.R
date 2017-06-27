#' Use the FBR method to find the beta-values
#'
#' @param dat A nifti file. Can be obtained with readData("filtered_func_data.nii").
#' @param boxtimings the designmatrix for each each timing, obtained with \code{\link{designmatrix}}.
#' @param ROI The vector of interest \cite{y}.
#' @param timings A string of timings.
#' @param nbox The amount of boxcars in the design matrix.
#' @param lenbox The length of boxcars in the design matrix.
#' @param TR Sampling rate.
#' @param maximum Maximum is default, other option: summation, all.beta.
#' @param summation The sum
#' @param all.beta The full beta-matrix
#' @return The beta-values.
#' @seealso \code{\link{designmatrix}} for the boxcar function for all timings/events.,
#'   \code{\link[arf3DS4]{readData}} to read nifti files in R
#' @import arf3DS4
#' @examples
#' ROI = c(9, -3, -7, -9, -7, -5, -9, 2,  7, 13, 20, 9, 4, 2, 7, 7, -2, -3, -5, 0)
#' timings = c(2, 6, 8, 10, 12, 14)
#' nbox = 3
#' lenbox = 2
#' TR = 1
#' boxtimings <- designmatrix(ROI, timings, nbox, lenbox, TR)
#' dat = 0 #not required in this example, but is readData("filtered_func_data.nii")
#'
#' fbrbetafunc(dat, boxtimings, ROI, timings, nbox, lenbox, TR, maximum = TRUE )
#' t(fbrbetafunc(dat, boxtimings, ROI, timings, nbox, lenbox, TR, all.beta = TRUE ))
#' @export
fbrbetafunc <- function (dat, boxtimings, ROI, timings, nbox, lenbox, TR, maximum = TRUE,
                         summation = FALSE, all.beta = FALSE) {
  boxtimings <- designmatrix(ROI = ROI, timings, nbox = nbox, lenbox = lenbox, TR = TR)
  temp <- main.interest(boxtimings, ROI,  maximum, summation, all.beta, nbox = nbox)
  return(temp)
}

