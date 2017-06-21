#' Create a boxcar for all timings
#'
#' @param ROI A vector of \code{y}.
#' @param timings A string of timings.
#' @param nbox Amount of boxcars in the design matrix.
#' @param lenbox Amount of length of the boxcar in the design matrix.
#' @param TR Sampling rate.
#' @param include.intercept Include intercept, default is FALSE.
#' @return A combination of \code{\link{timingmatrix}} and \code{\link{boxcars}}.
#'   This code gives a boxcar for each timing.
#' @seealso \code{\link{timingmatrix}} for a matrix of timings in which the
#'   first timing is shuffled, \code{\link{boxcars}}, the boxcar function.
#' @examples
#' ROI = c(9, -3, -7, -9, -7, -5, -9, 2,  7, 13, 20, 9, 4, 2, 7, 7, -2, -3, -5, 0)
#' timings = c(2, 6, 8, 10, 12, 14)
#' nbox = 3
#' lenbox = 2
#' TR = 1
#' designmatrix(ROI, timings, nbox, lenbox, TR)
#' @export
designmatrix <- function(ROI, timings, nbox, lenbox, TR, include.intercept = FALSE) {
  timingmatrix = matrix(0, length(timings), length(timings))
    for (k in 1:(length(timings))) {
      m = c(timings[k], timings[-k])
      timingmatrix[k, ] = m
    }
  x =  list()
    for (l in 1:length(timings)) {
      name = paste("timing", l, sep = "")
      temp <- boxcars(leny = length(ROI), timings = (timingmatrix[l, ]/TR), nbox,
        lenbox = (lenbox/TR), include.intercept)
      x[[name]] <- temp
    }
  return(x)
}
