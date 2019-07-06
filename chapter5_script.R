exam <- read.csv("csv_exam.txt")
head(exam)
head(exam, 10)
tail(exam)
tail(exam, 10)

View(exam)   #v는 대문자!!
dim(exam)
str(exam)
summary(exam)

install.packages("ggplot2")
mpg <- as.data.frame(ggplot2::mpg)
head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)

df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw

install.packages("dplyr")
library(dplyr)
df_new <- df_raw
df_new

df_new <- rename(df_new, v2=var2)
df_new
df_raw

df_new <- rename(df_new, v1=var1)
df_new

mpg <- as.data.frame(ggplot2::mpg)
mpg_new <- mpg        #mpg의 복사본
mpg_new
mpg_new <- rename(mpg_new, city = cty)
mpg_new <- rename(mpg_new, highway = hwy)
head(mpg_new)

#파생변수 만들기

df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))
df$var_sum <- df$var1 + df$var2
df
df$var_mean <- (df$var1 + df$var2)/2
df
head(mpg)
mpg$total <- (mpg$cty + mpg$hwy) /2
head(mpg)
mean(mpg$total)
summary(mpg$total)
hist(mpg$total)
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
head(mpg, 20)
table(mpg$test)
library(ggplot2)
qplot(mpg$test)

mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))
head(mpg)
table(mpg$grade)
qplot(mpg$grade)

mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 25, "B",
                           ifelse(mpg$total>=20, "C", "D")))
head(mpg)
qplot(mpg$grade2)

























