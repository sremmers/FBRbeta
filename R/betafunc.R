#' Betafunction for X and y
#'
#' @param X A matrix with nrow of m.
#' @param y A vector with ncol of n.
#' @return The beta's of \code{X} and \code{y}.
#' @examples
#' X = matrix(1:20, ncol = 4, nrow = 5)
#' y = matrix(c(3,6,4,9,10), ncol = 1)
#' betafunc(X, y)
#' @import MASS
#' @import Matrix
#' @export
betafunc <- function (X, y) {
  beta <- ginv(t(X) %*%(X)) %*% t(X) %*% y
  return(beta)
}

