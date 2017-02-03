library(dplyr)
library(lubridate)

# This function loads:
#       - loads the data in filename to a data frame
#       - subsets the data to only the targe days for the analysis (Feb 1 and 2, 2007)
#       - Creates a datetime column based on the date and time string columns and drops the date and time columns
#       - Converts all other columns to type numeric (Missing values set to NA instead of ? at this stage) 

load_electrical_data <- function(filename) {
        hpc <- read.csv(filename, sep = ";", as.is =  TRUE)
        targ_date_strings <-
                c(
                        "1/2/2007","01/02/2007","01/2/2007","1/02/2007", "2/2/2007","02/02/2007","02/2/2007", "2/02/2007"
                )
        hpc_just_targ_dates <- filter(hpc, Date %in% targ_date_strings)
        hpc_just_targ_dates <-
                mutate(hpc_just_targ_dates, datetime = parse_date_time(paste(Date, Time), '%d/%m/%y %H%M%S'))
        hpc_just_targ_dates <- select(hpc_just_targ_dates,-(Date:Time))
        i <- 1
        while (i <= 6) {
                hpc_just_targ_dates[,i] <- as.numeric(hpc_just_targ_dates[,i])
                i <- i + 1
        }
        return(hpc_just_targ_dates)
}
