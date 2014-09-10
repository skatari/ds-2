pollutantmean <- function(directory, pollutant, id = 1:332) {
	# generate file names 
	file_names <- paste(formatC(id, width=3, flag="0"), "csv", sep = ".")
	files <- paste(directory, file_names, sep = "/")

	# determine the data column 
	c <- NA
	if(pollutant == "sulfate") {
		c <- 2
	} else if (pollutant == "nitrate") {
		dc <- 3
	} else {
		c
	}
	
	# fetch data for data files and compute the mean
	dd <- c()
	for(f in files) {
		data <- read.csv(f)
		cd <- data[,c]
		d <- cd[!is.na(cd)]
		dd <- c(dd, d)	
	}
	mean(dd)
}