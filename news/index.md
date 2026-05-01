# Changelog

## densratio 0.3.1

CRAN release: 2026-04-29

### Bug fixes

- Fix [`KLIEP()`](http://hoxo-m.github.io/densratio/reference/KLIEP.md)
  so that `compute_density_ratio()` evaluates density ratios for the
  input data passed to the function, rather than reusing the training
  data ([\#13](https://github.com/hoxo-m/densratio/issues/13)).

## densratio 0.2.1

CRAN release: 2019-06-30

### New feature

- Implement RuLSIF \[Yamada et al. 2011\] to estimate relative density
  ratio.

## densratio 0.1.1

CRAN release: 2019-05-08

### Bug fix

- Modify Euclidean distance to square Euclidean distance in the function
  that computes Gaussian kernel
  ([\#6](https://github.com/hoxo-m/densratio/issues/6),
  [@ya103](https://github.com/ya103)). It affects all algorithms in the
  packages.
