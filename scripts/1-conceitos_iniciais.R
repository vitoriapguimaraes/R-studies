# >>>>> Conceitos iniciais de R <<<<<

# >>>> Escrevendo principais conceitos/comandos <<<<

# Atribuição de valores
a <- 10
a  # imprime valor de a
a <- 20
a  # imprime novo valor de a

# Limpando a memória 
rm(list = ls())  # remove todos os objetos
# Teste: a não existe mais
a  # irá gerar erro pois a foi removido

# Operações básicas 
10 - 20
10 + 20
10 / 20
0.5 * 10
x <- 10
x^2 + 2 * x - 500

# Especificando funções
quad <- function(x, a, b, c) {
  a * x^2 + b * x + c
}
# Avaliando função quadrática
quad(30, 1, 3, 10)

# Vetores 
vetor <- c(1, "a", 0.5, "nome", 5, 6)
vetor

# Matrizes
matriz <- matrix(c(1, 4, 3, 4, 3, 6, 7, 1, 9), nrow = 3)
matriz
det(matriz)
# Inversão de matriz
solve(matriz)

# Gráfico da função
x=c(1,2,3,4,5,6,7,8,9,10)
y=quad(x,1,3,10)
plot(x,y)

# Sequências
1:100
-10:10
seq(-2,9,by=0.1)
seq(-2,9,length=200)

# Plot de sequência
x<-seq(0,100,length=30)
y=quad(x,1,3,10)
plot(x[-29],y[-29],type='o',
lwd=2,cex=3,xlab="Valores de x",
ylab="Valores da fun��o")
?plot

# >>>> Comandos de controle de fluxo <<<<

# If / else

x=3
if(x<=5){
print("x é menor ou igual a cinco")
} else{print("x é maior que cinco")}

loga<-function(x){log(x-100)}
x=200
if(x>100){loga(x)} else{
print("o ponto não pertence ao domínio")}


# for

soma=0
for(i in 1:50){
soma=soma+i
}
soma

soma=1
for(i in 1:10){
soma=soma+1/(2^i)
}
soma

# while 
soma=1
i=0
while(2-soma>0.01){
i=i+1
soma=soma+1/(2^i)
}
i
soma

# >>>> Análise exploratória <<<<

# Inserir um conjunto de dados
x<-c(0,0,0,0,0,3,0,0,0,0,1,0,0,0)
x

# Mediana 
median(x)

# Média 
mean(x)

# Variância
var(x)

# Desvio padrão
sd(x)
sqrt(var(x))

# Resumo dos dados
summary(x)

# valor em certa posição de um vetor (no caso, 6ª)
x[6]

# Soma dos valores em um vetor
sum(x)

# Ordenar um vetor
sort(x)

# tamanho do vetor
length(x)

# Função média
media<-function(x){
sum(x)/length(x)}
media(x)

# Programa para o cálculo de uma média amostral 
x=c(3,4,5,2,3,4,2,1)
soma=sum(x)
n=length(x)
media=soma/n
media

# >>>> Gráficos <<<<

# Carregamento dos dados
data(iris)
# Ver conjunto de dados: primeiras linhas
head(iris)
# Dimensão do conjunto de dados
dim(iris)
# Atribuindo (x) a primeira coluna de iris
x<-iris[,1]
x
# Atribuindo (y) a segunda coluna de iris 
y<-iris[,2]
y

# Histograma para x 
hist(x, nclass=12)

# Histograma para y
hist(y)

# Diagrama de dispersão
plot(x,y)

# >>> Exemplo <<<

# Dados aleatórios
x<-c(3,6,7,12,18,20,21,29,35,36,40,48,50,60,72)

mean(x)
var(x)*(14/15)
sqrt(var(x)*(14/15))
summary(x)

# diagrama de caixa
boxplot(x)

# diagrama ramo-e-folhas
stem(x, scale=0.5)

# >>>> Tipos de variávis <<<<

#  Números decimais
x=3.0
	# ponto flutuante 
class(x)

x=as.integer(3)
	# inteiro
class(x)

# Caracteres
x="João"

# Lógica
y=3
comp=(y<2)
class(comp)

# Número complexo
sqrt(-1)
sqrt(-1+0i)

# >>>> Operações <<<<

a=10; b=0.05; c=15.36 

# Operações numéricas

a+b
a-b
a^b
b/c
a*b

# Operações relacionais

# verificar se a é maior do que b
a>b

# verificar se a é maior ou igual a b
a>=b

# a é igual (exatamente) a b
a==b

# a � diferente de b
a!=b 

d="joao"
d>a

# Operadores lógicos: & == (e) // | == (ou)
(a>b)&(b<c)
(a>b)|(b>c)
