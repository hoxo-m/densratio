#' Estimate Density Ratio p(x)/q(x) by KLIEP (Kullback-Leibler Importance Estimation Procedure)
#'
#' @param x1 numeric vector or matrix. Data from a numerator distribution p(x).
#' @param x2 numeric vector or matrix. Data from a denominator distribution q(x).
#' @param sigma positive numeric vector. Search range of Gaussian kernel bandwidth.
#' @param kernel_num positive integer. Number of kernels.
#' @param fold positive integer. Number of the folds of cross validation.
#' @param verbose logical (default TRUE).
#'
#' @return KLIEP object that contains a function to compute estimated density ratio.
#'
#' @export
KLIEP <- function(x1, x2, sigma = "auto", kernel_num = 100, fold = 5, verbose = TRUE) {
  if(verbose) message("############ Start KLIEP ############")
  if(is.vector(x1)) x1 <- matrix(x1)
  if(is.vector(x2)) x2 <- matrix(x2)
  if(ncol(x1) != ncol(x2)) stop("x1 and x2 must be same dimensions.")

  nx1 <- nrow(x1)
  kernel_num <- min(kernel_num, nx1)
  centers <- x1[sample(nx1, size = kernel_num), , drop = FALSE]

  if(identical(sigma, "auto")) {
    if(verbose) message("Searching optimal sigma and lambda...")
    sigma <- KLIEP_search_sigma(x1, x2, centers, fold, verbose)
    if(verbose) message(sprintf("Found optimal sigma = %.5f.", sigma))
  } else if(length(sigma) > 1) {
    if(verbose) message("Searching optimal sigma and lambda...")
    sigma <- KLIEP_search_sigma_list(x1, x2, centers, sigma, fold, verbose)
    if(verbose) message(sprintf("Found optimal sigma = %.5f.", sigma))
  }

  if(verbose) message("Optimizing kernel weights...")
  phi_x1 <- compute_kernel_Gaussian(x1, centers, sigma)
  phi_x2 <- compute_kernel_Gaussian(x2, centers, sigma)
  kernel_weights <- KLIEP_optimize_alpha(phi_x1, phi_x2)
  if(verbose) message("End.")

  result <- list(kernel_weights = as.vector(kernel_weights),
                 kernel_info = list(
                   kernel = "Gaussian",
                   kernel_num = kernel_num,
                   sigma = sigma,
                   centers = centers
                 ),
                 fold = fold,
                 compute_density_ratio = function(x) {
                   if(is.vector(x)) x <- matrix(x)
                   phi_x <- compute_kernel_Gaussian(x, centers, sigma)
                   density_ratio <- as.vector(phi_x %*% kernel_weights)
                   density_ratio
                 }
  )
  class(result) <- c("KLIEP", class(result))
  if(verbose) message("############ Finished KLIEP #########")
  result
}
