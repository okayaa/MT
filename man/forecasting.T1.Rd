% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/T1.R
\name{forecasting.T1}
\alias{forecasting.T1}
\title{Forecasting method for the T1 method}
\usage{
\method{forecasting}{T1}(model, newdata, includes_transformed_newdata = FALSE)
}
\arguments{
\item{model}{Object of class "T1" generated by \code{\link{T1}} or
\code{\link{generates_model}}(..., method = "T1").}

\item{newdata}{Matrix with n rows (samples) and p columns (variables). The
Data to be estimated. All data should be continuous values
and should not have missing values.}

\item{includes_transformed_newdata}{If \code{TRUE}, then the transformed data
for \code{newdata} are included in a
return object.}
}
\value{
A list containing the following components is returned.

 \item{M_hat}{Vector with length n. The estimated values of the dependent
               variable after the data transformation.}
 \item{y_hat}{Vector with length n. The estimated values after the inverse
               transformation from \code{M_hat}.}
 \item{model}{Object of class "T1" passed by \code{model}.}
 \item{n}{The number of samples for \code{newdata}.}
 \item{q}{The number of variables after the data transformation. q equals p.}
 \item{X}{If \code{includes_transformed_newdata} is \code{TRUE}, then the
           transformed data for \code{newdata} are included.}
}
\description{
\code{forecasting.T1} (via \code{\link{forecasting}}) estimates the dependent
  values based on the T1 model.
}
\examples{
# The value of the dependent variable of the following samples mediates
# in the stackloss dataset.
stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ]

# The following samples are data other than the unit space data and the test
# data.
stackloss_signal <- stackloss[-c(2, 9, 10, 11, 12, 19, 20, 21), ]

model_T1 <- T1(unit_space_data = stackloss_center,
               signal_space_data = stackloss_signal,
               subtracts_V_e = TRUE,
               includes_transformed_data = TRUE)

# The following test samples are chosen casually.
stackloss_test <- stackloss[c(2, 12, 19), -4]

forecasting_T1 <- forecasting(model = model_T1,
                              newdata = stackloss_test,
                              includes_transformed_newdata = TRUE)

(forecasting_T1$y_hat) # Estimated values
(stackloss[c(2, 12, 19), 4]) # True values

}
\references{
Taguchi, G. (2006). Objective Function and Generic Function (12).
    \emph{Journal of Quality Engineering Society, 14}(3), 5-9. (In Japanese)

  Inou, A., Nagata, Y., Horita, K., & Mori, A. (2012). Prediciton Accuracies
    of Improved Taguchi's T Methods Compared to those of Multiple Regresssion
    Analysis. \emph{Journal of the Japanese Society for Quality Control,
    42}(2), 103-115. (In Japanese)

  Kawada, H., & Nagata, Y. (2015). An application of a generalized inverse
    regression estimator to Taguchi's T-Method. \emph{Total Quality Science,
    1}(1), 12-21.
}
\seealso{
\code{\link{general_forecasting.T}} and \code{\link{T1}}
}
