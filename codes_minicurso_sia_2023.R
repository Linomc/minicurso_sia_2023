if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)
if (!require(GGally)) install.packages('GGally')
library(GGally)
if (!require(rlang)) install.packages("rlang")
library(rlang)
if (!require(gtsummary)) install.packages("gtsummary")
library(gtsummary)
if (!require(tidyr)) install.packages("tidyr")
library(tidyr)

if(!require(dplyr)) install.packages("dplyr")
library(dplyr)
if(!require(rstatix)) install.packages("rstatix")
library(rstatix)
if(!require(moments)) install.packages("moments")
library(moments)
if (!require(gmodels)) install.packages("gmodels")
library(gmodels)

View(Turma_estudantes)

# informações gerais sobre o arquivo de dados
str(Turma_estudantes)

#Verificar sobre o resumo das idades dos estudantes da turma
summary(Turma_estudantes$Idade)

# informações que costumamos usar em variáveis quantitativas:
var_idade <- var(Turma_estudantes$Idade) # temos a variância
dp_idade <- sd(Turma_estudantes$Idade) # temos o desvio padrão
media_idade <-mean(Turma_estudantes$Idade, na.rm = TRUE) # explicação em: (1)
# (1) > na-rm - para vetores que possuem valores nulos, esse comando retira e faz a média.

# verificando variáveis categóricas

proporcao_nivel_ingles <- data.frame(proportions(table(Turma_estudantes$Ingles)))
proporcao_nivel_ingles
plot_nivel_ingles <- ggplot(Turma_estudantes, aes(proporcao_nivel_ingles)) + geom_bar() + ggtitle('Nivel de Inglês da turma')
plot_nivel_ingles
proporcao_genero <- proportions(table(Turma_estudantes$Sexo))
proporcao_bairros <- proportions(table(Turma_estudantes$Bairro))
prop_sexo_ingles <- proportions(table(Turma_estudantes$Sexo,Turma_estudantes$Ingles), margin = 1)
prop_sexo_bairro <- proportions(table(Turma_estudantes$Sexo,Turma_estudantes$Bairro), margin = 1)
prop_bairro_ingles <- proportions(table(Turma_estudantes$Bairro, Turma_estudantes$Ingles), margin = 1)

# Graficos de variaveis Bivariadas - Quantitativa vs Quantitativa

plot_Idade_Peso <- ggplot(Turma_estudantes, aes(Idade,Peso))+geom_point() + ggtitle('Gráfico de dispersão da idade pelo peso')
plot_Altura_Peso <- ggplot(Turma_estudantes, aes(Altura,Peso))+geom_point() + ggtitle('Gráfico de dispersão da altura pelo peso')
plot_Altura_Peso
# Graficos de variaveis Bivariadas - Qualitativa vs Quantitativa

boxplot_Sexo_idade <- ggplot(Turma_estudantes,aes(Sexo,Idade))+geom_boxplot()+ ggtitle('caixa do gênero pela idade')
boxplot_Ingles_idade <- ggplot(Turma_estudantes,aes(Ingles, Idade))+geom_boxplot()
ggsave('plot_idade_Peso.png', plot_Idade_Peso, width = 6, height = 4)
