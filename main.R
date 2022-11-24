################################################################
# Análise estatística do consumo de álcool entre os estudantes #
################################################################

################################################################
# Universidade Estadual de Feira de Santana                    #
# Departamento de Ciências Exatas                              #
# EXA709 - Probabilidade e Estatística I E                     #
# Profª: Magali Teresópolis                                    #
# Grupo: Allan Capistrano, Felipe Silva, João Erick Barbosa,   #
#        João Pedro Rios e Gabriel Carvalho.                   #
################################################################

rm(list=ls())

# Instalação de pacotes
# install.packages('readxl')
# install.packages('descr')
# 
# library(readxl)
# library(descr)

# Importando banco em excel
dataset = read_excel("dataset.xlsx")

# Visualizando a base de dados
View(dataset) 

# Codificando a base de dados em variáveis quantitativas discretas
source("./utils/codeNumber.R")

summary(dataset$SEXO)

attach(dataset)

# ---------------------

#make slices
slices = table (SEXO)

# Calculate the percentage for each day, rounded to one decimal place
slices_labels = round(slices/sum(slices) * 100, 1)

# Concatenate a '%' char after each value
slices_labels = paste(slices_labels, "%", sep="")

colors = c("yellow2", "blue2")

pie(table(SEXO), main = "Respondentes por sexo", labels=slices_labels, cex=0.7, col = colors)
legend(.9, .9, c("Masculino","Feminino"), fill = colors)

# -------------------

#make slices
slices = table (SEXO, TOMA_BEBIDA)

# Calculate the percentage for each day, rounded to one decimal place
slices_labels = round(slices/sum(slices) * 100, 1)

# Concatenate a '%' char after each value
slices_labels = paste(slices_labels, "%", sep="")

colors = c("green2","yellow2","red2", "blue2")

pie(table(SEXO, TOMA_BEBIDA), main = "Relação Sexo x Bebida", labels=slices_labels, cex=0.7, col = colors)
legend(.9, .9, c("Masc. bebe","Fem. bebe","Masc. não bebe", "Fem. não bebe"), fill = colors)

# text(locator(n=1), paste(round(prop.table(table(dados$educa))[1], digits=2)*100,"%"))

boxplot(SEXO,TOMA_BEBIDA)
