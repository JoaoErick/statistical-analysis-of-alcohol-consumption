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
install.packages('readxl') 
install.packages('descr')

library(readxl) 
library(descr)

# Importando banco em excel
dataset = read_excel("dataset.xlsx")

# Visualizando a base de dados
View(dataset) 

# Acesso às variáveis separadamente da base de dados
attach(dataset)

# Codificando a base de dados em variáveis quantitativas discretas
source("./utils/codeNumber.R")

