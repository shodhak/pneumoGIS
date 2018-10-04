rm(list=ls())
ind_adm2 <- read.csv("IND_adm/IND_adm2.csv")
`2008-2009` <- read.csv("hmis_yearly/processed_data/2008-2009/2008-2009.csv")
pneumogis_ts <- merge(ind_adm2, `2008-2009`, by.x = c("NAME_1","NAME_2"), by.y = c("State","District"), all.x = TRUE)
colnames(pneumogis_ts)[ncol(pneumogis_ts)] <- "2008-2009"

`2009-2010` <- read.csv("hmis_yearly/processed_data/2009-2010/2009-2010.csv")
pneumogis_ts <- merge(pneumogis_ts, `2009-2010`, by.x = c("NAME_1","NAME_2"), by.y = c("State","District"), all.x = TRUE)
colnames(pneumogis_ts)[ncol(pneumogis_ts)] <- "2009-2010"

`2010-2011` <- read.csv("hmis_yearly/processed_data/2010-2011/2010-2011.csv")
pneumogis_ts <- merge(pneumogis_ts, `2010-2011`, by.x = c("NAME_1","NAME_2"), by.y = c("State","District"), all.x = TRUE)
colnames(pneumogis_ts)[ncol(pneumogis_ts)] <- "2010-2011"

`2011-2012` <- read.csv("hmis_yearly/processed_data/2011-2012/2011-2012.csv")
pneumogis_ts <- merge(pneumogis_ts, `2011-2012`, by.x = c("NAME_1","NAME_2"), by.y = c("State","District"), all.x = TRUE)
colnames(pneumogis_ts)[ncol(pneumogis_ts)] <- "2011-2012"

`2012-2013` <- read.csv("hmis_yearly/processed_data/2012-2013/2012-2013.csv")
pneumogis_ts <- merge(pneumogis_ts, `2012-2013`, by.x = c("NAME_1","NAME_2"), by.y = c("State","District"), all.x = TRUE)
colnames(pneumogis_ts)[ncol(pneumogis_ts)] <- "2012-2013"

`2013-2014` <- read.csv("hmis_yearly/processed_data/2013-2014/2013-2014.csv")
pneumogis_ts <- merge(pneumogis_ts, `2013-2014`, by.x = c("NAME_1","NAME_2"), by.y = c("State","District"), all.x = TRUE)
colnames(pneumogis_ts)[ncol(pneumogis_ts)] <- "2013-2014"

`2014-2015` <- read.csv("hmis_yearly/processed_data/2014-2015/2014-2015.csv")
pneumogis_ts <- merge(pneumogis_ts, `2014-2015`, by.x = c("NAME_1","NAME_2"), by.y = c("State","District"), all.x = TRUE)
colnames(pneumogis_ts)[ncol(pneumogis_ts)] <- "2014-2015"

`2015-2016` <- read.csv("hmis_yearly/processed_data/2015-2016/2015-2016.csv")
pneumogis_ts <- merge(pneumogis_ts, `2015-2016`, by.x = c("NAME_1","NAME_2"), by.y = c("State","District"), all.x = TRUE)
colnames(pneumogis_ts)[ncol(pneumogis_ts)] <- "2015-2016"

`2016-2017` <- read.csv("hmis_yearly/processed_data/2016-2017/2016-2017.csv")
pneumogis_ts <- merge(pneumogis_ts, `2016-2017`, by.x = c("NAME_1","NAME_2"), by.y = c("State","District"), all.x = TRUE)
colnames(pneumogis_ts)[ncol(pneumogis_ts)] <- "2016-2017"





