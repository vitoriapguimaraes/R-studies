# >>>>> Exercício de análise de dados <<<<
# >>>>> Dados coletados de amostra de folhas <<<<

# Incluindo os dados
	# comp = comprimento da folha
	# larg = largura da folha
	# foliar = área foliar
	# folhas = quantidade de folhas
data_folha <- read.table(text="
comp larg foliar folhas
9.8  2.6  15.94  18
9.1  2.0  11.29  18
10.9 3.0  20.97  19
6.4  2.4  10.14  18
9.4  3.5  25.96  10
6.7  2.2  8.78   25
9.1  2.8  15.18  19", header=TRUE)

data

# Dimensão da matriz
dim(data_folha)

# Visualizar dispersão
plot(data_folha)
# Conclusão: há apenas uma relação observável: largura e área foliar 

# >>> Portanto, vamos estudar a relação entre largura e área foliar <<<

# coloca matriz como objeto e plota apenas as duas variáveis
attach(data_folha)
plot(larg,foliar)

# Correlação
cor(larg,foliar)
	# = 0,94

# coeficiente de determinação (R^2)
cor(larg,foliar)^2
	# = 0,88

# Ajuste de uma reta (resp = foliar, explic = larg)
mod=lm(foliar~larg,data=data_folha)
summary(mod)
hist(rstudent(mod))

# Teste de normalidade
shapiro.test(rstudent(mod))
	# Não rejeito a normalidade: 0,05 < 0,3 = P

# Matriz de variâncias e covariâncias dos estimadores
vcov(mod)

# Ajute de um hiperplano
mod<-lm(foliar~comp+larg+folhas,data=data_folha)
summary(mod)
# Resultado: olho o que estão com a estrelinha do
# lado porque é menor do que o alfa, significativo

# Exercício: coloca como res o número de folhas
mod<-lm(folhas~comp+larg+foliar,data=data_folha)
summary(mod)
