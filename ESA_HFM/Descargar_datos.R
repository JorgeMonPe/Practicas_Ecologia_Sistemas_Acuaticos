# Package ID: knb-lter-ntl.303.20 Cataloging System:https://pasta.edirepository.org.
# Data set title: North Temperate Lakes LTER High Frequency Water Temperature Data, Dissolved Oxygen, Chlorophyll, pH - Crystal Lake 2011 - 2014.
# Data set creator:  John Magnuson - University of Wisconsin 
# Data set creator:  Stephen Carpenter - University of Wisconsin 
# Data set creator:  Emily Stanley - University of Wisconsin 
# Data set creator:  NTL Lead PI - University of Wisconsin 
# Metadata Provider:  NTL Information Manager - University of Wisconsin 
# Contact:  NTL Information Manager -  University of Wisconsin  - ntl.infomgr@gmail.com
# Contact:  NTL Lead PI -  University of Wisconsin  - ntl.leadpi@gmail.com
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@Virginia.edu 
#
#install package tidyverse if not already installed
if(!require(tidyverse)){ install.packages("tidyverse") }  
library("tidyverse") 
infile1 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-ntl/303/20/b9b3b932deec8f3e71fb8d70cacf6a0e") 
infile1 <-sub("^https","http",infile1)
# This creates a tibble named: dt1 
dt1 <-read_delim(infile1  
                 ,delim=","   
                 ,skip=1 
                 , col_names=c( 
                   "sampledate",   
                   "year4",   
                   "daynum",   
                   "sample_time",   
                   "depth_calculated",   
                   "wtaer_temp",   
                   "flag_water_temp",   
                   "pH",   
                   "flag_ph",   
                   "chlorophylla",   
                   "flag_chlorophylla",   
                   "opt_do2",   
                   "flag_do2",   
                   "opt_dosat_raw",   
                   "flag_opt_dosat_raw"   ), 
                 col_types=list(
                   col_character(), 
                   col_number() , 
                   col_number() , 
                   col_character(), 
                   col_number() , 
                   col_number() ,  
                   col_character(), 
                   col_number() ,  
                   col_character(), 
                   col_number() ,  
                   col_character(), 
                   col_number() ,  
                   col_character(), 
                   col_number() ,  
                   col_character()), 
                 na=c(" ",".","NA")  )


# Observed issues when reading the data. An empty list is good!
problems(dt1) 
# Here is the structure of the input data tibble: 
glimpse(dt1) 
# And some statistical summaries of the data 
summary(dt1) 
# Get more details on character variables

summary(as.factor(dt1$flag_water_temp)) 
summary(as.factor(dt1$flag_ph)) 
summary(as.factor(dt1$flag_chlorophylla)) 
summary(as.factor(dt1$flag_do2)) 
summary(as.factor(dt1$flag_opt_dosat_raw))

#Exportamos los datos descargados (dt1) a la carpeta "Datos"

write.csv(dt1, "Datos/Datos_Crystal.csv", row.names = FALSE)



