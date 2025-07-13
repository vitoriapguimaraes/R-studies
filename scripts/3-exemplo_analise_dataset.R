
# ===============================
# Exemplo de Análise de Dados
# ===============================

# >>>> Importação de dados CSV <<<<
dat <- read.table("dataset/dt_estudantes.csv", header = TRUE, sep = ";")
print(dat)  # Visualizar tabela completa
head(dat, 3)  # Primeiras linhas
str(dat)      # Estrutura do data.frame
colnames(dat) # Nomes das colunas

# Para acessar colunas, use dat$Coluna
print(dat$Estudantes)  # Exemplo


# >>>> Relacionando dados qualitativos x quantitativos <<<<
# Boxplot de Altura por Sexo
boxplot(dat$Altura ~ dat$Sexo,
        main = "Boxplot: Altura por Sexo",
        xlab = "Sexo", ylab = "Altura",
        col = c("lightblue", "lightgreen"))

# Barplot de frequência
freq_table <- table(dat$Sexo, dat$Altura)
print(freq_table)
barplot(freq_table,
        beside = TRUE, legend = TRUE,
        col = c("lightblue", "lightgreen"),
        main = "Distribuição de Altura por Sexo",
        xlab = "Altura", ylab = "Frequência")

# Diagrama de dispersão
plot(dat$Altura, dat$Massa,
     xlim = c(140, 210), ylim = c(50, 120),
     main = "Dispersão: Altura vs Massa",
     xlab = "Altura", ylab = "Massa",
     pch = 19, col = "darkblue")



# >>>> Exemplo com outro conjunto de dados <<<<
data(iris)
plot(iris$Sepal.Length, iris$Sepal.Width,
     main = "Dispersão Sepal: iris",
     xlab = "Sepal Length", ylab = "Sepal Width",
     pch = 19, col = iris$Species)

# Frequência qualitativa
table(dat$Sexo)

# Gráfico de colunas
barplot(height = c(9, 5), names.arg = c("F", "M"), col = c(3, 5),
        main = "Frequência por Sexo")


# >>>> Análise de variância <<<<
mod <- aov(dat$Altura ~ dat$Sexo)
summary(mod)

# Interpretação:
# Se p-valor < 0.05, rejeita H0 (há diferença entre sexos)
# Se p-valor > 0.05, não rejeita H0 (não há diferença significativa)

# Histograma da resposta
hist(dat$Altura, main = "Histograma da Altura", xlab = "Altura")

# Teste de normalidade dos resíduos
shapiro.test(rstudent(mod))

# Teste t para diferença de médias
t.test(dat$Altura[dat$Sexo == "F"], dat$Altura[dat$Sexo == "M"], paired = FALSE)
# Observação: verifique o tamanho das amostras antes de interpretar