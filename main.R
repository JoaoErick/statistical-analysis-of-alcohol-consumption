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

# --- Declaração de funções ---

generateSlice = function(...) {
  # Obtendo a frequência de cada elemento
  slices = table(...)
  
  # Calculando a frequência relativa de cada elemento
  slices_labels = round(slices/sum(slices) * 100, 1)
  slices_labels = paste(slices_labels, "%", sep="")
  
  return(slices_labels)
}

generateSliceRow = function(row, ...) {
  # Obtendo a frequência de cada elemento
  slices = table(...)[row,]
  
  # Calculando a frequência relativa de cada elemento
  slices_labels = round(slices/sum(slices) * 100, 1)
  slices_labels = paste(slices_labels, "%", sep="")
  
  return(slices_labels)
}

# --- Geração de gráficos ---

x11()
colors = brewer.pal(8, "Set2")
colors = append(colors, brewer.pal(8, "Set1"))

# -------------------

# Calculando a frequência relativa de cada sexo
slices_labels = generateSlice(SEXO)

pie(table(SEXO), main = "Respondentes por sexo", labels=slices_labels, cex=0.7, col = colors)
legend(.9, .9, c("Masculino","Feminino"), fill = colors)

# -------------------

# Calculando a frequência relativa de cada relação sexo x consome bebida
slices_labels = generateSlice(SEXO, TOMA_BEBIDA)

pie(table(SEXO, TOMA_BEBIDA), main = "Relação Sexo x Bebida", labels=slices_labels, cex=0.7, col = colors)
legend(.9, .9, c("Masc. bebe","Fem. bebe","Masc. não bebe", "Fem. não bebe"), fill = colors)

# text(locator(n=1), paste(round(prop.table(table(dados$educa))[1], digits=2)*100,"%"))

# -------------------

# Exibindo gráfico em barras das faixas etárias

elements = append(rep(table(FAIXA_ETARIA)), c(0, 0))
chart = barplot(
  elements,
  ylab = "Nº de pessoas",
  xlab = "Faixas etárias",
  ylim = c(0,50),  
  names = c("16-20 anos", "21-25 anos", "26-30 anos", "30+ anos"),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+2, labels=as.character(elementsMatrix))

# -------------------

# Exibindo gráfico em barras das faixas etárias de começar a beber

elements = table(IDADE_TOMA_BEBIDA)[1:3]
chart = barplot(
  elements,
  main = "Idade que começou a beber"
  ylab = "Nº de pessoas",
  xlab = "Faixas etárias",
  ylim = c(0,50),  
  names = c("Menos de 16 anos", "16-20 anos", "21-25 anos"),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+2, labels=as.character(elementsMatrix))

# -------------------

# Exibindo gráfico em barras das faixas etárias que consomem bebida
elements = table(FAIXA_ETARIA,TOMA_BEBIDA)[,1]
chart = barplot(
  elements, 
  main = "Número de pessoas que consomem bebida alcoólica",
  ylab = "Nº de pessoas",
  xlab = "Faixas etárias",
  ylim = c(0,35), 
  names = c("16-20 anos", "21-25 anos"),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+2, labels=as.character(elementsMatrix))
# -------------------

# Exibindo gráfico em barras das faixas etárias que não consomem bebida
elements = table(FAIXA_ETARIA,TOMA_BEBIDA)[,2]
chart = barplot(
  table(FAIXA_ETARIA,TOMA_BEBIDA)[,2], 
  main = "Número de pessoas que não consomem bebida alcoólica",
  ylab = "Nº de pessoas",
  xlab = "Faixas etárias",
  ylim = c(0,20), 
  names = c("16-20 anos", "21-25 anos"),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+2, labels=as.character(elementsMatrix))

# -------------------

# Calculando a frequência relativa de cada semestre
slices_labels = generateSlice(SEMESTRE)

pie(
  table(SEMESTRE), 
  main = "Respondentes por semestre", 
  labels=slices_labels, 
  cex=0.7, 
  col = colors
)
legend(
  1.2, 
  .6, 
  c(
    "1º Semestre", "2º Semestre", "3º Semestre", "4º Semestre", "5º Semestre",
    "6º Semestre", "7º Semestre", "8º Semestre", "9º Semestre", "10º Semestre",
    "11º Semestre", "12º Semestre"
  ), 
  fill = colors
)

# -------------------

# Calculando a frequência relativa de cada semestre
slices_labels = generateSlice(ESCOLA_TIPO, TOMA_BEBIDA)

pie(
  table(ESCOLA_TIPO, TOMA_BEBIDA), 
  main = "Relação tipo de escola x bebida", 
  labels=slices_labels, 
  cex=0.7, 
  col = colors
)
legend(
  .9, 
  .9, 
  c(
    "Escola Pública que consome", "Escola Privada que consome",
    "Escola Pública que não consome", "Escola Privada que não consome"
  ), 
  fill = colors
)

# -------------------

# Exibindo gráfico em barras do número de pessoas que consomem bebida alcoólica 
# por área de formação

