#LOAD LIBRARIES

library(tidyverse)
library(readxl)
library(lubridate)
library(writexl)

# Replace 'file_path.xlsx' with the actual path to your Excel or CSV file
#If you use csv file just type read_csv instead of read_excel
df <- read_excel("file_path.xlsx")
View(df)

# I'm assuming your date column is named 'date', replace it with the actual column name
df$date <- parse_date_time(df$date, orders = c("mdy", "dmy", "ymd"))

df$date <- coalesce(parse_date_time(df$date, orders = c("mdy", "dmy", "ymd")), as.Date(df$date, format = "%m/%d/%Y"))

# Sort it by the Date column
df <- df %>% arrange(date)

#View data frame again just to check everything is fine
View(df)

# Replace 'sorted_file.xlsx' with the desired output file name
write_xlsx(df, "file_path/new_file_name.xlsx")
