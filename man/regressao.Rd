% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Regressao.R
\name{regressao}
\alias{regressao}
\title{Regressão Linear Múltipla}
\usage{
regressao(X, Y, dados)
}
\arguments{
\item{X}{Um vetor de strings contendo os nomes das colunas das variáveis independentes.}

\item{Y}{Uma string contendo o nome da coluna da variável dependente.}

\item{dados}{O conjunto de dados.}
}
\value{
Uma lista contendo os coeficientes estimados, os resíduos e os valores preditos.
}
\description{
Esta função ajusta um modelo de regressão linear múltipla com intercepto.
\deqn{Y_{n \times 1}=X_{n \times p}\beta_{p \times 1} + \epsilon_{n \times 1}}

Encontra a estimativa dos coeficientes de uma regressão linear utilizando o método dos quadrados mínimos:
\deqn{\hat{\beta}=(X^TX)^{-1}X^TY}

Encontra os valores preditos do modelo da seguinte forma:
\deqn{\hat{Y}=X\hat{\beta}}

Encontra os resíduos do modelo da seguite forma:
\deqn{\hat{\epsilon}=Y-X\hat{\beta}}

Encontra o erro padrão dos coeficientes estimados da seguite forma:
\deqn{\hat{ep}(\hat{\beta}) = \sqrt{\frac{\hat{\epsilon}^T\hat{\epsilon}}{n-p}diag((X^TX)^{-1})}}
}
\details{
Somente realiza cálculos para variáveis quantitativas.
}
\examples{
regressao(X = c('B'), Y = 'A', dados = sodad)
regressao(X = c('A', 'B'), Y = 'C', dados = sodad)
regressao(X = c('A', 'B', 'D'), Y = 'E', dados = sodad)
regressao(X = c('A', 'C', 'D', 'E'), Y = 'B', dados = sodad)

}
