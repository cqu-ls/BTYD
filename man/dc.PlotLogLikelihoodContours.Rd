% Generated by roxygen2 (4.0.2): do not edit by hand
\name{dc.PlotLogLikelihoodContours}
\alias{dc.PlotLogLikelihoodContours}
\title{Plot Log-Likelihood Contour}
\usage{
dc.PlotLogLikelihoodContours(loglikelihood.fcn, predicted.params, ...,
  n.divs = 2, multiple.screens = FALSE, num.contour.lines = 10,
  zoom.percent = 0.9, allow.neg.params = FALSE, param.names = c("param 1",
  "param 2", "param 3", "param 4"))
}
\arguments{
\item{loglikelihood.fcn}{log-likelihood function to plot.}

\item{predicted.params}{estimated parameters.}

\item{...}{all additional arguments required by the log-likelihood
function. For example, \code{\link{bgbb.rf.matrix.LL}} requires rf.matrix,
and \code{\link{pnbd.cbs.LL}} and \code{\link{bgnbd.cbs.LL}} require cal.cbs.}

\item{n.divs}{integer representing how fine-grained the contour
plot is. A higher value will produce a higher resolution plot with
smoother contour lines, but will take longer to plot. n.divs also
affects the boundaries of the contour plot; see details.}

\item{multiple.screens}{if TRUE, plots each contour plot on a
separate R graphics window.}

\item{num.contour.lines}{number of contour lines to plot in the
window.}

\item{zoom.percent}{determines boundaries of contour plot. See
details.}

\item{allow.neg.params}{if FALSE, the contour plot will not
include negative values (see details). This should be set to false
for the BG/BB and Pareto/NBD models.}

\item{param.names}{a vector containing parameter names.}
}
\description{
Creates a set of contour plots, such that there is a contour plot
for every pair of parameters varying.
}
\details{
For each contour plot, the non-varying parameters are kept
constant at the predicted values.

The contour will extend out by (n.divs * zoom.percent) in both
directions and both dimensions from the estimated parameter
values. The exception is if allow.neg.params is FALSE. In this
case, the contour plot will end at zero if it would have extended
into negative parameter values.

The estimated parameter values will be indicated by the
intersection of two red lines.
}
\examples{
# **Example for BG/BB model:
data(donationsSummary)
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
bgbb.startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
bgbb.est.params <- bgbb.EstimateParameters(rf.matrix, bgbb.startingparams)

# set up parameter names for a more descriptive result
bgbb.param.names <- c("alpha", "beta", "gamma", "delta")

# plot-log likelihood contours (not run):
# dc.PlotLogLikelihoodContours(bgbb.rf.matrix.LL, bgbb.est.params, rf.matrix = rf.matrix,
# 	n.divs = 5, num.contour.lines = 8, zoom.percent = 0.3, allow.neg.params = FALSE,
#	param.names = bgbb.param.names)

# **Example for Pareto/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# Speed up calculations:
cbs <- pnbd.compress.cbs(cbs)

# parameters estimated using pnbd.EstimateParameters
pnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
pnbd.param.names <- c("r", "alpha", "s", "beta")

# plot log-likelihood contours (not run):
# dc.PlotLogLikelihoodContours(pnbd.cbs.LL, pnbd.est.params, cal.cbs = cbs, n.divs = 5,
#                           num.contour.lines = 15, zoom.percent = 0.3,
#                            allow.neg.params = FALSE, param.names = pnbd.param.names)

# **Example for BG/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# parameters estimated using bgnbd.EstimateParameters
bgnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
bgnbd.param.names <- c("r", "alpha", "s", "beta")

# plot log-likelihood contours (not run):
# dc.PlotLogLikelihoodContours(bgnbd.cbs.LL, bgnbd.est.params, cal.cbs = cbs, n.divs = 5,
#                            num.contour.lines = 15, zoom.percent = 0.3,
#                            allow.neg.params = FALSE, param.names = bgnbd.param.names)
}
\seealso{
\code{\link{dc.PlotLogLikelihoodContour}}
}

