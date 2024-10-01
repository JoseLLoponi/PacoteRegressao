#' @title Regressão Linear Múltipla
#' @description
#' Esta função ajusta um modelo de regressão linear múltipla com intercepto.
#' \deqn{Y_{n \times 1}=X_{n \times p}\beta_{p \times 1} + \epsilon_{n \times 1}}
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
#' Encontra o erro padrão dos coeficientes estimados da seguite forma:
#' \deqn{\hat{ep}(\hat{\beta}) = \sqrt{\frac{\hat{\epsilon}^T\hat{\epsilon}}{n-p}diag((X^TX)^{-1})}}
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
  n <- nrow(matrizX)
  p <- ncol(matrizX)
  ete <- t(residuos) %*% residuos
  XtX_inv <- solve(t(matrizX) %*% matrizX)
  XtX_inv_diag <- as.vector(diag(XtX_inv))
  erro_padrao <- as.matrix(sqrt(as.vector((ete/(n-p))) * XtX_inv_diag))
  rownames(erro_padrao) <- nomes_coeficientes
  if(sum(abs(residuos)) < 1e-10){warning('O modelo se ajustou quase perfeitamente aos dados, possivelmente está incorreto.')}
  return(list(coeficientes = coeficientes, residuos = residuos,
              valores_preditos = valores_preditos, erro_padrao = erro_padrao))
}
