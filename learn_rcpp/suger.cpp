#include <Rcpp.h>
using namespace Rcpp;


//operator + *, -, /, pow, <, <=, >, >=, ==, !=, ! sqrt
// [[Rcpp::export]]
NumericVector pdistC2(double x, NumericVector ys) {
  return sqrt(pow((x - ys), 2));
}

/*** R
x <- 2
y <- rnorm(10, 2, 1)
pdistR(x, y)
pdistC(x, y)
pdistC2(x, y)
*/

// Logical summary functions
// [[Rcpp::export]]
bool any_naC(NumericVector x) {
  return is_true(any(is_na(x)));
}

/*** R
  any_naR <- function(x) any(is.na(x))
  library(microbenchmark)
x0 <- runif(1e5)
x1 <- c(x0, NA)
x2 <- c(NA, x0)

microbenchmark(
  any_naR(x0), any_naC(x0),
  any_naR(x1), any_naC(x1),
  any_naR(x2), any_naC(x2))
*/


// Vector views
// A number of helpful functions provide a "view" of a vector: 
// head, tail, rep_each, rep_len, rev, seq_along, seq_len. 
// In R these would all produce copies of the vector, 
// but in Rcpp they simply point to the existing vector and 
// override the subsetting operator ([) to implement special behaviour. 
// This makes them very efficient: 
// rep_len(x, 1e6) does not have to make a million copies of x.

//
// Other useful functions
// Finally, there are a grab bag of sugar functions that 
// mimic frequently used R functions:
//
// Math functions: abs, acos, asin, atan, beta, ceil, 
// ceiling, choose, cos, cosh, digamma, exp, expm1, 
// factorial, floor, gamma, lbeta, lchoose, lfactorial, 
// lgamma, log, log10, log1p, pentagamma, psigamma, 
// round, signif, sin, sinh, sqrt, tan, tanh, tetragamma, 
// trigamma, trunc,
//
// Scalar summaries: mean, min, max, range, sum, sd and var.
//
// Vector summaries: cumsum, diff, pmin, and pmax
//
// Finding values: match, self_match, which_max, which_min
//
// duplicated, unique
//
// d/q/p/r for all standard distributions in R.

// noNA(x): this asserts that the vector x does not 
// contain any missing values, and allows optimisation of 
// some mathematical operations.
