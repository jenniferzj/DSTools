context("Testing getlarge")

test_that("get the larger number", {
  expect_equal(getlarge(2,10), 10)
})

test_that("Error messages are not working properly",{
  testthat::expect_error(getlarge('a',0)
    , "The input parameters both should be numbers")
})
