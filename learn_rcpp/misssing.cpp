#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List scalar_missings() {
  int int_s = NA_INTEGER;
  String chr_s = NA_STRING;
  bool lgl_s = NA_LOGICAL;
  double num_s = NA_REAL;

  return List::create(int_s, chr_s, lgl_s, num_s);
}

/*** R
  str(scalar_missings())
*/

// [[Rcpp::export]]
List missing_sampler() {
  return(List::create(
    NumericVector::create(NA_REAL), 
    IntegerVector::create(NA_INTEGER),
    LogicalVector::create(NA_LOGICAL), 
    CharacterVector::create(NA_STRING)));
}

/*** R
  str(missing_sampler())
*/