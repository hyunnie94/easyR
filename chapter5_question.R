#ggplot2 패키지에는 미국 동북중부 437개 지역의 인구통계 정보를 담은 midwest라는 데이터가 들어있습니다.
#midwest 데이터를 사용해 데이터 분석 문제를 해결해 보세요

midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
midwest_new <- midwest
head(midwest_new)
tail(midwest_new)
View(midwest_new)
dim(midwest_new)
str(midwest_new)
summary(midwest_new)

midwest_new <- rename(midwest_new, total = poptotal, asian = popasian)
midwest_new

midwest_new$asianpercentage <- ( midwest_new$asian / midwest_new$total ) * 100
head(midwest_new)
hist(midwest_new$asianpercentage)

mean(midwest_new$asianpercentage)

midwest_new$asianpersize <- ifelse(midwest_new$asianpercentage > 0.4872464, "large", "small")
head(midwest_new)
table(midwest_new$asianpersize)
qplot(midwest_new$asianpersize)
