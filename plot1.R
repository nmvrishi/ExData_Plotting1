##This plot function create a one dimensional histogram of Global_active_power of the household power consumption data. It stores the plot in PNG format
plot1 <- function() {
      ##Store datasetURL location in variable.
      dataSetURL <-
            "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      
      ##Download the dataset zip file.
      download.file(dataSetURL, destfile = "household_power_consumption.zip")
      
      ##Extract the zip file and read the household_power_consumption.txt dataset.
      household_power_data <-
            read.table(
                  con <-
                        unz(
                              "household_power_consumption.zip",
                              "household_power_consumption.txt"
                        ),
                  header = TRUE,
                  sep = ";",
                  na.strings = "?"
            )
      
      ##Get the data necessary for assignment.
      power_data <-
            household_power_data[as.character(household_power_data$Date) %in% c("1/2/2007", "2/2/2007"), ]
      
      ##Create a new column combining and formatting date and time.
      power_data$Date_time <-
            strptime(paste(power_data$Date, power_data$Time),
                     "%d/%m/%Y %H:%M:%S")
      
      ##Initialize the PNG file
      png(
            filename = "plot1.png",
            width = 480,
            height = 480,
            units = "px"
      )
      
      #Create the histogram
      hist(
            as.numeric(power_data$Global_active_power),
            col = "red",
            xlab = "Global Active Power (kilowatts)" ,
            main = "Global Active Power"
      )
      
      #Close connection and save file.
      dev.off()
      
}