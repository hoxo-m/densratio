context("KLIEP")

test_that("KLIEP", {
  set.seed(3)
  x <- rnorm(200, mean = 1, sd = 1/8)
  y <- rnorm(200, mean = 1, sd = 1/2)

  result <- KLIEP(x, y)

  kernel_weights <- result$kernel_weights
  sigma <- result$kernel_info$sigma
  lambda <- result$lambda

  expected_kernel_weights <- c(0.0885607375, 0.0178664639, 0.0240389107,
                               0.0000000000, 0.0810753470, 0.0001353598)

  testthat::skip_on_cran()
  expect_equal(head(kernel_weights), expected_kernel_weights)
  expect_equal(sigma, 0.09)
})

test_that("KLIEP compute_density_ratio uses new input", {
  set.seed(3)
  x1 <- rnorm(200, mean = 1, sd = 1 / 8)
  x2 <- rnorm(200, mean = 1, sd = 1 / 2)

  fit <- KLIEP(x1, x2, sigma = 0.1, verbose = FALSE)

  new_x <- seq(0, 2, length.out = 11)
  pred <- fit$compute_density_ratio(new_x)

  expect_length(pred, length(new_x))
})
