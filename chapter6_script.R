library(dplyr)
exam <- read.csv("csv_exam.txt")
exam

exam %>% filter(class ==1)
exam %>% filter(class ==2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)
exam %>% filter(math >50)
exam %>% filter(class ==1 & math >= 50)
exam %>% filter(class == 2 & english >= 80)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(english <90 | science <50)
exam %>% filter(class ==1 | class == 3 | class ==5 )
exam %>% filter(class %in% c(1,3,5))

class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2)
mean(class1$math)
mean(class2$math)

#question

mpg
mpg1 <- mpg
displlow <- mpg1 %>% filter(displ<= 4)
displlow
displhigh <- mpg1 %>% filter(displ > 5)
displhigh
mean(displlow$hwy)
mean(displhigh$hwy)

audi <- mpg1 %>% filter(manufacturer == "audi")
audi
toyota <- mpg1 %>% filter(manufacturer == "toyota")
toyota

mean(audi$cty)
mean(toyota$cty)


car <- mpg1 %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
car
mean(car$hwy)

exam %>% select(math)
exam %>% select(english)

exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select(-math, -english)

exam %>% 
    filter(class == 1) %>%
    select(english)

exam %>% 
    select(id, math) %>% 
    head

exam %>% 
    select(id, math) %>% 
    head(10)


mpg
mpg1    #복사본
mpg1 %>% select(class, cty) %>% 
    head(10)

ctybyclass <- mpg1 %>% filter(class == "suv" | class == "compact")
ctybyclass
ctybyclass1 <- ctybyclass %>% select(class, cty) 
ctybyclass1

suv <- mpg1 %>% filter(class == "suv")
compact <- mpg1 %>% filter(class == "compact")
suv
compact
suv1 <- suv %>% select(class, cty)
suv1
compact1 <- compact %>% select(class, cty)
compact1
mean(suv1$cty)
mean(compact1$cty)

#--------------------------------------------------------------------------

exam %>% arrange(math)
exam %>% arrange(desc(math))
exam %>% arrange(class, math)

audi
audi %>% arrange(desc(hwy)) %>% head(5)

exam %>% mutate(total = math + english + science) %>% 
    head

exam %>%  mutate(total = math + english + science,
                 mean = (math + english + science)/3) %>%
    head
exam %>% mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
    head

exam %>% mutate(total = math + english + science) %>%
    arrange(total) %>% 
    head

# question

mpg1
mpg1 <- mpg1 %>% mutate(yeonbi = hwy + cty)
mpg1
mpg1 <- mpg1 %>% mutate(yeonbim = (hwy + cty)/2)
mpg1
mpg1 %>% arrange(yeonbim) %>% 
    head(3)


mpg <- mpg %>% 
    mutate(yeonbi = hwy + cty, 
           yeonbim = (hwy + cty)/2) %>% 
    arrange(yeonbim) %>% 
    head(3)
mpg

exam %>% summarise(mean_math = mean(math))

exam %>% 
    group_by(class) %>% 
    summarise(mean_math = mean(math))

exam %>% 
    group_by(class) %>% 
    summarise(mean_math = mean(math),
              sum_math = sum(math),
              median_math = median(math),
              n= n())

mpg <- as.data.frame(ggplot2::mpg)
mpg

mpg %>% 
    group_by(manufacturer, drv) %>% 
    summarise(mean_cty = mean(cty)) %>% 
    head(10)

mpg %>% 
    group_by(manufacturer) %>% 
    filter(class =="suv") %>% 
    mutate(tot = (cty + hwy)/2) %>% 
    summarise(mean_tot = mean(tot)) %>% 
    arrange(desc(mean_tot)) %>% 
    head(5)


#------question---------------
mpg

mpg %>% 
    group_by(class) %>% 
    summarise(cty_mean = mean(cty)) %>% 
    head()

mpg %>% 
    group_by(class) %>% 
    summarise(cty_mean = mean(cty)) %>% 
    arrange(desc(cty_mean)) %>% 
    head()

mpg %>% 
    group_by(manufacturer) %>% 
    summarise(hwy_mean = mean(hwy)) %>% 
    arrange(desc(hwy_mean)) %>% 
    head(3)

mpg %>% 
    group_by(manufacturer) %>%
    filter(class == "compact") %>%
    summarise(n = n()) %>% 
    arrange(desc(n))


test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,80,70,90,85))
test2 <- data.frame(id = c(1,2,3,4,5),
                    final = c(70,83,65,95,80))
test1
test2

total <- left_join(test1, test2, by="id")
total

name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim", "lee", "park", "choi", "jung"))
name
exam_new <- left_join(exam, name, by = "class")
exam_new

group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70, 83, 65, 95, 80))

group_a
group_b
group_all <- bind_rows(group_a, group_b)
group_all

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)
fuel

mpg

mpg_new <- left_join(mpg, fuel, by = "fl" )
mpg_new

mpg_new %>% 
    select(model,fl,price_fl) %>% 
    head(5)


