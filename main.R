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

# --- Configurações ---

rm(list=ls())

# Instalação de pacotes
install.packages('readxl')
install.packages('descr')
install.packages('RColorBrewer')

library(readxl)
library(descr)
library(RColorBrewer)

# Importando banco em excel
dataset = read_excel("dataset.xlsx")

# Visualizando a base de dados
View(dataset) 

# Codificando a base de dados em variáveis quantitativas discretas
source("./utils/codeNumber.R")

attach(dataset)

# --- Geração de gráficos ---

x11()
colors = brewer.pal(3, "Set2")

# Obtendo a frequência de cada sexo
slices = table (SEXO)

# Calculando a frequência relativa de cada sexo
slices_labels = round(slices/sum(slices) * 100, 1)
slices_labels = paste(slices_labels, "%", sep="")

pie(table(SEXO), main = "Respondentes por sexo", labels=slices_labels, cex=0.7, col = colors)
legend(.9, .9, c("Masculino","Feminino"), fill = colors)

# -------------------

# Obtendo a frequência de cada relação sexo x consome bebida
slices = table (SEXO, TOMA_BEBIDA)

# Calculando a frequência relativa de cada relação sexo x consome bebida
slices_labels = round(slices/sum(slices) * 100, 1)
slices_labels = paste(slices_labels, "%", sep="")

pie(table(SEXO, TOMA_BEBIDA), main = "Relação Sexo x Bebida", labels=slices_labels, cex=0.7, col = colors)
legend(.9, .9, c("Masc. bebe","Fem. bebe","Masc. não bebe", "Fem. não bebe"), fill = colors)

# text(locator(n=1), paste(round(prop.table(table(dados$educa))[1], digits=2)*100,"%"))

# -------------------

# Exibindo gráfico em barras das faixas etárias

ages = append(rep(table(FAIXA_ETARIA)), c(0, 0))
barplot(
  ages, 
  ylab = "Nº de pessoas",
  xlab = "Faixas etárias",
  ylim = c(0,50), 
  names = c("16-20 anos", "21-25 anos", "26-30 anos", "30+ anos"),
  col = colors
)

# -------------------

# Exibindo gráfico em barras das faixas etárias que consomem bebida
barplot(
  table (FAIXA_ETARIA,TOMA_BEBIDA)[,1], 
  main = "Número de pessoas que consomem bebida alcoólica",
  ylab = "Nº de pessoas",
  xlab = "Faixas etárias",
  ylim = c(0,35), 
  names = c("16-20 anos", "21-25 anos"),
  col = colors
)

# -------------------

# Exibindo gráfico em barras das faixas etárias que não consomem bebida
barplot(
  table (FAIXA_ETARIA,TOMA_BEBIDA)[,2], 
  main = "Número de pessoas que não consomem bebida alcoólica",
  ylab = "Nº de pessoas",
  xlab = "Faixas etárias",
  ylim = c(0,20), 
  names = c("16-20 anos", "21-25 anos"),
  col = colors
)
