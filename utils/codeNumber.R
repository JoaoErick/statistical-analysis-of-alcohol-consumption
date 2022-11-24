################################################################
#   Codificador de respostas de forma quantitativa discreta   #
################################################################

newNames = c(
  "DATA", "FORMACAO", "SEMESTRE", "SEXO", "FAIXA_ETARIA", "TRABALHA",
  "ESCOLA_TIPO", "DIRIGE_OU_PILOTA", "RENDA_FAMILIAR", "MORA_COM_QUEM",
  "RELIGIAO", "BEBIDA_IMPORTANTE", "FAMILIARES_TOMAM_BEBIDAS", "TOMA_BEBIDA",
  "IDADE_TOMA_BEBIDA", "FREQUENCIA_TOMA_BEBIDA", "QUANTOS_COPOS",
  "PORQUE_COMECOU_A_TOMAR", "IMAGEM_BEBIDA", "TIPO_BEBIDA_CONSOME", "MOTIVO",
  "VEXAME_BEBIDA", "ACIDENTE_BEBIDA", "DIRIGIU_BEBADO", "CARONA_COM_BEBADO", 
  "PAIS_BEBEM", "ALGUEM_ACIDENTE_BEBIDA"
)

names(dataset)[1:27] = newNames

# Codificando categorias em variáveis numéricas

# FORMACAO #

# i = 1
# for (variable in FORMACAO) {
#   if (variable == "Tecnologia e Ciências Exatas"){
#     dataset[i, 2] = 1
#   }
#   i = i + 1
# }

formation = factor(dataset$FORMACAO, levels = c(
    "Tecnologia e Ciências Exatas", "Letras e Artes",
    "Ciências Humanas e Filosofia", "Ciências Naturais e da Saúde", "Outra"
  ),
  labels = c(
    "1", "2", "3", "4", "5"
  )
)

dataset["FORMACAO"] = matrix(formation, ncol=1)

# SEMESTRE #

semester = factor(dataset$SEMESTRE, levels = c(
    "1º Semestre", "2º Semestre", "3º Semestre", "4º Semestre", "5º Semestre",
    "6º Semestre", "7º Semestre", "8º Semestre", "9º Semestre", "10º Semestre",
    "11º Semestre", "12º Semestre"
  ), 
  labels = c(
    "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"
  )
) 

dataset["SEMESTRE"] = matrix(semester, ncol=1)

# SEXO #

sex = factor(dataset$SEXO, levels = c("Masculino", "Feminino"), labels = c("1", "2"))

dataset["SEXO"] = matrix(sex, ncol=1)

# FAIXA_ETARIA #

age_group = factor(dataset$FAIXA_ETARIA, levels = c(
    "16-20 anos", "21-25 anos", 
    "26-30 anos", "30+ anos"
  ), 
  labels = c(
    "1", "2", "3", "4"
  )
) 

dataset["FAIXA_ETARIA"] = matrix(age_group, ncol=1)

# TRABALHA #

job = factor(dataset$TRABALHA, levels = c("Sim", "Não"), labels = c("1", "2"))

dataset["TRABALHA"] = matrix(job, ncol=1)

# ESCOLA_TIPO #

typeSchool = factor(dataset$ESCOLA_TIPO, levels = c("Pública", "Privada"), labels = c("1", "2"))

dataset["ESCOLA_TIPO"] = matrix(typeSchool, ncol=1)

# DIRIGE_OU_PILOTA #

driveOrPilot = factor(dataset$DIRIGE_OU_PILOTA, levels = c("Sim", "Não"), labels = c("1", "2"))

dataset["DIRIGE_OU_PILOTA"] = matrix(driveOrPilot, ncol=1)

# RENDA_FAMILIAR #

familyIncome = factor(dataset$RENDA_FAMILIAR, levels = c(
    "", "Até 1 salário mínimo", "De 1 a 3 salários mínimos", 
    "De 3 a 5 salários mínimos", "De 5 a 7 salários mínimos",
    "7+ salários mínimos"
  ), 
  labels = c(
    "1", "2", "3", "4", "5", "6"
  )
) 

dataset["RENDA_FAMILIAR"] = matrix(familyIncome, ncol=1)

# MORA_COM_QUEM #

whoDoYouLiveWith = factor(dataset$MORA_COM_QUEM, levels = c(
    "Sozinho(a)", "Amigos", "Família", "Outros"
  ), 
  labels = c(
    "1", "2", "3", "4"
  )
) 

dataset["MORA_COM_QUEM"] = matrix(whoDoYouLiveWith, ncol=1)

# RELIGIAO #

