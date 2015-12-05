#' logical constant for FALSE
HELLNO <- FALSE

#' alternative data.frame() implementation
#'
#' \code{hellno::data.frame()} wraps up \code{base::data.frame()} so that
#' \code{stringAsFactors} is set to \code{HELLNO} ( \code{== FALSE} ) by default
#' @param row.names see \code{\link[base]{data.frame}}
#' @param check.rows see \code{\link[base]{data.frame}}
#' @param check.names see \code{\link[base]{data.frame}}
#' @param ... see \code{\link[base]{data.frame}}
#' @param stringsAsFactors see \code{\link[base]{data.frame}} by default set to \code{FALSE}
#' @seealso \code{\link[base]{data.frame}}
data.frame <- function (
    ..., row.names = NULL, check.rows = FALSE,
    check.names = TRUE, stringsAsFactors = HELLNO
  )
{
  base::data.frame(
    ..., row.names=row.names, check.rows=check.rows,
    check.names=check.names, stringsAsFactors=stringsAsFactors
  )
}

#' alternative as.data.frame() implementation
#'
#' \code{hellno::as.data.frame()} wraps up \code{base::as.data.frame()} so that
#' \code{stringAsFactors} is set to \code{HELLNO} ( \code{== FALSE} ) by default
#' @param x see \code{\link[base]{as.data.frame}}
#' @param row.names see \code{\link[base]{as.data.frame}}
#' @param optional see \code{\link[base]{as.data.frame}}
#' @param stringsAsFactors see \code{\link[base]{as.data.frame}} by default set to \code{FALSE}
#' @param ... see \code{\link[base]{as.data.frame}}
#' @seealso \code{\link[base]{as.data.frame}}
as.data.frame <- function (
  x, row.names = NULL, optional = FALSE, stringsAsFactors=HELLNO, ...
)
{
  base::as.data.frame(
    x, row.names = NULL, optional = FALSE, stringsAsFactors=stringsAsFactors, ...
  )
}

