context("Testing: function arguments of base and hellno are the same")

test_that("data.frame()", {
  expect_true(
    all(
      names(as.list(args(hellno::data.frame))) %in%
      names(as.list(args(base::data.frame)))
    )
  )
})

test_that(
  "as.data.frame()",
  {
    expect_true(
    all(
      names(as.list(args(hellno::data.frame))) %in%
      names(as.list(args(base::data.frame)))
      )
    )
  }
)


context("rbind does not produce factors")

test_that(
  "just test it",
  {
    expect_true( lapply(rbind(data.frame(), "a"), class)=="character" )
    expect_true( lapply(rbind("a", data.frame()), class)=="character" )
    expect_true( lapply(base::rbind("a", data.frame(), data.frame("b")), class)=="character" )
    expect_true( lapply(base::rbind(data.frame(), data.frame("a")), class)=="character" )
  }
)