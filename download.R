if(!file.exists("NEI_data.zip")) {
        download.file(
                "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                "NEI_data.zip"
        )
}

if(!file.exists("Source_Classification_Code.rds") || 
   !file.exists("summarySCC_PM25.rds")) {
        unzip("NEI_data.zip")
}