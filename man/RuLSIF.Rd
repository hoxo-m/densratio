% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/RuLSIF.R
\name{RuLSIF}
\alias{RuLSIF}
\title{Estimate alpha-Relative Density Ratio p(x)/(alpha p(x) + (1-alpha) q(x))
by RuLSIF (Relative unconstrained Least-Square Importance Fitting)}
\usage{
RuLSIF(x1, x2, sigma = 10^seq(-3, 1, length.out = 9),
  lambda = 10^seq(-3, 1, length.out = 9), alpha = 0.1,
  kernel_num = 100, verbose = TRUE)
}
\arguments{
\item{x1}{numeric vector or matrix. Data from a numerator distribution p(x).}

\item{x2}{numeric vector or matrix. Data from a denominator distribution q(x).}

\item{sigma}{positive numeric vector. Search range of Gaussian kernel bandwidth.}

\item{lambda}{positive numeric vector. Search range of regularization parameter.}

\item{alpha}{numeric value from 0.0 to 1.0. Relative parameter. Default 0.1.}

\item{kernel_num}{positive integer. Number of kernels.}

\item{verbose}{logical. Default TRUE.}
}
\value{
RuLSIF object which has `compute_density_ratio()`.
}
\description{
Estimate alpha-Relative Density Ratio p(x)/(alpha p(x) + (1-alpha) q(x))
by RuLSIF (Relative unconstrained Least-Square Importance Fitting)
}
