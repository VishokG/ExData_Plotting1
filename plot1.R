library(lubridate)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "zipe.zip")
unzip("zipe.zip")
con = read.table("household_power_consumption.txt")
tidyCon = data.frame(matrix(nrow = 0, ncol = 9))
colnames(tidyCon) = unlist(strsplit(con[1,1], ";"))
i = 2
while(TRUE){
    if(parse_date_time2(unlist(strsplit(con[i,1], ";"))[1], orders = "dmY") == parse_date_time2("2007-02-01", orders = "Ymd")){
        break
    }
    print(i)
    i = i + 1
}
k = i
while(TRUE){
    if(parse_date_time2(unlist(strsplit(con[i,1], ";"))[1], orders = "dmY") == parse_date_time2("2007-02-02", orders = "Ymd")){
        break
    }
    print(i)
    i = i + 1
}

for(j in k:(i+1440)){
    tidyCon = rbind(tidyCon, unlist(strsplit(con[j,1], ";")))
}
colnames(tidyCon) = unlist(strsplit(con[1,1], ";"))

png("plot1.png", width = 480, height = 480)

hist(as.numeric(tidyCon$Global_active_power), xlab = "Global Active Power", ylab = "Frequency", main = "Global Active Power", col = "red")

dev.off()