\name{pte_disc}
\alias{pte_disc}
\title{PTE estimation with a discrete surrogate marker}
\usage{
pte_disc(sob, yob, aob, var = TRUE, conf.int = TRUE, rep = 500)
}
\arguments{
\item{sob}{DISCRETE surrogate marker}

\item{yob}{outcome of interest (continuous or binary)}

\item{aob}{treatment assignment (1: treatment; 0: control)}

\item{var}{whether variance should be calculated (TRUE/FALSE)}

\item{conf.int}{whether 95\% confidence intervals should be calculated (TRUE/FALSE)}

\item{rep}{number of resampling replications (default is 500)}
}
\description{
PTE estimation with discrete surrogate marker
}
\value{
  \item{Estimates}{Estimates of the treatment effect on the priamry outcome, delta, the treatment effect on the transformation of the surrogate, delta.gs, two versions of the proportion of treatment effect explained    by the surrogate, pte1 and pte2; if var = TRUE, standard error estimates are also provided (se); if conf.int = TRUE, 95\% confidence intervals are also provided}
  \item{Transformed.S}{the transformed surrogate, g(s), for each value of the surrogate, s; if var = TRUE, standard error estimates are also provided (se); if conf.int = TRUE, 95\% confidence intervals are also provided}
}
\examples{
data(marker_disc)
out <- pte_disc(
  sob = marker_disc$sob, 
  yob = marker_disc$yob, 
  aob = marker_disc$aob, var = FALSE, conf.int = FALSE)
out
\donttest{
out <- pte_disc(
  sob = marker_disc$sob, 
  yob = marker_disc$yob, 
  aob = marker_disc$aob, 
  var = TRUE, conf.int = TRUE, rep = 1000)
out
}
}