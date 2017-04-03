##This plot function creates a multiline plot of Date&Time vs 3 Submetering data. It stores the plot in PNG format.

plot3 <- function() {
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
            filename = "plot3.png",
            width = 480,
            height = 480,
            units = "px"
      )
      
      ##Create Plot and add one line
      plot(
            power_data$Date_time,
            as.numeric(power_data$Sub_metering_1),
            xlab = "",
            ylab = "Energy sub metering",
            type = "l"
      )
      
      ##Add subsequent lines
      lines(
            power_data$Date_time,
            as.numeric(power_data$Sub_metering_2),
            col = "red",
            type = "l"
      )
      lines(
            power_data$Date_time,
            as.numeric(power_data$Sub_metering_3),
            col = "blue",
            type = "l"
      )
      
      ##Create Legend
      legend(
            "topright",
            lty = c(1, 1, 1),
            lwd = c(1, 1, 1),
            col = c("black", "red", "blue"),
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
      )
      
      #Close connection and save file.
      dev.off()
}