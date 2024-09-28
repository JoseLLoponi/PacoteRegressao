#' @title Q-Q Plot dos Resíduos
#' @description
#' Esta função retorna o Q-Q Plot dos resíduos de um modelo ajustado para avaliar a suposição
#' de normalidade.
#'
#' Além disso, também é exibido o p-valor do teste de Shapiro-Wilks aplicado
#' nos resíduos, onde:
#
#' \deqn{H_0:\text{Os dados seguem uma distribuição normal.}}
#' -
#' \deqn{H_1:\text{Os dados não seguem uma distribuição normal.}}
#'
#' @param regressao Um modelo de regressão ajustado com a função `regressao()`.
#'
#' @return Q-Q Plot dos resíduos do modelo com os quantis teóricos no eixo x, os
#' quantis empíricos no eixo y e o p-valor do teste de Shapiro-Wilks na parte inferior.
#'
#' @examples
#' ajuste1 <- regressao(X = c('B'), Y = 'A', dados = sodad)
#' grafico_qq(ajuste1)
#' ajuste2 <- regressao(X = c('A', 'B'), Y = 'C', dados = sodad)
#' grafico_qq(ajuste2)
#' ajuste3 <- regressao(X = c('A', 'B', 'D'), Y = 'E', dados = sodad)
#' grafico_qq(ajuste3)
#' ajuste4 <- regressao(X = c('A', 'C', 'D', 'E'), Y = 'B', dados = sodad)
#' grafico_qq(ajuste4)
#'
#' @export
grafico_qq <- function(regressao){
  teste <- shapiro.test(regressao$residuos)
  pvalor <- round(teste$p.value, 3)
  grafico <- ggplot(data.frame(y = regressao$residuos), aes(sample = y)) +
    geom_qq() + geom_qq_line() + theme_classic() +
    labs(x = "Quantis Teóricos", y = "Quantis Empíricos",
         caption = glue('p-valor = {pvalor}'))
  return(grafico)
}
