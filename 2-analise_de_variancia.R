# >>>>> Análise de variância <<<<<

# >>> As entradas <<<
A=c(12,15,17,12)
B=c(16,14,21,15,19)
C=c(14,17,20,15)

list(A,B,C)
class(A)

# >>> Estatísticas descritivas <<<

# Resumo dos dados
summary(A)
# variância
var(A)
# desvio padrão
sd(A)

# Resumo dos dados
summary(B)
# variância
var(B)
# desvio padrão
sd(B)

# Resumo dos dados
summary(C)
# variância
var(C)
# desvio padrão
sd(C)

# >>> Box-plot <<<
boxplot(A,B,C)

# >>> Organizar os dados para rodar ANOVA <<<

# vetores de resposta
resp<-c(A,B,C)
resp

# vetores de tratamento *sempre marcar como nome - porque se não, o R entende como outra coisa)
trat<-c("A","A","A","A","B","B","B","B","B","C","C","C","C")
trat

# tabela de dados
dados<-data.frame(trat,resp)
dados

# >>> Rodando a análise de variância <<<

mod<-aov(resp~trat)
mod

# Resultados da ANOVA
anova(mod)

# Comparar a probabilidade de F e valor de significância
# se prop(F) < alfa - rejeita H0
# se prof(F) > alfa - não rejeita H0

# H0: uA=uB=uC
# HA: uA =/ uB ou uA =/ uC ou uB =/ uC
# no caso, 0,269>0,05, não rejeita H0

# Portanto o tratamento não tem efeito:
# Não há diferença dos tratamentos - muito provavel que
# a diferenca aparente no box-splot seja devido ao acaso

# >>> Verificação das pressuposições <<<
# independência, normalidade, homogeneidade de variâncias

# Gráfico dos resíduos
plot(rstudent(mod),fitted(mod))
plot(fitted(mod),rstudent(mod))
plot(mod)

# Teste de normalidade de Shapiro-Wilk
shapiro.test(rstudent(mod))

# Teste de homogeneidade de variâncias de Bartlett
bartlett.test(resp~trat)


###########################################
################# teste T #################
###########################################

antes<-c(13.6,13.6,14.7,12.1,12.3,13.2)
depois<-c(11.4,12.5,14.6,13,11.7,10.3)

t.test(antes,depois,pared=TRUE,alternative="less", conf.level=0.95)















