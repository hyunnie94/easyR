df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5,4,3,4,NA))
df

is.na(df)
table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

library(dplyr)
df %>% filter(is.na(score))
df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)
sum(df_nomiss$score)

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss

df_nomiss2 <- na.omit(df)
df_nomiss2

mean(df$score, na.rm = T)

sum(df$score, na.rm = T)

exam <- read.csv("csv_exam.txt")
exam[c(3,8,15), "math"] <- NA
exam

exam %>% summarise(mean_math = mean(math))
exam %>%  summarise(mean_math = mean(math, na.rm=T))

exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median_math = median(math, na.rm = T))


mean(exam$math, na.rm = T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
exam            #결측치 사라짐
mean(exam$math)

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
mpg


table(is.na(mpg$drv))
table(is.na(mpg$hwy))

mpg_new <- mpg %>%
    filter(!is.na(hwy)) %>%
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy))
mpg_new

outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(5,4,3,4,2,6))
outlier
table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier

outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

outlier %>% 
    filter(!is.na(sex) & !is.na(score)) %>% 
    group_by(sex) %>% 
    summarise(mean_score = mean(score))

boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))
boxplot(mpg$hwy)  #극단값을 결측치 처리한 후의 상자 그림

mpg %>% 
    group_by(drv) %>%
    summarise(mean_hwy = mean(hwy, na.rm = T))


#-----------question

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)

table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% c("4", "f", "r"), mpg$drv, NA)
mpg
table(mpg$drv)


boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty <9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)


mpg_new <- mpg %>% 
    filter(!is.na(mpg$drv) & !is.na(mpg$cty)) %>% 
    group_by(drv) %>% 
    summarise(mean_cty = mean(cty))
mpg_new




