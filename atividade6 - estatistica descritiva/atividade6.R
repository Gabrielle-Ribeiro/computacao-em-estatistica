# Importando dados
df = read.csv("dados_atividades.csv", sep=";")

# 1 - Retire os indivíduos com 10 anos da amostra.
df <- df[df$Idade != 10,]
df <- na.omit(df)

# 2 - Construa uma tabela e um gráfico para representar a variável Faltas.
df$Faltas=factor(df$Faltas,
                 label = c("Nenhum dia (0 dias)", "1 ou 2 dias", 
                           "3 a 5 dias", "Mais de 5 dias"), 
                 level = 1:4)


tabela_faltas <- table(df$Faltas)
tabela_faltas

install.packages("ggplot2")
library("ggplot2")

ggplot(data = df, aes(x = Faltas)) +
  geom_bar()

# 3 - Crie uma nova variável Faltas2 que assume valor 0 se o indivíduo afirma que não faltou e 1 se faltou pelo menos uma vez na escola nos últimos 30 dias.

df$Faltas2 <- NA
df$Faltas2[df$Faltas == "Nenhum dia (0 dias)"] <- 0 
df$Faltas2[df$Faltas != "Nenhum dia (0 dias)"] <- 1

# 4 - Construa tabelas e gráficos para estudar a relação entre as variáveis Faltas2 e Notas.
df$Notas=factor(df$Notas,
                label = c("Baixa", "Média", "Alta"),
                level = 1:3)

tabela_faltas_notas <- table(df$Faltas2, df$Notas)
tabela_faltas_notas

ggplot(df, aes(x = Faltas2)) + 
  geom_bar(aes(fill = Notas), position = "dodge")


# 5 - O uso de inalantes e álcool está relacionado a idade do indivíduo? Como?

df$Alcool=factor(df$Alcool,
                 label = c("Não", "Sim"), 
                 level = 1:2)
df$Inalante=factor(df$Inalante,
                   label = c("Não", "Sim"),
                   level = 1:2)

ggplot(df, aes(x = Idade)) + 
  geom_bar(aes(fill = Alcool), position = "dodge")

# Dos alunos que já consumiram álcool, a maioria está entre os 13 e 14 anos.
# Mais da metade nessa faixa etária já fez consumo de bebidas alcoólicas.
# Poucos alunos de 11 anos já consumiram álcool. 

ggplot(df, aes(x = Idade)) + 
  geom_bar(aes(fill = Inalante), position = "dodge")

# Poucos alunos já fizeram uso de inalantes.
# O menor número de alunos que usou inalantes tem 11 anos.
# A partir dos 12 anos o número de alunos que já usou inalantes é maior.

# De acordo com os gráficos, pode-se dizer que quanto maior a idade, maior o
# número de alunos que utilizou álcool ou inalantes.
