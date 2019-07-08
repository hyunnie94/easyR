library(dplyr)


midwest <- as.data.frame(ggplot2::midwest)
midwest

midwest <- midwest %>% 
    mutate(percchild = (poptotal - popadults)*100/poptotal)
    


midwest %>%
    select(county, percchild) %>%
    arrange(desc(percchild)) %>% 
    head(5)


midwest <- midwest %>% 
    mutate(grade = ifelse(percchild >= 40, "large",
                        ifelse(percchild >= 30, "middle", "small")))
table(midwest$grade)




midwest <- midwest %>% 
    mutate(ratio_asian = popasian*100/poptotal)
midwest

midwest %>% 
    select(state, county, ratio_asian) %>% 
    arrange(ratio_asian) %>% 
    head(10)


