#' Obtain the beta's with a method of interest
#'
#' @param boxtimings The design matrix for all timings \code{\link{designmatrix}}.
#' @param ROI A vector of \code{y}.
#' @param summation Interest in the summation of all values of beta for each trial.
#' @param maximum Interest in the maximum of all values of beta for each trial.
#' @param all.beta Interest in the full betas for each box. Note that the matrix
#'   needs to be transposed.
#' @param nbox The amount of boxes
#' @return The design matrix for all timings, in which the first timing is shuffled
#'   in space.
#' @seealso \code{\link{designmatrix}}, for a boxcar for a timing.
#' @examples
#' ROI = c(9, -3, -7, -9, -7, -5, -9, 2,  7, 13, 20, 9, 4, 2, 7, 7, -2, -3, -5, 0)
#' timings = c(2, 6, 8, 10, 12, 14)
#' nbox = 3
#' lenbox = 2
#' TR = 1
#' boxtimings <- designmatrix(ROI, timings, nbox, lenbox, TR)
#'
#' main.interest(boxtimings, ROI, maximum = TRUE, nbox = nbox)
#' t(main.interest(boxtimings, ROI, all.beta = TRUE, nbox = nbox))
#' @export
main.interest <- function (boxtimings, ROI, maximum = FALSE, summation = FALSE, all.beta = FALSE, nbox) {
if (all.beta == TRUE) {
  all.beta = matrix(0, nrow = nbox, ncol = length(boxtimings))
  for (i in 1:length(boxtimings)) {
    vec = betafunc(boxtimings[[i]], ROI)[1:nbox]
    beta[, i] = vec
  }
  message("Please transpose this matrix for correct matrix")
  return(beta)
}
else { interest.vector <- matrix(0, nrow = length(boxtimings), ncol = 1)
  for (i in 1:length(boxtimings)) {
    if (maximum == TRUE) {
      vec = max(betafunc(boxtimings[[i]], ROI)[1:nbox])
      interest.vector[i, ] = vec
    }
    if (summation == TRUE) {
      vec = sum(betafunc(boxtimings[[i]], ROI)[1:nbox])
      interest.vector[i, ] = vec
    }
  }
  return(interest.vector)
  }
}

