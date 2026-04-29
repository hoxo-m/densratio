test_that("squared_euclid_distance computes squared Euclidean distance", {
  expect_equal(squared_euclid_distance(c(1, 2, 3), c(4, 6, 3)), 25)
})

test_that("kernel_Gaussian is 1 for identical inputs", {
  expect_equal(kernel_Gaussian(c(1, 2), c(1, 2), sigma = 1), 1)
})

test_that("compute_kernel_Gaussian returns a kernel matrix", {
  x <- matrix(c(0, 0, 1, 0, 0, 1), ncol = 2, byrow = TRUE)
  centers <- matrix(c(0, 0, 1, 1), ncol = 2, byrow = TRUE)

  result <- compute_kernel_Gaussian(x, centers, sigma = 1)

  expect_equal(dim(result), c(3, 2))
  expect_true(all(result > 0))
  expect_true(all(result <= 1))
})
