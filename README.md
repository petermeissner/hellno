# README
Peter Meißner  
`r Sys.Date()`  

# Introduction

Base R's once done choice of setting stringsAsFactors within
  `data.frame()` and `as.data.frame()` to TRUE by default is a design decision
  that makes sense on the one hand and on the other hand is supposedly the most
  often complained about piece of code in the R infrastructure. The hellno
  package provides an explicit solution to the problem without changing R itself 
  or having to mess around with options. It tries to solve this problem by 
  providing alternative `data.frame()` and `as.data.frame()` functions that are 
  in fact simple wrappers around base R's `data.frame()` and `as.data.frame()` 
  with `stringAsFactors` option set to `HELLNO` (equals to `FALSE`) by default.

# Using hellno interactively

**R's default behaviour...**

```r
df1 <- data.frame(a=letters[1:3])
df1$a
```

```
## [1] a b c
## Levels: a b c
```

```r
class(df1$a)
```

```
## [1] "factor"
```


**R's default behaviour after loading the package**

```r
library(hellno)
```

```
## 
## Attaching package: 'hellno'
## 
## Die folgenden Objekte sind maskiert von 'package:base':
## 
##     as.data.frame, data.frame
```

```r
df2 <- data.frame(a=letters[1:3])
df2$a
```

```
## [1] "a" "b" "c"
```

```r
class(df2$a)
```

```
## [1] "character"
```

# Using hellno for package development

While using the hellno package in interactive R mode is nice, in fact it could 
have been achieved simply by doing something like this: `options("stringsAsFactors"=FALSE)`. 
The strength of hellno is that it can be imported when writing packages and therefore 
providing `as.data.frame()` and `data.frame()` with `stringsAsFactors` Option 
consistently set to `FALSE`. Once imported `stringsAsFactors=FALSE` will be the default for all uses of `data.frame()` and `as.data.frame()` within all package functions BUT NOT OUTSIDE OF IT. 
Thus it provides a way to ease programming while also ensuring that package users might 
still choose which flavor of `stringsAsFactors` they like best. 


Let us see how this works following a little example. Again, let us start with loading hellno package:


```r
library(hellno)
data.frame(a=letters[1:2])$a 
```

```
## [1] "a" "b"
```

As shown before, character vector are not transformed to factor.

We unload hellno again to start clean. 


```r
unloadNamespace("hellno")
```

Now we install the hellnotest package from Github and load it. The package uses hellno internally in two functions. While internal uses of `data.frame()` and `as.data.frame()` will work with `stringsAsFactors=FALSE` as default this does not change how things work everywhere else. 



```r
if( !("hellnotests" %in% installed.packages()) ){
  devtools::install_github("petermeissner/hellnotests")
}

library(hellnotests)
data.frame(a=letters[1:2])$a 
```

```
## [1] a b
## Levels: a b
```

While all functions within the package use hellno's alternative implementations:


```r
hellno_df
```

```
## function () 
## {
##     data.frame(a = letters[1:3])$a
## }
## <environment: namespace:hellnotests>
```

... and hence for them string conversion is no matter anymore:


```r
hellno_df()
```

```
## [1] "a" "b" "c"
```






