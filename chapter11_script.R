install.packages("ggiraphExtra")  #단계구분도(Choropleth Map)를 만들기 위한 패키지
library(ggiraphExtra)

str(USArrests)       #미국 주(state)별 강력 범죄율 정보
 
head(USArrests)
library(tibble)       #dpylr 패키지에 포함된 패키지 밑의 rownames_to_column 함수를 사용하기 위해 꺼낸다

crime <- rownames_to_column(USArrests, var = "state")  #행 이름이 곧 주 이름이였는데 주 이름을 가지는 열을 따로                                                         생성
crime$state <- tolower(crime$state)       #state의 문자를 모두 소문자로

str(crime)
library(ggplot2)  #map_data()를 사용하기 위해 불러온다.

install.packages("maps")  #미국의 주 별 위경도를 나타낸 state 데이터를 꺼내오기 위해 깐다.

states_map <- map_data("state")  #state 데이터를 데이터 프레임의 형태로 불러온다.
str(states_map)

install.packages("mapproj")   #책에는 따로 나와있지 않지만 에러가 나서 추가로 깔았음..

ggChoropleth(data = crime,
             aes(fill = Murder, map_id = state), #색깔로 표현할 변수, 지역 기준 변수(여기선 위경도로 나눴구만)
             map = states_map)  #지도 데이터

ggChoropleth(data = crime,
             aes(fill = Murder, map_id = state),
             map = states_map,
             interactive = T)      #마우스 움직임에 반응하는 단계구분도를 만들 수 있다.

#------------------------------------------------------------------

install.packages("stringi")   #kormaps2014 패키지를 사용하는데 필요한 패키지

remove.packages("stringi")     #근데 왜인지 모르게 에러나서 다시 지우고 깔음. 그랬더니 됨..


install.packages("stringi")
install.packages("devtools")  #크랜이 아니라 깃허브에 공유된 패키지를 사용하기 위한 함수가 포함되어있다.
devtools::install_github("cardiomoon/kormaps2014") #깃허브에서 지도 데이터 가져오기
library(kormaps2014)

str(changeCode(korpop1))      #지도에서 한글이 깨지지 않도록 코드 변환

library(dplyr)  #rename함수 사용하기 위해 깔아준다.
korpop1 <- rename(korpop1, pop = 총인구_명,           #변수명이 한글이면 오류 발생할수도 있으니 깔아준다.
                           name = 행정구역별_읍면동)

str(changeCode(kormap1))      #한글이 깨지지 않도록 코드 변환

library(ggiraphExtra)

ggChoropleth(data = korpop1,
             aes(fill = pop, map_id = code, tooltip = name), #tooltip을 이용해 코드대신 지역명 표시되도록.
             map = kormap1,
             interactive = T)

#-----------------------------------------------------------------------

str(changeCode(tbc))  #kormaps2014 패키지에 있는 지역별 결액 환자 수 데이터

ggChoropleth(data = tbc,
             aes(fill = NewPts, map_id = code, tooltip = name),
             map = kormap1,
             interactive = T)






