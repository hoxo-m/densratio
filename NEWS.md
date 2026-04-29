# densratio 0.3.0

## Bug fixes

* Fix `KLIEP()` so that `compute_density_ratio()` evaluates density ratios for the input data passed to the function, rather than reusing the training data (#13).

# densratio 0.2.1

## New feature

* Implement RuLSIF [Yamada et al. 2011] to estimate relative density ratio.

# densratio 0.1.1

## Bug fix

* Modify Euclidean distance to square Euclidean distance in the function that computes Gaussian kernel (#6, @ya103). It affects all algorithms in the packages.
