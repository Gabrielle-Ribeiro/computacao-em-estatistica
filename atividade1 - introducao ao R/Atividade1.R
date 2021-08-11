# Renda mensal de uma amostra de 10 famílias em dois anos consecutivos.
Renda_ano1 = c(5000, 3400, 4500, 3000, 3200, 8000, 1900, 2300, 9760, 1450)
Renda_ano2 = c(5140, 3000, 8000, 3000, 4500, 8700, 2000, 1200, 9000, 1900)

# Calculo do desvio médio absoluto da renda no primeiro ano
sum(abs(Renda_ano1 - mean(Renda_ano1)))/length(Renda_ano1)

# Criação do vetor Variação para armazenar o aumento percentual da renda das
# famílias em relação a renda no primeiro ano
Variação = c((Renda_ano2 - Renda_ano1) * 100 / (Renda_ano1))

# Calculo do desvio padrão do vetor Variação
sd(Variação)

