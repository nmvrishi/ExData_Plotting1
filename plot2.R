##This plot function creates a two dimensional plot with Date&Time on the x axis and Global Active power on y axis. It stores the plot in PNG format.
plot2 <- function() {
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
            filename = "plot2.png",
            width = 480,
            height = 480,
            units = "px"
      )
      
      ##Create the plot
      plot(
            power_data$Date_time,
            as.numeric(power_data$Global_active_power),
            type = "l",
            xlab = "",
            ylab = "Global Active Power (kilowatts)"
      )
      
      #Close connection and save file.
      dev.off()
      
}