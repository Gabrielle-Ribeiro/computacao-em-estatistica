# Importar os dados no R
getwd() 
setwd("/home/gabbi/Documentos/ce1/computacao-em-estatistica/atividade-2")
dir()

dados = read.csv("dados_atividades.csv", sep=";")

# Verificar os tipos de variáveis resentes no arquivo
str(dados)

# Visualizar apenas os 10 primeiros indivíduos do arquivo
dados[1:10, ]

# Criar um novo dataframe no R com apenas os indivíduos com notas baixas 
# (codificação da variável: 1=Baixas, 2=Médias e 3=Altas)
dataframe_notas_baixas <- dados[dados$Notas == 1,]
dataframe_notas_baixas

# Crie um novo dataframe com apenas indivíduos de 11 a 14 anos 
# e que não tenha as variáveis Futuro e Ano escolar
dataframe_faixa_etaria <- dados[dados$Idade >= 11 & dados$Idade <= 14, -c(2,11)]
dataframe_faixa_etaria

# No primeiro dataframe: crie uma nova variável Autoeficácia2 com os valores
# da variável Autoeficácia transformando para uma escala de 0 a 10 
# (a escala original é de 1 a 5).
dataframe_notas_baixas$Autoeficacia <- as.numeric(gsub(",", ".", dataframe_notas_baixas$Autoeficacia))
dataframe_notas_baixas$Autoeficácia2 <- dataframe_notas_baixas$Autoeficacia * 2.5 - 2.5
dataframe_notas_baixas
