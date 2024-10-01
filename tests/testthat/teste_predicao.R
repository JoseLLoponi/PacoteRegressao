ajuste1 <- regressao(X = c('B'), Y = 'A', dados = sodad)
ajuste2 <- regressao(X = c('A', 'B'), Y = 'C', dados = sodad)
ajuste3 <- regressao(X = c('A', 'B', 'D'), Y = 'E', dados = sodad)
ajuste4 <- regressao(X = c('A', 'C', 'D', 'E'), Y = 'B', dados = sodad)

test_that("predicao", {
  expect_equal(round(predicao(ajuste1, c(2)), 3),
               40)
  expect_equal(round(predicao(ajuste1, c(3)), 3),
               40.415)
  expect_equal(round(predicao(ajuste2, c(4, 3)), 3),
               36.279)
  expect_equal(round(predicao(ajuste2, c(5, 7)), 3),
               36.907)
  expect_equal(round(predicao(ajuste3, c(0, 9, 9)), 3),
               145.571)
  expect_equal(round(predicao(ajuste3, c(1, 5, 6)), 3),
               120.654)
  expect_equal(round(predicao(ajuste4, c(4, 10, 5, 4)), 3),
               -1.111)
  expect_equal(round(predicao(ajuste4, c(0, 0, 0, 0)), 3),
               -19.116)
  expect_error((round(predicao(ajuste3, c(1, 'a', 6)), 3)))
  expect_error((round(predicao(ajuste3, c(1, 5, 6, 0)), 3)))
})
