#' A function for to make a boxcar for one timing
#'
#' @param leny The length of \code{y}.
#' @param timings The timing matrix, see \code{\link{timingmatrix}}.
#' @param nbox The amount of boxcars in the design matrix.
#' @param lenbox The length of each boxcar in the design matrix.
#' @param include.intercept Include intercept, default = FALSE.
#' @return The design matrix for one timing with the predefined amount and
#'   length of boxcars.
#' @seealso \code{\link{timingmatrix}}, for a timing matrix.
#' @examples
#' boxcars(100, c(10, 20, 40), nbox = 5, lenbox = 2)
#' @export
boxcars <- function(leny, timings, nbox, lenbox, include.intercept = FALSE) {
  x <- matrix(0,nrow=leny,ncol=length(timings) * nbox)
  p <- 1
  for(i in 1:length(timings)) {
    for(b in 1:nbox) {
      x[(timings[i] + (b-1) * lenbox):(timings[i] + lenbox - 1 + (b - 1) * lenbox), p] = 1
      p <- p + 1
    }
    m = matrix(0,leny,nbox)
      for (u in 1 : (length(timings) - 1)) {
        q <- x[, (nbox * u + 1):(nbox * u + nbox)]
        m <- m + q
      }
      w <- x[, 1:nbox]
      t <- cbind(w, m)
    }
  if (include.intercept == TRUE) {
    t <- cbind((rep(1, nrow(t))), t)
  }
  return(t)
}
