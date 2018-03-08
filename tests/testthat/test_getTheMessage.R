
context("Testing get_the_message")
test_that("test the message is correct according to the given temperature ", {
expect_equal(get_the_message(20), "cool")
})

