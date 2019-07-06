english <- c(90,80,60,70)
english

math <- c(50,60,100,20)
math

df_midterm <- data.frame(english, math)
df_midterm

class <- c(1,1,2,2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

df_midterm <-data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class= c(1,1,2,2))
df_midterm


#다음 표의 내용을 데이터 프레임으로 만들어 출력해보세요

df_fruits <- data.frame( "제품" = c("사과", "딸기", "수박"),
                         "가격" = c(1800, 1500, 3000),
                         "판매량" = c(24, 38, 13))
df_fruits

mean(df_fruits$"가격")
mean(df_fruits$"판매량")

#엑셀파일 이용하기
install.packages("readxl")
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")
df_exam

mean(df_exam$english)
mean(df_exam$science)

#csv 파일 이용하기
df_csv_exam <- read.csv("csv_exam.txt")
df_csv_exam

df_csv_exam <- read.csv("csv_exam.txt", stringsAsFactors = F)
df_csv_exam

df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm
write.csv(df_midterm, file = "df_midterm.csv")

#Rda 파일 이용하기기
save(df_midterm, file = "df_midterm.rda")
rm(df_midterm)
load("df_midterm.rda")
df_midterm










