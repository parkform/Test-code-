### This is some code to practice using Github

### YAY!!


### set working directory and download data
setwd("/Volumes/GoogleDrive-108505658869240529132/My Drive/Unfiltered_2019_EMPE/")

# download data
divetest<- fread("EMPE_2019_CACR_Pen3_Axy6_raw.csv",na.strings = c("", NA)); head(divetest)


### filter data
divet<- divet %>% 
  drop_na(Depth) %>% 
  rename(gspeed = `ground-speed`, TempC = `Temp. (?C)`) %>% 
  dplyr::select(Timestamp, Depth, Activity, gspeed, TempC)

### format time
divet$Timestamp <- as.POSIXct(divet$Timestamp, format = c("%m/%d/%Y %H:%M:%OS"), tz = "GMT")

### create TDR file
tdrX <- createTDR(time=divet$Timestamp,
                  depth=divet$Depth,
                  concurrentData=divet[, -c(1:2)],
                  dtime=1, file="EMPE_2019_CACR_Pen3_Axy6_raw.csv")

### plot dives 
plotTDR(tdrX)


########################################################################dafsdfasdfasdfasdfasdfasdfasdfasdf