religion = factor(dataset$RELIGIAO, levels = c(
    "Católica", "Evangélica", "Outros", "Não possuo"
  ), 
  labels = c(
    "1", "2", "3", "4"
  )
) 

dataset["RELIGIAO"] = matrix(religion, ncol=1)

# BEBIDA_IMPORTANTE #

drinkIsImportant = factor(dataset$BEBIDA_IMPORTANTE, levels = c("Sim", "Não"), labels = c("1", "2"))

dataset["BEBIDA_IMPORTANTE"] = matrix(drinkIsImportant, ncol=1)

# FAMILIARES_TOMAM_BEBIDAS #

familyMembersDrink = factor(dataset$FAMILIARES_TOMAM_BEBIDAS, levels = c("Sim", "Não"), labels = c("1", "2"))

dataset["FAMILIARES_TOMAM_BEBIDAS"] = matrix(familyMembersDrink, ncol=1)

# TOMA_BEBIDA #

consumesDrink = factor(dataset$TOMA_BEBIDA, levels = c("Sim", "Não"), labels = c("1", "2"))

dataset["TOMA_BEBIDA"] = matrix(consumesDrink, ncol=1)

# IDADE_TOMA_BEBIDA #

whatAgeDidYouStartDrinking = factor(dataset$IDADE_TOMA_BEBIDA, levels = c(
    "Menos de 16 anos", "16-20 anos", "21-25 anos", "26-30 anos",
    "30+ anos", "Não consumo"
  ), 
  labels = c(
    "1", "2", "3", "4", "5", "6"
  )
) 

dataset["IDADE_TOMA_BEBIDA"] = matrix(whatAgeDidYouStartDrinking, ncol=1)

# FREQUENCIA_TOMA_BEBIDA #

howOftenDoYouDrink = factor(dataset$FREQUENCIA_TOMA_BEBIDA, levels = c(
    "Fins de semana", "Três vezes ao mês", "Duas vezes ao mês", 
    "Apenas em festas", "Não consumo"
  ), 
  labels = c(
    "1", "2", "3", "4", "5"
  )
) 

dataset["FREQUENCIA_TOMA_BEBIDA"] = matrix(howOftenDoYouDrink, ncol=1)

# QUANTOS_COPOS #

howManyGlassesDoYouConsume = factor(dataset$QUANTOS_COPOS, levels = c(
    "1-3 copos", "3-6 copos", "6-9 copos", 
    "9+ copos", "Não consumo"
  ), 
  labels = c(
    "1", "2", "3", "4", "5"
  )
) 

dataset["QUANTOS_COPOS"] = matrix(howManyGlassesDoYouConsume, ncol=1)

# PORQUE_COMECOU_A_TOMAR #

whyDidYouStartConsuming = factor(dataset$PORQUE_COMECOU_A_TOMAR, levels = c(
    "Iniciativa própria", "Incentivo de amigos", "Incentivo da família", 
    "Outros motivos", "Não consumo"
  ), 
  labels = c(
    "1", "2", "3", "4", "5"
  )
) 

dataset["PORQUE_COMECOU_A_TOMAR"] = matrix(whyDidYouStartConsuming, ncol=1)

# IMAGEM_BEBIDA #

whatImageCausesTheDrink = factor(dataset$IMAGEM_BEBIDA, levels = c(
    "Beleza", "Sucesso", "Incentivo da família", "Liberdade", "Poder",
    "Inteligência", "Riqueza", "Outros"
  ), 
  labels = c(
    "1", "2", "3", "4", "5", "6", "7", "8"
  )
) 

dataset["IMAGEM_BEBIDA"] = matrix(whatImageCausesTheDrink, ncol=1)

# TIPO_BEBIDA_CONSOME #

whatKindOfDrinkDoYouConsume = factor(dataset$TIPO_BEBIDA_CONSOME, levels = c(
    "Cerveja", "Vinho", '"ICE"', "Outros", "Não consumo"
  ), 
  labels = c(
    "1", "2", "3", "4", "5"
  )
) 

dataset["TIPO_BEBIDA_CONSOME"] = matrix(whatKindOfDrinkDoYouConsume, ncol=1)

# MOTIVO #

whatReason = factor(dataset$MOTIVO, levels = c(
    "Sim", "Outro motivo", "Não consumo", "Não"
  ), 
  labels = c(
    "1", "2", "3", "2"
  )
) 

dataset["MOTIVO"] = matrix(whatReason, ncol=1)

# VEXAME_BEBIDA #

humiliationBecauseOfTheDrink = factor(dataset$VEXAME_BEBIDA, levels = c(
    "Sim", "Não", "Não consumo"
  ), 
  labels = c(
    "1", "2", "3"
  )
) 

