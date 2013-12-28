x<- c(2.1, 4.2, 3.3, 5.4)

# subsetting vector
x[c(3, 1)]
x[order(x)]
x[c(1, 1)]
x[-c(3, 1)]
x[c(-1, 2)]
x[x<4]
x[c(T, F, T, F)]
x[c(T, F)]
x
x[]
x[0]

letters[1:4]
(y <- setNames(x, letters[1:4]))
y[c("d", "c", "a")]

(a <- matrix(1:9, nrow=3))
a[1:2,]
colnames(a) <- LETTERS[1:3]
a
a[1, c("B", "A")]

# subsetting matrix

(vals <- outer(1:5, 1:5, FUN="paste", sep=","))
vals[c(4, 15)]
select <- matrix(ncol = 2, byrow = TRUE, c(
  1, 1,
  3, 1,
  2, 4
  ))

df <- data.frame(x = 1:3, y = 3:1, z = letters[1:3])
df[df$x == 3, ]
df[c(1, 3), ]

# subset like a list
df[c("x", "z")]
# subset like a matrix
df[, c("x", "z")]

str(df["x"])
str(df[, "x"])

# exercises
mtcars
str(mtcars)
rownames(mtcars)
dim(mtcars)

mtcars[mtcars$cyl == 4, ]
mtcars[-(1:4), ]
mtcars[mtcars$cyl <= 5, ]
mtcars[mtcars$cyl == 4 | mtcars$cyl == 6, ]

# upper matrix
x <- outer(1:5, 1:5, FUN="*")
x[upper.tri(x)]

select <- matrix(ncol = 2, byrow = TRUE, c(
  1, 1,
  2, 2,
  3, 3,
  4, 4
))
select
x[select]
diag(x)


# simplifying preserving

var <- "cyl"
mtcars$cyl
mtcars[[var]]
# $ does partial matching


# applications
x <- c("m", "f", "u", "f", "f", "m", "m")
lookup <- c("m" = "Male", "f" = "Female", u = NA)
lookup[x]

grades <- sample(3, 5, rep = T)
info <- data.frame(
  grade = 1:3,
  desc = c("Poor", "Good", "Excellent"),
  fail = c(T, F, F)
  )

# use match
id <- match(grades, info$grade)
info[id, ]

# use rownames
rownames(info) <- info$grade
info[as.character(grades), ]

df <- data.frame(x = rep(1:3, each = 2), y = 6:1, z = letters[1:6])
nrow(df)

# order
x <- sample(6)
x
x[order(x)]
sort(x)

df <- data.frame(y = sample(6), x = sample(6), z = sample(letters[1:6]))
df[order(df$x), ]
df[order(df$y), ]
df[order(df$z), ]
df[, order(names(df))]
df
