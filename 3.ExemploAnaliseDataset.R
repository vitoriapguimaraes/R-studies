# >>>>> Exemplo de análise de dados <<<<


# >>>>> Com import de data no formato CSV <<<<

# Importar uma tabela de dados
dat<-read.table("D:/vipistori/R/3.data.csv",header=TRUE,sep=";")

# Plotar a tabela
dat
# Imprimir as 3 primeiras linhas
head(dat,3)

# Fixa as colunas como objeto na memória do computador
attach(dat)

colnames(dat)

# para conferir se deu certo
Estudantes

# >>> Relacionar dados quallitativas x quantitativos <<<

# Boxsplot
boxplot(Altura~Sexo)

# Barplot
# Calcule a tabela de frequência entre Altura e Sexo
freq_table <- table(Altura, Sexo)
# Visualize a tabela de frequência
print(freq_table)
# Crie o gráfico de barras
barplot(freq_table)
barplot(freq_table, beside=TRUE, legend=TRUE, 
        col=c("lightblue", "lightgreen"),
        main="Distribuição de Altura por Sexo",
        xlab="Sexo", ylab="Frequência")

# Diagrama de Dispersão
plot(Altura,Massa,xlim=c(140,210),ylim=c(50,120))


# >>>>> Com outro conjunto de dados <<<<
data(iris)
plot(iris)

# Cálculo das frequência (qualitativa)
table(Sexo)

# Gráfico de colunas
barplot(height=c(9,5),names=c("F","M"),col=c(3,5))

# >>> Análise de variância <<<

mod<-aov(Altura~Sexo)
anova(mod)

# checando o resultado de F value
1104.1/1861.7

# analisando a probabilidade e o grau de significância
0.05>0.4561
	# FALSE
	# ou seja, não tem evidências para rejeitar H0
# hipótese zero = não há efeito do sexo para altura
# H0: uM = uF: média dos homens não difere da média das mulheres

# histograma da resposta
hist(Altura)

# resultado: regular?

# teste de shapiro
shapiro.test(rstudent(mod))

# resultado: p-value baixo = normalidade?

# teste t
t.test(Altura[Sexo="F"], Altura[Sexo="M"],pared=FALSE)
	# Número de amostras é insuficiente