dataset["VEXAME_BEBIDA"] = matrix(humiliationBecauseOfTheDrink, ncol=1)

# ACIDENTE_BEBIDA #

drinkingAccident = factor(dataset$ACIDENTE_BEBIDA, levels = c(
    "Sim", "Não", "Não consumo"
  ), 
  labels = c(
    "1", "2", "3"
  ), 
) 

dataset["ACIDENTE_BEBIDA"] = matrix(drinkingAccident, ncol=1)

# DIRIGIU_BEBADO #

droveDrunk = factor(dataset$DIRIGIU_BEBADO, levels = c(
    "Sim", "Não", "Não consumo"
  ), 
  labels = c(
    "1", "2", "3"
  )
) 

dataset["DIRIGIU_BEBADO"] = matrix(droveDrunk, ncol=1)

# CARONA_COM_BEBADO #

rideWithDrunk = factor(dataset$CARONA_COM_BEBADO, levels = c("Sim", "Não"), labels = c("1", "2"))

dataset["CARONA_COM_BEBADO"] = matrix(rideWithDrunk, ncol=1)

# PAIS_BEBEM #

parentsDrink = factor(dataset$PAIS_BEBEM, levels = c("Sim", "Não"), labels = c("1", "2"))

dataset["PAIS_BEBEM"] = matrix(parentsDrink, ncol=1)

# ALGUEM_ACIDENTE_BEBIDA #

someoneHadAnAccidentBecauseOfDrinking = factor(dataset$ALGUEM_ACIDENTE_BEBIDA, levels = c(
    "Sim", "Não"
  ), 
  labels = c(
    "1", "2"
  )
) 

dataset["ALGUEM_ACIDENTE_BEBIDA"] = matrix(someoneHadAnAccidentBecauseOfDrinking, ncol=1)

dataset$FORMACAO = as.numeric(dataset$FORMACAO)
dataset$SEMESTRE = as.numeric(dataset$SEMESTRE)
dataset$SEXO = as.numeric(dataset$SEXO)
dataset$FAIXA_ETARIA = as.numeric(dataset$FAIXA_ETARIA)
dataset$TRABALHA = as.numeric(dataset$TRABALHA)
dataset$ESCOLA_TIPO = as.numeric(dataset$ESCOLA_TIPO)
dataset$DIRIGE_OU_PILOTA = as.numeric(dataset$DIRIGE_OU_PILOTA)
dataset$RENDA_FAMILIAR = as.numeric(dataset$RENDA_FAMILIAR)
dataset$MORA_COM_QUEM = as.numeric(dataset$MORA_COM_QUEM)
dataset$RELIGIAO = as.numeric(dataset$RELIGIAO)
dataset$BEBIDA_IMPORTANTE = as.numeric(dataset$BEBIDA_IMPORTANTE)
dataset$FAMILIARES_TOMAM_BEBIDAS = as.numeric(dataset$FAMILIARES_TOMAM_BEBIDAS)
dataset$TOMA_BEBIDA = as.numeric(dataset$TOMA_BEBIDA)
dataset$IDADE_TOMA_BEBIDA = as.numeric(dataset$IDADE_TOMA_BEBIDA)
dataset$FREQUENCIA_TOMA_BEBIDA = as.numeric(dataset$FREQUENCIA_TOMA_BEBIDA)
dataset$QUANTOS_COPOS = as.numeric(dataset$QUANTOS_COPOS)
dataset$PORQUE_COMECOU_A_TOMAR = as.numeric(dataset$PORQUE_COMECOU_A_TOMAR)
dataset$IMAGEM_BEBIDA = as.numeric(dataset$IMAGEM_BEBIDA)
dataset$TIPO_BEBIDA_CONSOME = as.numeric(dataset$TIPO_BEBIDA_CONSOME)
dataset$MOTIVO = as.numeric(dataset$MOTIVO)
dataset$VEXAME_BEBIDA = as.numeric(dataset$VEXAME_BEBIDA)
dataset$ACIDENTE_BEBIDA = as.numeric(dataset$ACIDENTE_BEBIDA)
dataset$DIRIGIU_BEBADO = as.numeric(dataset$DIRIGIU_BEBADO)
dataset$CARONA_COM_BEBADO = as.numeric(dataset$CARONA_COM_BEBADO)
dataset$PAIS_BEBEM = as.numeric(dataset$PAIS_BEBEM)
dataset$ALGUEM_ACIDENTE_BEBIDA = as.numeric(dataset$ALGUEM_ACIDENTE_BEBIDA)
