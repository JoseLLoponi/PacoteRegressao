sodad2 <- cbind(sodad, `F` = 2*(sodad$E))
sodad3 <- cbind(sodad, `F` = rep(2, 10))
sodad4 <- cbind(sodad, `F` = apply(sodad, 1, sum))
sodad5 <- head(sodad, 3)

test_that("regressao", {
  expect_equal(round(as.vector(regressao(X = c('A', 'B'), Y = 'C', dados = sodad)$coeficientes), 3),
               c(36.532, -0.223, 0.213))
  expect_equal(round(as.vector(regressao(X = c('A', 'B', 'D'), Y = 'E', dados = sodad)$erro_padrao), 3),
               c(24.232,  0.378, 0.252, 9.776))
  expect_equal(round(as.vector(regressao(X = c('B'), Y = 'A', dados = sodad)$residuos), 3),
               c(2.161, 28.835, -19.333, 15.432, -31.613, 12.286, 8.024, -3.731, -10.646, -1.415))
  expect_error(regressao(X = c('A', 'E', 'F'), Y = 'C', dados = sodad2))
  expect_error(regressao(X = c('A', 'B', 'F'), Y = 'C', dados = sodad3))
  expect_error(regressao(X = c('A', 'B', 'C', 'D'), Y = 'E', dados = sodad5))
  expect_warning(regressao(X = c('A', 'B', 'C', 'D', 'E'), Y = 'F', dados = sodad4))
})
