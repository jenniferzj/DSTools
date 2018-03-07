#'
#'
#'
#'
  context("Testing Function_ideas")
  test_that("length of Samples does not matche the parameter", {
  ss <- Function_ideas(samples = 51)
  expect_equal(length(ss), 51)
  })

  test_that("Error messages are not working properly",{
    testthat::expect_error(Function_ideas(0)
                           , "The number of samples needs to be greater than 0")
  })
