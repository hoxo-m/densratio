# Estimate Density Ratio p(x)/q(x) by KLIEP (Kullback-Leibler Importance Estimation Procedure)

Estimate Density Ratio p(x)/q(x) by KLIEP (Kullback-Leibler Importance
Estimation Procedure)

## Usage

``` r
KLIEP(x1, x2, sigma = "auto", kernel_num = 100, fold = 5, verbose = TRUE)
```

## Arguments

- x1:

  numeric vector or matrix. Data from a numerator distribution p(x).

- x2:

  numeric vector or matrix. Data from a denominator distribution q(x).

- sigma:

  positive numeric vector. Search range of Gaussian kernel bandwidth.

- kernel_num:

  positive integer. Number of kernels.

- fold:

  positive integer. Number of the folds of cross validation.

- verbose:

  logical (default TRUE).

## Value

KLIEP object that contains a function to compute estimated density
ratio.
