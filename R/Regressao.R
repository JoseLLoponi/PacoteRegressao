#' @title Regressão Linear Múltipla
#' @description
#' Esta função ajusta um modelo de regressão linear múltipla com intercepto.
#' \deqn{Y=X\beta + \epsilon}
#'
#' Encontra a estimativa dos coeficientes de uma regressão linear utilizando o método dos quadrados mínimos:
#' \deqn{\hat{\beta}=(X^TX)^{-1}X^TY}
#'
#' Encontra os valores preditos do modelo da seguinte forma:
#' \deqn{\hat{Y}=X\hat{\beta}}
#'
#' Encontra os resíduos do modelo da seguite forma:
#' \deqn{\hat{\epsilon}=Y-X\hat{\beta}}
#'
#' @details
#' Somente realiza cálculos para variáveis quantitativas.
#'
#' @param X Um vetor de strings contendo os nomes das colunas das variáveis independentes.
#' @param Y Uma string contendo o nome da coluna da variável dependente.
#' @param dados O conjunto de dados.
#'
#' @return Uma lista contendo os coeficientes estimados, os resíduos e os valores preditos.
#'
#' @examples
#' regressao(X = c('B'), Y = 'A', dados = sodad)
#' regressao(X = c('A', 'B'), Y = 'C', dados = sodad)
#' regressao(X = c('A', 'B', 'D'), Y = 'E', dados = sodad)
#' regressao(X = c('A', 'C', 'D', 'E'), Y = 'B', dados = sodad)
#'
#' @importFrom glue glue
#' @importFrom Matrix rankMatrix
#' @export
regressao <- function(X, Y, dados){
  dados_semNA <- na.omit(dados)
  matrizX <- rep(1, nrow(dados_semNA))
  for(i in X){
    matrizX <- cbind(matrizX, dados_semNA[[i]])
  }
  if(rankMatrix(matrizX)[1] != ncol(matrizX)){stop('A matriz de variáveis preditoras deve ter posto igual ao número de colunas')}
  vetorY <- dados_semNA[[Y]]
  coeficientes <- solve(t(matrizX) %*% matrizX, t(matrizX) %*% vetorY)
  nomes_coeficientes <- 0:(length(coeficientes)-1)
  for(i in nomes_coeficientes){nomes_coeficientes[i+1] <- glue("beta_{i}")}
  rownames(coeficientes) <- nomes_coeficientes
  valores_preditos <- matrizX %*% coeficientes
  residuos <- vetorY - valores_preditos
  return(list(coeficientes = coeficientes, residuos = residuos,
              valores_preditos = valores_preditos))
}
