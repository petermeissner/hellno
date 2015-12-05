#' logical constant for FALSE
HELLNO <- FALSE

#' alternative data.frame() implementation
#'
#' \code{hellno::data.frame()} wraps up \code{base::data.frame()} so that
#' \code{stringAsFactors} is set to \code{HELLNO} ( \code{== FALSE} ) by default
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
#' @seealso \code{\link[base]{as.data.frame}}
as.data.frame <- function (
  x, row.names = NULL, optional = FALSE, stringsAsFactors=HELLNO, ...
)
{
  base::as.data.frame(
    x, row.names = NULL, optional = FALSE, stringsAsFactors=stringsAsFactors, ...
  )
}

