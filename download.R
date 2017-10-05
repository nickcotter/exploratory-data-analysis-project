
if(!file.exists("NEI_data.zip")) {
        download.file(
                "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip",
                "NEI_data.zip"
        )
}

unzip("NEI_data.zip")