context("uLSIF")

test_that("uLSIF", {
  set.seed(314)
  x <- rnorm(200, mean = 1, sd = 1/8)
  y <- rnorm(200, mean = 1, sd = 1/2)

  result <- uLSIF(x, y, sigma = 0.1, lambda = 1, kernel_num = 20, verbose = FALSE)

  expect_s3_class(result, "uLSIF")
  expect_equal(result$kernel_info$kernel, "Gaussian")
  expect_equal(result$kernel_info$kernel_num, 20)
  expect_equal(result$kernel_info$sigma, 0.1)
  expect_equal(result$lambda, 1)

  expect_length(result$kernel_weights, 20)
  expect_true(all(is.finite(result$kernel_weights)))
  expect_true(all(result$kernel_weights >= 0))
})

test_that("uLSIF computes density ratios for new input data", {
  set.seed(314)
  x <- rnorm(200, mean = 1, sd = 1 / 8)
  y <- rnorm(200, mean = 1, sd = 1 / 2)

  result <- uLSIF(x, y, sigma = 0.1, lambda = 1, kernel_num = 20, verbose = FALSE)

  new_x <- seq(0, 2, length.out = 11)
  density_ratio <- result$compute_density_ratio(new_x)

  expect_length(density_ratio, length(new_x))
  expect_true(all(is.finite(density_ratio)))
  expect_true(all(density_ratio >= 0))
})
