# Introducing the hellno package
Peter Meißner  
2015-12-14  

![](http://cranlogs.r-pkg.org/badges/grand-total/hellno)
![](http://www.r-pkg.org/badges/version/hellno)


# Introduction

Base R's `stringsAsFactors` default setting within
  `data.frame()` and `as.data.frame()` to `TRUE` is supposedly the 
  most often complained about piece of code in the whole R infrastructure. 
  A search through the source code of all CRAN packages in December 2015 
  `https://github.com/search?utf8=%E2%9C%93&q=user%3Acran+stringsAsFactors&type=Code` 
  resulted in 3,795 results for mentions of `stringsAsFactors` and most of 
  them simply set the value to `FALSE`.
  
  The hellno package provides an explicit solution to the problem without 
  changing R itself or having to mess around with options. It tries to solve 
  this problem by providing alternative `data.frame()` and `as.data.frame()` 
  functions that are in fact simple wrappers around base R's `data.frame()` and 
  `as.data.frame()` with `stringAsFactors` option set to `HELLNO` 
  (which in turn equals to `FALSE`; see here
  [tweet1](https://twitter.com/quominus/status/661511485483450368), here [tweet2](https://twitter.com/xieyihui/status/655063106024964096), here [tweet3](https://twitter.com/stefanbache/status/672796075263180800), and very much here [sillylogic](https://github.com/nutterb/sillylogic/blob/master/README.md)) by default.

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
providing `as.data.frame()` and `data.frame()` with `stringsAsFactors` option 
consistently set to `FALSE` throughout the whole package. 
Once imported `stringsAsFactors=FALSE` will be the default for all uses of `data.frame()` and `as.data.frame()` within all package functions BUT NOT OUTSIDE OF IT. 
Thus it provides a way to ease programming while also ensuring that package users can
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


... and once again to bring the point home: 


```r
data.frame(a=letters[1:2])$a 
```

```
## [1] a b
## Levels: a b
```

***WRITING PACAKGES WITH HELLNO DOES NOT CHANGE OUTSIDE BEHAVIOR.***

Have fun. 
