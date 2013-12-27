integer <- c(1L, 6L, 10L)
typeof(integer)
is.integer(integer)
is.double(integer)

x <- list(list(1, 2), c(3, 4))
y <- c(list(1, 2), c(3, 4))
str(x)
str(y)

typeof(x)
is.list(x)
is.recursive(x)

is.list(mtcars)
names(mtcars)
str(mtcars$mpg)

mod <- lm(mpg ~ wt, data = mtcars)
is.list(mod)
names(mod)
str(mod)
mod

# attributes
y <- 1:10
attr(y, "m_attribute") <- "this is a vector"
attr(y, "m_attribute")
attributes(y)

# create new object
structure(1:10, m_attribute = "this is a vector")

# special attributres : names(), class(), dim()
class(x)==class(list())
names(x)
dim(x)

# names setup, should be unique
# 1. during creation
x <- c(a=1, b=2, c=3)
# 2. modifying in place
x <- 1:3; names(x) <- c("a", "b", "c")
# 3. by creating a modified vector
x <- setNames(1:3, c("a", "b", "c"))

names(x)
str(x)
attributes(x)
attr(x, "names")
x
