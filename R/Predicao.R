#' @title Predição para Novos Valores
#' @description
#' Esta função retorna o valor predito da variável resposta para valores especificados dos
#' preditores com base em um modelo de regressão linear ajustado.
#'
#' @details
#' Os valores das covariáveis devem ser especificados na mesma ordem em que as covariáveis foram especificadas no ajuste do modelo de regressão.
#'
#' @param regressao Um modelo de regressão ajustado com a função `regressao()`.
#' @param predicao Um vetor numérico contendo os valores desejados para cada covariável
#'
#' @return Um valor que indica a predição da variável resposta com base nos valores especificados das variáveis preditoras.
#'
#' @examples
#' ajuste1 <- regressao(X = c('B'), Y = 'A', dados = sodad)
#' predicao(ajuste1, c(1))
#' ajuste2 <- regressao(X = c('A', 'B'), Y = 'C', dados = sodad)
#' predicao(ajuste2, c(1, 2))
#' ajuste3 <- regressao(X = c('A', 'B', 'D'), Y = 'E', dados = sodad)
#' predicao(ajuste3, c(1, 2, 3))
#' ajuste4 <- regressao(X = c('A', 'C', 'D', 'E'), Y = 'B', dados = sodad)
#' predicao(ajuste4, c(1, 2, 3, 4))
#'
#' @export
predicao <- function(regressao, predicao){
  predicao_com_intercepto <- c(1, predicao)
  if(length(predicao_com_intercepto) != length(regressao$coeficientes)){stop("O vetor de valores para as variáveis preditores deve ter comprimento igual ao número de variáveis preditoras.")}
  valor_predito <- t(regressao$coeficientes) %*% predicao_com_intercepto
  return(as.numeric(valor_predito))
}
