# Estimate Density Ratio p(x)/q(x) by uLSIF (unconstrained Least-Square Importance Fitting)

Estimate Density Ratio p(x)/q(x) by uLSIF (unconstrained Least-Square
Importance Fitting)

## Usage

``` r
uLSIF(
  x1,
  x2,
  sigma = 10^seq(-3, 1, length.out = 9),
  lambda = 10^seq(-3, 1, length.out = 9),
  kernel_num = 100,
  verbose = TRUE
)
```

## Arguments

- x1:

  numeric vector or matrix. Data from a numerator distribution p(x).

- x2:

  numeric vector or matrix. Data from a denominator distribution q(x).

- sigma:

  positive numeric vector. Search range of Gaussian kernel bandwidth.

- lambda:

  positive numeric vector. Search range of regularization parameter.

- kernel_num:

  positive integer. Number of kernels.

- verbose:

  logical(default TRUE).

## Value

uLSIF object that contains a function to compute estimated density
ratio.
