#Read the file

airCrash <- read.delim("C:\\Users\\ksaldanh\\DataScienceProjects\\Air_Crash_Analysis\\AirplaneCrashes.csv", header = T, sep = ",")

#Create a new column year, it will help us to visualize crashes according to year
crash_Date <- airCrash$Date
crash_Date <- as.character(crash_Date)
Date_Year <- strsplit(crash_Date, "/")

for (i in 1:length(Date_Year)) 
{
  airCrash$Date_Year <- Date_Year[[i]][3]  
  airCrash$Date_Year <- as.numeric(airCrash$Date_Year)
  if(airCrash$Date_Year[i]>1900 & airCrash$Date_Year[i]<=1940)
  {

    airCrash$Data_Continous[i] <- "1900-1940"
  }
  else if(airCrash$Date_Year[i]>1940 & airCrash$Date_Year[i]<=1980)
  {

    airCrash$Data_Continous[i] <- "1941-1980"
  }
  else
  {
    airCrash$Data_Continous[i] <- "1981-2010"
  }
}

#Let us see if air travel has gotten safer over the years
png(file = "aircrashes_through_the_years.png")

barplot(table(airCrash$Data_Continous), main="Air Crashes through the decades", xlab="Decades", ylab = "Number of Crashes")

dev.off()


#Get total fatalaties
airCrash$Total_Fatalaties <- airCrash$Fatalities+airCrash$Ground

