jFib <- function(n) {
  hjw <- .jnew("sandbox.Fibonacci")
  out <- .jcall(hjw, "I", "fibonacci", as.integer(n))
  return(out)
}