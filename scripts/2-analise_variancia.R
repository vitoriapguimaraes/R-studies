
# ===============================
# Análise de Variância (ANOVA)
# ===============================

# >>>> Entradas <<<<
A <- c(12, 15, 17, 12)
B <- c(16, 14, 21, 15, 19)
C <- c(14, 17, 20, 15)

list(A, B, C)  # visualização dos grupos
class(A)       # tipo do vetor


# >>>> Estatísticas descritivas <<<<
cat("Resumo A:\n"); print(summary(A)); cat("Variância:", var(A), "\nDesvio padrão:", sd(A), "\n\n")
cat("Resumo B:\n"); print(summary(B)); cat("Variância:", var(B), "\nDesvio padrão:", sd(B), "\n\n")
cat("Resumo C:\n"); print(summary(C)); cat("Variância:", var(C), "\nDesvio padrão:", sd(C), "\n\n")


# >>>> Boxplot comparativo <<<<
boxplot(list(A = A, B = B, C = C),
        main = "Boxplot dos Tratamentos",
        ylab = "Valores",
        col = c("skyblue", "salmon", "lightgreen"))


# >>>> Preparação dos dados para ANOVA <<<<
resp <- c(A, B, C)
trat <- c(rep("A", length(A)), rep("B", length(B)), rep("C", length(C)))
dados <- data.frame(trat = factor(trat), resp)
print(dados)


# >>>> Rodando a análise de variância <<<<
mod <- aov(resp ~ trat, data = dados)
summary(mod)


# Interpretação:
# Se p-valor < 0.05, rejeita H0 (há diferença entre tratamentos)
# Se p-valor > 0.05, não rejeita H0 (não há diferença significativa)


# >>>> Verificação das pressuposições <<<<
# Independência, normalidade, homogeneidade de variâncias

# Gráficos dos resíduos
par(mfrow = c(1, 3))
plot(rstudent(mod), fitted(mod), main = "Resíduos vs Ajustados")
plot(fitted(mod), rstudent(mod), main = "Ajustados vs Resíduos")
plot(mod, which = 1, main = "Diagnóstico ANOVA")
par(mfrow = c(1, 1))

# Teste de normalidade de Shapiro-Wilk
shapiro.test(rstudent(mod))

# Teste de homogeneidade de variâncias de Bartlett
bartlett.test(resp ~ trat)



# ===============================
# Teste T pareado
# ===============================
antes <- c(13.6, 13.6, 14.7, 12.1, 12.3, 13.2)
depois <- c(11.4, 12.5, 14.6, 13, 11.7, 10.3)
t.test(antes, depois, paired = TRUE, alternative = "less", conf.level = 0.95)















