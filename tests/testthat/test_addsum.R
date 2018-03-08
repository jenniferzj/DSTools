context("Testing addsum")

test_that("the sum of two parameters", {
  expect_equal(addsum(2,3), 5)
})

test_that("Error messages are not working properly",{
  testthat::expect_error(addsum(3)
    , "Missing parameters")
})
