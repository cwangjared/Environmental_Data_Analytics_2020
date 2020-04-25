#know which packages are loaded
(.packages())

#install package
#install.packages("tidyr")
library(tidyr)
library(tidyverse)

#unload certain packages
#detach("package:tidyr", unload=TRUE)

#create a dataframe
vec.day <- c(1, 1, 1, 2, 2, 2, 3, 3, 3)
vec.hour <- c(8, 16, 24, 8, 16, 24, 8, 16, 24)
vec.value <- c(100, 120, 110, 90, 90, 190, 200, 80, 150)
df.test <- data.frame(vec.day, vec.hour, vec.value)

#collapse hourly values to daily values (take average)
df.final <- df.test %>%
  group_by(vec.day) %>%
  mutate(value.mean = mean(vec.value))

#if you don't want to have repeated average values (turn the dataframe to three observations) ...
df.final <- df.test %>%
  group_by(vec.day) %>%
  summarise(value.mean = mean(vec.value)) #other variables will be erased here