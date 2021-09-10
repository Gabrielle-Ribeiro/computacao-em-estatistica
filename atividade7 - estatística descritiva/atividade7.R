# Setando work directory
getwd()
setwd("C:/Users/gabrielle.grg/Documents/CE1")
dir()

# Importando dados
df <- read.csv("dados_atividades.csv", sep=";")


# 1) Calcule média, desvio padrão e os quartis da variável Intromissao.

# Transformar os valores em numérico e retirar valores nulos
df$Intromissao <- as.numeric(gsub(",", ".", df$Intromissao))
df <- na.omit(df)

# Média
mean(df$Intromissao)

# Desvio padrão
sd(df$Intromissao)

# Quartis
quantile(df$Intromissao)


# 2) Represente a variável Intromissao por meio de um gráfico de ramo e folhas.
stem(df$Intromissao)


# 3) Represente a variável Intromissao por meio de um histograma. Utilize 15 classes de valores.

install.packages("ggplot2")
library("ggplot2")

ggplot(df) +
  geom_histogram(mapping = aes(x = Intromissao), bins = 15)

# 4) Construa boxplots para comparar a Intromissao dos participantes que experimentaram 
# álcool na vida e dos que não experimentaram.

# Transformando alcool em factor
df$Alcool <- factor(df$Alcool,
                 label = c("Não", "Sim"), 
                 level = 1:2)

ggplot(df, mapping = aes(x = Alcool, y = Intromissao)) +
  labs(x = "Já experimentou álcool na vida?", y = "Intromissão") +
  geom_boxplot()


# 5) Calcule as medidas resumo para a variável Autoeficácia para os três grupos formados pela variável Notas
df$Autoeficacia <- as.numeric(gsub(",", ".", df$Autoeficacia))

df$Notas = factor(df$Notas,
                    label = c("Baixas", "Médias", "Altas"),
                    level = 1:3)

# Grupo com notas baixas
df_notas_baixas <- df[df$Notas == "Baixas",]
mean(df_notas_baixas$Autoeficacia)
sd(df_notas_baixas$Autoeficacia)
quantile(df_notas_baixas$Autoeficacia)

# Grupo com notas médias
df_notas_medias <- df[df$Notas == "Médias",]
mean(df_notas_medias$Autoeficacia)
sd(df_notas_medias$Autoeficacia)
quantile(df_notas_medias$Autoeficacia)

# Grupo com notas baixas
df_notas_altas <- df[df$Notas == "Altas",]
mean(df_notas_altas$Autoeficacia)
sd(df_notas_altas$Autoeficacia)
quantile(df_notas_altas$Autoeficacia)

# 6) Construa um diagrama de dispersão com Intromissão, Autoeficácia e Antisocial.
# Quais são os valores do coeficiente de correlação para esse dados?

# Intromissão e Autoeficácia
ggplot(df) +
  geom_point(mapping = aes(x = Intromissao, y = Autoeficacia))

cor(df$Intromissao, df$Autoeficacia)  

# Intromissão e Antisocial
df$Antisocial <- as.numeric(gsub(",", ".", df$Antisocial))

ggplot(df) +
  geom_point(mapping = aes(x = Intromissao, y = Antisocial))

cor(df$Intromissao, df$Antisocial)  

# Autoeficácia e Antisocial
ggplot(df) +
  geom_point(mapping = aes(x = Autoeficacia, y = Antisocial))

cor(df$Autoeficacia, df$Antisocial)
