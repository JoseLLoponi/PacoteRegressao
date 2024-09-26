#' @title Regressão Linear Múltipla
#' @description
#' Esta função retorna um gráfico de valores preditos \eqn{\times} valores observados como base em modelo de regressão linear ajustado.
#'
#' @param regressao Um modelo de regressão ajustado com a função `regressao()`.
#'
#' @return Um gráfico de com valores preditos no eixo x e valores observados no eixo y.
#'
#' @examples
#' ajuste1 <- regressao(X = c('B'), Y = 'A', dados = sodad)
#' grafico_pred_obs(ajuste1)
#' ajuste2 <- regressao(X = c('A', 'B'), Y = 'C', dados = sodad)
#' grafico_pred_obs(ajuste2)
#' ajuste3 <- regressao(X = c('A', 'B', 'D'), Y = 'E', dados = sodad)
#' grafico_pred_obs(ajuste3)
#' ajuste4 <- regressao(X = c('A', 'C', 'D', 'E'), Y = 'B', dados = sodad)
#' grafico_pred_obs(ajuste4)
#'
#' @import ggplot2
#' @export
grafico_pred_obs <- function(regressao){
    grafico <- ggplot(data.frame(y = regressao$residuos + regressao$valores_preditos, x = regressao$valores_preditos), aes(x = x, y = y)) +
    geom_point() + theme_classic() +
    labs(x = "Valores Preditos", y = "Valores Observados")
    return(grafico)
}
