#plotly 패키지로 인터랙티브 그래프 만들기  -> 마우스 커서를 그래프에 대면 개별 값이 나타남

install.packages("plotly") #인터랙티브 그래프를 만들기 위해 필요한 패키지
library(plotly)

library(ggplot2)

p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()  #ggplot2를 이용해서 산점도 그리기

ggplotly(p) #plotly 패키지의 ggplotly함수를 위의 그래프에 적용해 인터랙티브 그래프 그리기


p <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) + geom_bar(position = "dodge")
#ggplot2를 이용해서 막대그래프 만들기


ggplotly(p)              #plotly 패키지의 ggplotly함수를 위의 그래프에 적용해 인터랙티브 그래프 그리기


#--------------------------------------------------------------------------------------------------------
#dygraphs 패키지로 인터랙티브 시계열 그래프 그리기

install.packages("dygraphs")    #인터랙티브 시계열 그래프 그리기 위해 필요한 패키지
library(dygraphs)

economics <- ggplot2::economics  #ggplot2 패키지의 economics 데이터 불러오기
head(economics)

library(xts) #R에 이미 설치되어 있는 패키지. 시간 순서 속성을 가지는 xts 데이터 타입으로 바꿔주는 패키지.
eco <- xts(economics$unemploy, order.by = economics$date) #unemploy 데이터를 xts 타입으로 변경
head(eco)

dygraph(eco)   #인터랙티브 시계열 그래프 생성

dygraph(eco) %>% dyRangeSelector()  #그래프 밑에 날짜 범위 선택 기능 추가

eco_a <- xts(economics$psavert, order.by = economics$date) #저축률 데이터 xts타입으로 바꾸기

eco_b <- xts(economics$unemploy/1000, order.by = economics$date) #100만명 단위로 수정, xts타입으로 바꾸기

eco2 <- cbind(eco_a, eco_b) #두 데이터를 가로로 결합. 열결합
colnames(eco2) <- c("psavert", "unemploy")  #xts타입이라 rename()이 적용 안됨. colnames()이용해 변수명 수정
head(eco2)

dygraph(eco2) %>% dyRangeSelector() # 두 데이터가 동시에 나타나는 인터랙티브 시계열 그래프













