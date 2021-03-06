% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generates_transformation_functions.R
\name{generates_transformation_functions_Tb}
\alias{generates_transformation_functions_Tb}
\title{Function to generate data transformation functions for the Tb methods}
\usage{
generates_transformation_functions_Tb(sample_data, subtracts_V_e)
}
\arguments{
\item{sample_data}{Matrix with n rows (samples) and (p + 1) columns
(variables). The Tb method uses all data to generate the
unit space. All data should be continuous values and
should not have missing values.}

\item{subtracts_V_e}{If \code{TRUE}, then the error variance is subtracted in
the numerator when calculating \code{eta_hat}.}
}
\value{
\code{generates_transformation_functions_Tb} returns a list
          containing three functions. For the first component, the data
          transformation function for independent variables is a function
          that subtracts the center of each independent variable. The center
          is determined in a specific manner for the Tb method. The center
          consists of each sample value which maximizes the signal-to-noise
          ratio (S/N) per independent variable. The values are determined
          independently so that different samples may be selected for
          different variables. For the second component, the data
          transformation function for a dependent variable is a function that
          subtracts the dependent variable of the sample which maximizes the
          S/N per independent variable. For the third component, the inverse
          function of the data transformation function for a dependent
          variable is a function that adds the weighted mean of a dependent
          variable. The weighted mean is calculated based on the S/N and the
          frequency of being selected in independent variables.
}
\description{
\code{generates_transformation_functions_Tb} is the argument for the
  parameter \code{generates_transform_functions} in \code{genera_T}, which
  is used in the Tb method.
}
\examples{
# The value of the dependent variable of the following samples mediates
# in the stackloss dataset.
stackloss_center <- stackloss[c(9, 10, 11, 20, 21), ]

tmp <- generates_transformation_functions_Tb(stackloss_center, TRUE)
center_subtraction_function <- tmp[[1]]
subtracts_ys <- tmp[[2]]
adds_M_0 <- tmp[[3]]

is.function(center_subtraction_function) # TRUE
is.function(subtracts_ys) # TRUE
is.function(adds_M_0) # TRUE

# Note that dynamic scope is used when the parameter "subtracts_V_e" is not
# set.
subtracts_V_e <- FALSE
tmp <- generates_transformation_functions_Tb(stackloss_center)
center_subtraction_function <- tmp[[1]]
subtracts_ys <- tmp[[2]]
adds_M_0 <- tmp[[3]]

is.function(center_subtraction_function) # TRUE
is.function(subtracts_ys) # TRUE
is.function(adds_M_0) # TRUE

}
\references{
Inou, A., Nagata, Y., Horita, K., & Mori, A. (2012). Prediciton Accuracies
    of Improved Taguchi's T Methods Compared to those of Multiple Regresssion
    Analysis. \emph{Journal of the Japanese Society for Quality Control,
    42}(2), 103-115. (In Japanese)

  Kawada, H., & Nagata, Y. (2015). An application of a generalized inverse
    regression estimator to Taguchi's T-Method. \emph{Total Quality Science,
    1}(1), 12-21.
}
\seealso{
\code{\link{Tb}}
}
