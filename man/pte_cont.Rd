\name{pte_cont}
\alias{pte_cont}
\title{PTE estimation with a continuous surrogate marker}
\usage{
pte_cont(sob, yob, aob, var = TRUE, conf.int = TRUE, rep = 500)
}
\arguments{
\item{sob}{CONTINUOUS surrogate marker}

\item{yob}{outcome of interest (continuous or binary)}

\item{aob}{treatment assignment (1: treatment; 0: control)}

\item{var}{whether variance should be calculated (TRUE/FALSE)}

\item{conf.int}{whether 95\% confidence intervals should be calculated (TRUE/FALSE)}

\item{rep}{number of resampling replications (default is 500)}
}
\description{
PTE estimation with continuous surrogate marker
}
\value{
  \item{Estimates}{Estimates of the treatment effect on the priamry outcome, delta, the treatment effect on the transformation of the surrogate, delta.gs, two versions of the proportion of treatment effect explained    by the surrogate, pte1 and pte2; if var = TRUE, standard error estimates are also provided (se); if conf.int = TRUE, 95\% confidence intervals are also provided}
  \item{Transformed.S}{the transformed surrogate, g(s), for each value of the surrogate, s; if var = TRUE, standard error estimates are also provided (se); if conf.int = TRUE, 95\% confidence intervals are also provided}
}
\examples{
data(marker_cont)
out <- pte_cont(
  sob = marker_cont$sob, 
  yob = marker_cont$yob, 
  aob = marker_cont$aob, var = FALSE, conf.int = FALSE)
out

x <- as.numeric(names(out$Transformed.S))
plot(x, out$Transformed.S, ylim = range(out$Transformed.S), type = "l", 
     las = 1, xlab = "Surrogate Marker", ylab = "Optimal Transformation")

\donttest{
out <- pte_cont(
  sob = marker_cont$sob, 
  yob = marker_cont$yob, 
  aob = marker_cont$aob, 
  var = TRUE, conf.int = TRUE, rep = 1000)
out$Estimates

x <- as.numeric(rownames(out$Transformed.S))
plot(x, out$Transformed.S[, "est"], ylim = range(out$Transformed.S[, -2]), type = "l", 
     las = 1, xlab = "Surrogate Marker", ylab = "Optimal Transformation")
  lines(x, out$Transformed.S[, "lower"], lty = 2)
  lines(x, out$Transformed.S[, "upper"], lty = 2)
}
}
