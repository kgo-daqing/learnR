library(jvmr)

a <- scalaInterpreter()
b <- javaInterpreter()

# Define function in Scala
interpret(a, '
  def fib( n: Int): Int = n match {
    case 0 | 1 => n
    case _ => fib( n -1) + fib( n-2)
  }
')

# Define function in java
interpret(b, '
  int fib(int n) {
    if (n==0 || n==1)
      return n;
    return (fib(n-1) + fib(n-2));
  }
')

# Define function in R
fib <- function(n) {
  if (n >1) fib(n-1) + fib(n-2)
  else n
}

# testing
  
# time performance, scala is way faster
system.time(fib(33))
system.time(a['fib(33)'])
system.time(b['fib(33)'])
system.time(jFib(33))

# Define variable
interpret(a, "num") <- 3.4
interpret(a, "num")
interpret(b, "num") <- 4.5
interpret(b, "num")

# or shortcut
a["num"] <- 3.5
a["num"]
b["num"] <- 4.5
b["num"]
b["int[] c = {0, 1, 2, 3, 4, 5}"]
b["c"]

# using loops
interpret(a, "message") <- c("Hello", "World", "!")
interpret(a, "message")
interpret(a,'
  message.foreach{ x => println("<"+x+">") }
', echo.output=TRUE)
interpret(b,"message2") <- c("Hello","World","Again","!")
interpret(b,"message2")
interpret(b,'
  System.out.println(message2.length);
  for(int i = 0; i < message2.length; i++) 
  {
    System.out.println("<" + message2[i] + ">");
  }
', echo.output=TRUE)
# no prints in java interpret

b["message2"]

# assign variables using argument list
interpret(a,'
          val d = "Zero"
          val b = "${1}"
          val d2 = "Two"
          ', "One")
a["d2"]

b['
  String arg1 = "${1}";
  String arg2 = "${2}";
  String statement = "Skies" + arg1 + arg2;
  '," are ","blue"]
b['statement']


# simplify
(c <- a['Range(0,100).toArray'])
(c <- a['Range(0,100).toArray', simplify=FALSE])
# Pulling values from java into r
b["int[] c = {0, 1, 2, 3, 4, 5}"]
b["c"]
c <- b["c"]
c
d <- b["c", simplify=FALSE]
d

# infer type
(random <- a["new java.util.Random"])

# type
my.list <- a['List[Double](1.0, 2.3, 5.6)']
a["myList","List[Double]"] <- my.list
a["myList"]

a["who"] <- "David"
a["who"]

system.time(
  for ( i in 1:100 ) { cat(interpret(a,"who"),"\n") }
)
system.time(
  interpret(a,'for ( i <- 0 until 1000 ) println(who)')
)

b["who"] <- "David"
b["who"]
system.time(
  for ( i in 1:1000 ) { cat(interpret(b,"who"),"\n") }
)
system.time(
  interpret(b,'
  for (int i=0; i < 1000; i++) 
    java.lang.System.out.println(who)
  ')
)

