# Estimate alpha-Relative Density Ratio p(x)/(alpha p(x) + (1-alpha) q(x)) by RuLSIF (Relative unconstrained Least-Square Importance Fitting)

Estimate alpha-Relative Density Ratio p(x)/(alpha p(x) + (1-alpha) q(x))
by RuLSIF (Relative unconstrained Least-Square Importance Fitting)

## Usage

``` r
RuLSIF(
  x1,
  x2,
  sigma = 10^seq(-3, 1, length.out = 9),
  lambda = 10^seq(-3, 1, length.out = 9),
  alpha = 0.1,
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

- alpha:

  numeric value from 0.0 to 1.0. Relative parameter. Default 0.1.

- kernel_num:

  positive integer. Number of kernels.

- verbose:

  logical. Default TRUE.

## Value

RuLSIF object which has \`compute_density_ratio()\`.
