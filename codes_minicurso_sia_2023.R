library(ggplot2)
View(Turma_estudantes)
# informações gerais sobre o arquivo de dados
str(Turma_estudantes)
?Turma_estudantes
summary(Turma_estudantes$Idade)
var_idade <- var(Turma_estudantes$Idade) # temos a variância
dp_idade <- sd(Turma_estudantes$Idade) # temos o desvio padrão
media_idade <-mean(Turma_estudantes$Idade, na.rm = TRUE) # para vetores que possuem valores nulos, esse comando retira e faz a média.