elements = append(rep(table(FORMACAO,TOMA_BEBIDA)[,1]), c(0))
chart = barplot(
  elements, 
  main = "Número de pessoas que consomem bebida alcoólica por área de formação",
  ylab = "Nº de pessoas",
  xlab = "Áreas de formação",
  ylim = c(0,20), 
  names = c(
    "Tecnologia e Ciências Exatas","Ciências Humanas e Filosofia", 
    "Ciências Naturais e da Saúde", "Outra", "Letras e Artes"
    ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+2, labels=as.character(elementsMatrix))

# -------------------

# Exibindo gráfico em barras do número de pessoas que não consomem bebida alcoólica 
# por área de formação

elements = append(rep(table(FORMACAO,TOMA_BEBIDA)[,2]), c(0))
chart = barplot(
  elements, 
  main = "Número de pessoas que não consomem bebida alcoólica por área de formação",
  ylab = "Nº de pessoas",
  xlab = "Áreas de formação",
  ylim = c(0,20), 
  names = c(
    "Tecnologia e Ciências Exatas","Ciências Humanas e Filosofia", 
    "Ciências Naturais e da Saúde", "Outra", "Letras e Artes"
    ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+2, labels=as.character(elementsMatrix))

# -------------------

# Exibindo gráfico em barras do número de copos consumidos pelos respondentes

elements = table(QUANTOS_COPOS)
chart = barplot(
  elements, 
  main = "Número de copos consumidos pelos respondentes",
  ylab = "Nº de pessoas",
  xlab = "Nº de copos",
  ylim = c(0,25), 
  names = c(
    "1-3 copos", "3-6 copos", "6-9 copos", 
    "9+ copos", "Não consumo"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+2, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do número de copos consumidos pelos respondentes nos fins de semana

elements = table(QUANTOS_COPOS, FREQUENCIA_TOMA_BEBIDA)[,1]
chart = barplot(
  elements, 
  main = "Número de copos consumidos pelos respondentes nos fins de semana",
  ylab = "Nº de pessoas",
  xlab = "Nº de copos",
  ylim = c(0,8), 
  names = c(
    "1-3 copos", "3-6 copos", "6-9 copos", 
    "9+ copos", "Não consumo"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.5, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do número de copos consumidos pelos respondentes três vezes ao mês

elements = table(QUANTOS_COPOS, FREQUENCIA_TOMA_BEBIDA)[,2]
chart = barplot(
  elements, 
  main = "Número de copos consumidos pelos respondentes três vezes ao mês",
  ylab = "Nº de pessoas",
  xlab = "Nº de copos",
  ylim = c(0,2), 
  names = c(
    "1-3 copos", "3-6 copos", "6-9 copos", 
    "9+ copos", "Não consumo"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.1, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do número de copos consumidos pelos respondentes duas vezes ao mês

elements = table(QUANTOS_COPOS, FREQUENCIA_TOMA_BEBIDA)[,3]
chart = barplot(
  elements, 
  main = "Número de copos consumidos pelos respondentes duas vezes ao mês",
  ylab = "Nº de pessoas",
  xlab = "Nº de copos",
  ylim = c(0,4), 
  names = c(
    "1-3 copos", "3-6 copos", "6-9 copos", 
    "9+ copos", "Não consumo"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.2, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do número de copos consumidos pelos respondentes apenas em festas

elements = table(QUANTOS_COPOS, FREQUENCIA_TOMA_BEBIDA)[,4]
chart = barplot(
  elements, 
  main = "Número de copos consumidos pelos respondentes apenas em festas",
  ylab = "Nº de pessoas",
  xlab = "Nº de copos",
  ylim = c(0,10), 
  names = c(
    "1-3 copos", "3-6 copos", "6-9 copos", 
    "9+ copos", "Não consumo"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.3, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do motivos das pessoas menores que 16 anos começarem a beber

elements = table(IDADE_TOMA_BEBIDA, PORQUE_COMECOU_A_TOMAR)[1,1:4]
chart = barplot(
  elements, 
  main = "Motivos das pessoas menores que 16 anos começarem a beber",
  ylab = "Nº de pessoas",
  xlab = "Motivos",
  ylim = c(0,3), 
  names = c(
    "Iniciativa própria", "Incentivo de amigos", "Incentivo da família", 
    "Outros motivos"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.3, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do motivos das pessoas com 16-20 anos começarem a beber

elements = table(IDADE_TOMA_BEBIDA, PORQUE_COMECOU_A_TOMAR)[2,1:4]
chart = barplot(
  elements, 
  main = "Motivos das pessoas com 16-20 anos começarem a beber",
  ylab = "Nº de pessoas",
  xlab = "Motivos",
  ylim = c(0,20), 
  names = c(
    "Iniciativa própria", "Incentivo de amigos", "Incentivo da família", 
    "Outros motivos"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.5, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do motivos das pessoas com 21-25 anos começarem a beber

elements = table(IDADE_TOMA_BEBIDA, PORQUE_COMECOU_A_TOMAR)[3,1:4]
chart = barplot(
  elements, 
  main = "Motivos das pessoas com 21-25 anos começarem a beber",
  ylab = "Nº de pessoas",
  xlab = "Motivos",
  ylim = c(0,5), 
  names = c(
    "Iniciativa própria", "Incentivo de amigos", "Incentivo da família", 
    "Outros motivos"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.2, labels=as.character(elementsMatrix))

# -------------------

# Calculando a frequência relativa da relação pais bebem x respondente bebe
slices_labels = generateSlice(PAIS_BEBEM, TOMA_BEBIDA)

pie(
  table(PAIS_BEBEM, TOMA_BEBIDA), 
  main = "Relação pais bebem x respondente bebe", 
  labels=slices_labels, 
  cex=0.7, 
  col = colors
)
legend(
  .9, 
  .9, 
  c(
    "PB e RB", "PNB e RB",
    "PB e RNB", "PNB e RNB"
  ), 
  fill = colors
)

# -------------------

# Calculando a frequência relativa da relação religião x respondente bebe
slices_labels = generateSlice(RELIGIAO, TOMA_BEBIDA)

pie(
  table(RELIGIAO, TOMA_BEBIDA), 
  main = "Relação religião x respondente bebe", 
  labels=slices_labels, 
  cex=0.7, 
  col = colors
)
legend(
  .9, 
  .9, 
  c(
    "C e RB", "E e RB", "O e RB", "NP e RB",
    "C e RNB", "E e RNB", "O e RNB", "NP e RNB"
  ), 
  fill = colors
)

# Exibindo gráfico em barras do tipo de bebida que o respondente constuma tomar 
# baseado na sua renda familiar de até 1 salário mínimo
elements = table(RENDA_FAMILIAR, TIPO_BEBIDA_CONSOME)[1,1:4]
chart = barplot(
  elements, 
  main = "Tipo de bebida que as pessoas costumam tomar com renda familiar de até 1 salário mínimo",
  ylab = "Nº de pessoas",
  xlab = "Tipo de bebida",
  ylim = c(0,5), 
  names = c(
    "Cerveja", "Vinho", '"ICE"', "Outros"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.2, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do tipo de bebida que o respondente constuma tomar 
# baseado na sua renda familiar de 1 a 3 salários mínimos
elements = table(RENDA_FAMILIAR, TIPO_BEBIDA_CONSOME)[2,1:4]
chart = barplot(
  elements, 
  main = "Tipo de bebida que as pessoas costumam tomar com renda familiar de 1 a 3 salários mínimos",
  ylab = "Nº de pessoas",
  xlab = "Tipo de bebida",
  ylim = c(0,8), 
  names = c(
    "Cerveja", "Vinho", '"ICE"', "Outros"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.2, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do tipo de bebida que o respondente constuma tomar 
# baseado na sua renda familiar de 3 a 5 salários mínimos
elements = table(RENDA_FAMILIAR, TIPO_BEBIDA_CONSOME)[3,1:4]
chart = barplot(
  elements, 
  main = "Tipo de bebida que as pessoas costumam tomar com renda familiar de 3 a 5 salários mínimos",
  ylab = "Nº de pessoas",
  xlab = "Tipo de bebida",
  ylim = c(0,5), 
  names = c(
    "Cerveja", "Vinho", '"ICE"', "Outros"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.2, labels=as.character(elementsMatrix))

# Exibindo gráfico em barras do tipo de bebida que o respondente constuma tomar 
# baseado na sua renda familiar de 7+ salários mínimos
elements = table(RENDA_FAMILIAR, TIPO_BEBIDA_CONSOME)[5,1:4]
chart = barplot(
  elements, 
  main = "Tipo de bebida que as pessoas costumam tomar com renda familiar de 7+ salários mínimos",
  ylab = "Nº de pessoas",
  xlab = "Tipo de bebida",
  ylim = c(0,3), 
  names = c(
    "Cerveja", "Vinho", '"ICE"', "Outros"
  ),
  col = colors
)
elementsMatrix = as.matrix(elements)
text(chart, elementsMatrix+.2, labels=as.character(elementsMatrix))

# -------------------

# Calculando a frequência relativa da relação importância da bebida x frequência de consumo
slices_labels = generateSliceRow(1, BEBIDA_IMPORTANTE, FREQUENCIA_TOMA_BEBIDA)

pie(
  table(BEBIDA_IMPORTANTE, FREQUENCIA_TOMA_BEBIDA)[1,1:2], 
  main = "Frequência de consumo das pessoas que consideram a bebida importante", 
  labels=slices_labels, 
  cex=0.7, 
  col = colors
)
legend(
  .9, 
  .9, 
  c(
    "Fins de semana", "Três vezes ao mês"
  ), 
  fill = colors
)













# --- Cálculos estatísticos ---

# Média de idade dos respondentes
age_mean = round(((as.numeric(table(FAIXA_ETARIA)[1]) * (16+20)/2) + (as.numeric(table(FAIXA_ETARIA)[2]) * (21+25)/2)) / length(FAIXA_ETARIA))
# R: Pessoas de 22 anos

# Média de copos consumidos
age_mean = round(((as.numeric(table(FAIXA_ETARIA)[1]) * (16+20)/2) + (as.numeric(table(FAIXA_ETARIA)[2]) * (21+25)/2)) / length(QUANTOS_COPOS))
