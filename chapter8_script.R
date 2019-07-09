library(ggplot2)
ggplot(data = mpg, aes(x = displ, y= hwy))
ggplot(data = mpg, aes(x = displ, y= hwy)) + geom_point()
ggplot(data = mpg, aes(x = displ, y= hwy)) + geom_point() + xlim(3,6)
ggplot(data = mpg, aes(x = displ, y= hwy)) + geom_point() + xlim(3,6) + ylim(10, 30)


ggplot(data = mpg, aes(x= cty, y= hwy)) + geom_point()

ggplot(data = midwest, aes(x= poptotal, y= popasian)) + geom_point() +xlim(0, 500000) + ylim(0, 10000)


library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)
df_mpg <- mpg %>% 
    group_by(drv) %>% 
    summarise(mean_hwy = mean(hwy))

df_mpg

ggplot(data = df_mpg, aes(x=drv, y = mean_hwy)) + geom_col()
ggplot(data = df_mpg, aes(x= reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()     #크기순으로 정렬

ggplot(data = mpg, aes(x= drv)) + geom_bar()
ggplot(data = mpg, aes(x= hwy)) + geom_bar()

#----------question------------------------

mpg

df1_mpg <- mpg %>% 
    filter(class == "suv") %>% 
    group_by(manufacturer) %>% 
    summarise(mean_cty = mean(cty)) %>% 
    arrange(desc(mean_cty)) %>% 
    head(5)
df1_mpg

ggplot(data = df1_mpg, aes(x=reorder(manufacturer, -mean_cty), 
                           y = mean_cty)) + geom_col()



ggplot(data = mpg, aes(x = class)) + geom_bar(aes(fill = fl)) #색 어떻게 채우는건데...

ggplot(data = economics, aes(x = date, y = unemploy)) + geom_line()

ggplot(data = economics, aes(x = date, y = psavert)) + geom_line()


ggplot(data = mpg, aes(x = drv, y = hwy)) + geom_boxplot()

df2_mpg <- mpg %>% 
    filter(class == "compact"| class == "subcompact"| class == "suv")
df2_mpg

ggplot(data = df2_mpg, aes(x = class, y= cty)) + geom_boxplot()


