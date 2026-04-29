context("KLIEP")

test_that("KLIEP", {
  set.seed(314)
  x <- rnorm(200, mean = 1, sd = 1/8)
  y <- rnorm(200, mean = 1, sd = 1/2)

  result <- KLIEP(x, y, sigma = 0.1, kernel_num = 20, fold = 5, verbose = FALSE)

  expect_true(inherits(result, "KLIEP"))
  expect_equal(result$kernel_info$kernel, "Gaussian")
  expect_equal(result$kernel_info$kernel_num, 20)
  expect_equal(result$kernel_info$sigma, 0.1)
  expect_equal(result$fold, 5)

  expect_equal(length(result$kernel_weights), 20)
  expect_true(all(is.finite(result$kernel_weights)))
  expect_true(all(result$kernel_weights >= 0))
  expect_true(is.function(result$compute_density_ratio))
})

test_that("KLIEP compute_density_ratio uses new input", {
  set.seed(314)
  x <- rnorm(200, mean = 1, sd = 1 / 8)
  y <- rnorm(200, mean = 1, sd = 1 / 2)

  result <- KLIEP(x, y, sigma = 0.1, kernel_num = 20, fold = 5, verbose = FALSE)

  new_x <- seq(0, 2, length.out = 11)
  density_ratio <- result$compute_density_ratio(new_x)

  expect_length(density_ratio, 11)
  expect_true(all(is.finite(density_ratio)))
  expect_true(all(density_ratio >= 0))
})
