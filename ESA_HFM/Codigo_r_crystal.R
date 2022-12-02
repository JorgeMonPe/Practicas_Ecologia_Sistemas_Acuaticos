#Library
library(tidyverse)

#Importar datos
Crystal <- read_csv("Datos/Datos_Crystal.csv")

#Vistazo general
summary(Crystal)
View(Crystal)

#Nos quedamos sólo con los datos del 2012
Crystal_2012 <- filter(Crystal, year4 == 2012)
rm(Crystal) #Aprovechamos para eliminar el otro objeto que no nos va a servir.

#Seleccionamos las variables que nos interesan
Crystal_2012_temp <- select(Crystal_2012, "sampledate", "daynum", "depth_calculated", "wtaer_temp")

#representamos
ggplot(filter(Crystal_2012_temp, depth_calculated == 1), aes(x= sampledate, y=wtaer_temp))+
  geom_point()

ggplot(filter(Crystal_2012_temp, depth_calculated == 17 & daynum == 260), aes(x= sampledate, y=wtaer_temp))+
  geom_point()

ggplot(Crystal_2012_temp, aes(x= sampledate, y=depth_calculated))+
  geom_point()
Test_depth <- Crystal_2012 %>% group_by(daynum, depth_calculated) %>% summarise(n = n())
Crystal_2012 %>% group_by(daynum, depth_calculated) %>% summarise(n = n())

uno <- Crystal_2012 %>% filter(depth_calculated == 1)  %>% select(daynum)
dos <- select(filter(Crystal_2012, depth_calculated == 1), daynum)
hour(Crystal_2012$sampledate)
minute(Crystal_2012$sampledate)
yday(Crystal_2012$sampledate)

#nos quedamos sólo con las muestras tomadas entres las 11:00 y las 16:00
Crystal_dia <- Crystal_2012 %>% filter(hour(sampledate) >= "11:00" & hour(sampledate) <= "16:00")
#Calculamos la temperatura media por día y profundidad
Crystal_dia %>% group_by(daynum, depth_calculated) %>% summarise(mean(wtaer_temp))

ggplot(Test_depth, aes(x = as.factor(depth_calculated), y = n))+
  geom_boxplot()
ggplot(Test_depth, aes(x = depth_calculated, y = n))+
  geom_point()

ggplot(filter(Crystal_2012_temp, daynum == 260), aes(x= sampledate, y=wtaer_temp))+
  geom_point()+
  scale_x_datetime(date_labels = "%H")+
  facet_wrap(~depth_calculated)
