helloJavaWorld <- function() {
  hjw <- .jnew("sandbox.HelloJavaWorld")
  out <- .jcall(hjw, "S", "sayHello")
  return(out)
}