getwd()
setwd("/home/gabbi/Documentos/ce1/computacao-em-estatistica/atividade3 - manipulando dados no R")
dir()

dados = read.csv("dados_atividades.csv", sep=";", encoding="latin1")

# 1) Verificar os tipos de variáveis presentes no banco de dados
str(dados)

# 2) Gerar uma nova coluna no dataframe com número de caracteres das respostas da 
# variável Futuro
dados$Futuro = as.character(dados$Futuro)
dados$Num_char_futuro = nchar(dados$Futuro)

# 3) Criar um novo banco de dados (que será usado em outras atividades) que 
# contenha apenas indivíduos que responderam a questão relacionada ao futuro e 
# que têm respostas válidas para a variável Ano_escolar

novoDataframe = subset(dados, Num_char_futuro>0 & !is.na(Ano_escolar))

# 4) Criar uma nova variável Futuro2 no novo dataframe com apenas  os primeiros 
# 15 caracteres da variável Futuro. Todas as letras da variável devem estar em
# letras maiúsculas.

novoDataframe$Futuro2 = toupper(substr(novoDataframe$Futuro, 1, 15))

# 5) Excluir a variável Futuro (a original) e a variável gerada no item 2.

novoDataframe <- novoDataframe[,-c(2,15)]

# 6) Renomear as variáveis: Alcool: Alcool_vida, Inalante: Inalante_vida

names(novoDataframe)[names(novoDataframe) == "Alcool"] <- "Alcool_vida"
names(novoDataframe)[names(novoDataframe) == "Inalantes"] <- "Inalante_vida"

# 7) Transformar as variáveis em fatores. Atribuir os rótulos às categorias:

novoDataframe$Faltas = factor(novoDataframe$Faltas, 
                              labels = c("Nenhum dia (0 dias)", 
                                        "1 ou 2 dias",
                                        "3 a 5 dias", 
                                        "Mais de 5 dias"), 
                              levels = 1:4)

novoDataframe$Dever = factor(novoDataframe$Dever,
                             labels = "Nunca", "Raramente", "Várias vezes", "Muitas vezes", "Sempre",
                             levels = 1:5)

novoDataframe$Gosta_escola = factor(novoDataframe$Gosta_escola,
                                    labels = "Detesto", "Não gosto", "Gosto pouco", "Gosto bastante", "Adoro",
                                    levels = 1:5)

novoDataframe$Notas = factor(novoDataframe$Notas,
                             labels = "Baixas", "Médias", "Altas",
                             levels = 1:3)

novoDataframe$Alcool_vida = factor(novoDataframe$Alcool_vida,
                                   labels = "Não", "Sim",
                                   levels = 1:2)

novoDataframe$Inalante_vida = factor(novoDataframe$Inalante_vida,
                                   labels = "Não", "Sim",
                                   levels = 1:2)


