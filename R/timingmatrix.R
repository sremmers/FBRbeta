#' Shuffle the first timing in a matrix
#'
#' @param timings A matrix of the stimulus presentations.
#' @return The design matrix for all timings, in which the first timing is
#'   shuffled in space.
#' @examples
#' timings <- as.matrix(10, 20, 30, 40)
#' timingmatrix(timings)
#' @export
timingmatrix <- function(timings) {
  timingmatrix = matrix(0, length(timings), length(timings))
    for (k in 1:(length(timings))) {
      m = c(timings[k], timings[-k])
      timingmatrix[k, ] = m
    }
  return(timingmatrix)
}
