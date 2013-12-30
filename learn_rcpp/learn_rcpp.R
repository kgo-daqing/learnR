library(Rcpp)
cppFunction('
  int add(int x, int y, int z) {
    int sum = x + y + z;
    return sum;
  }
')

add
add(1, 2, 3)

# c fib
cppFunction('
  int cfib(int n) {
    if (n==0 || n==1)
      return n;
    else return cfib(n-1) + cfib(n-2);
  }            
')

# cfib is fast, compare with with jFib()
cfib(3)
system.time(cfib(43))
system.time(jFib(43))

# scalar input, scalar output
sigR <- function(x) {
  if (x>0) 1
  else if (x<0) -1
  else 0
}

cppFunction('
  int sigC(double x) {
    return x>0 ? 1 : x<0 ? -1 : 0;
  }
')
sigR(0.00001)
sigC(-0.00001)

# vector input, scalar output
sumR <- function(x) {
  total <- 0
  for (i in seq_along(x)) {
    total <- total + x[i]
  }
  total
}

cppFunction('
 double sumC(NumericVector x) {
  int n = x.size();
  double total =0;
  for (int i=0; i<n; i++) {
    total += x[i];
  }
  return total;
 }            
')

x <- rnorm(10)
sumR(x)
sumC(x)

library(microbenchmark)
x <- runif(1000)
microbenchmark(
  sum(x),
  sumR(x),
  sumC(x)
  );

# vector input, vector output
pdistR <- function(x, ys) {
  sqrt( (x - ys) ^ 2)
}

cppFunction('
  NumericVector pdistC(double x, NumericVector ys) {
    int n = ys.size();
    NumericVector out(n);
    NumericVector newout = clone(ys);
    for (int i=0; i<n; i++) {
      newout[i] = sqrt(pow(ys[i] - x, 2.0));
    }
    return newout;
  }
            ')

x <- 2
y <- rnorm(10, 2, 1)
pdistR(x, y)
pdistC(x, y)

# Matrix input, vector output
cppFunction('
  NumericVector rowSumsC(NumericMatrix x) {
    int nrow = x.nrow(), ncol = x.ncol();
    NumericVector out(nrow);

    for (int i=0; i<nrow; i++)  {
      double total = 0;
      for (int j=0; j<ncol; j++) {
        total += x(i, j);
      }
      out[i] = total;
    }
    return out;
  }
            ')

x <- matrix(sample(100), 10)
rowSums(x)
rowSumsC(x)

sourceCpp(file="/home/daqing/R/workspace/learnR/learn_rcpp/file.cpp");

