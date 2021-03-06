% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PO.R
\name{PO}
\alias{PO}
\title{NPMLE for Logistic-CoxPH Cure-Rate Model}
\usage{
PO(formula, data, C, df, weights, subset, init,control,
singular.ok = TRUE,model = FALSE,x = FALSE, y = TRUE, tt,
method = c('U-method','B-spline','NPMLE','glasso','glasso-PLH'),...)
}
\arguments{
\item{formula}{a formula object, with the response on the left of a ~
operator, and the terms on the right. The response must be a survival object
as returned by the \code{Surv.cure} function.}

\item{data}{a \code{data.frame} in which to interpret the variables named in
the \code{formula}, or in the \code{subset} and the \code{weights} argument.}

\item{C}{Censoring time}

\item{df}{degree of freedom}

\item{weights}{vector of case weights, see the note below. For a thorough
discussion of these see the book by Therneau and Grambsch.}

\item{subset}{expression indicating which subset of the rows of data should
be used in the fit. All observations are included by default.}

\item{init}{vector of initial values of the iteration. Default initial value
is zero for all variables.}

\item{control}{Object of class \code{PO.control} specifying iteration
limit and other control options. Default is \code{PO.control(...)}.}

\item{singular.ok}{logical value indicating how to handle collinearity in
the model matrix. If \code{TRUE}, the program will automatically skip over
columns of the X matrix that are linear combinations of earlier columns.
In this case the coefficients for such columns will be \code{NA}, and the
variance matrix will contain zeros. For ancillary calculations, such as the
linear predictor, the missing coefficients are treated as zeros.}

\item{model}{logical value: if \code{TRUE}, the model frame is returned in
component model.}

\item{x}{logical value: if \code{TRUE}, the x matrix is returned in
component \code{x}.}

\item{y}{logical value: if \code{TRUE}, the response vector is returned in component \code{y}.}

\item{tt}{optional list of time-transform functions.}

\item{method}{a character string specifying the method in \code{c('U-method',
'B-spline','NPMLE')} for estimation. The default method is the \code{U-method}.}

\item{...}{other parameters passed to \code{PO.control}.}
}
\description{
NPMLE for Logistic-CoxPH Cure-Rate Model
}
\examples{
 # A simulated data set
require(survival)
data('sim_PO_data')
res = PO(Surv(X, delta) ~ Z[,1]+ Z[,2]+ Z[,3],data = sim_PO_data)
# Or you may generate another one
set.seed(1)
df = 10
nn = 1000
beta = c(0.5,0,-0.5, rep(0,10))
sim_PO_data = PO.sim(nn, beta,
                     C.gen = function(n)
                       5+rbinom(n,1,0.5)*runif(n, -5, 0))
# Fit PO model
res = PO(Surv(X, delta) ~ Z[,1]+ Z[,2]+ Z[,3]+ Z[,4]+ Z[,5]+ Z[,6],data = sim_PO_data)
}
\author{
Jue Hou
}
