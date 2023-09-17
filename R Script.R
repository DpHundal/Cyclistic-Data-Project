## Installing and Loading packages

install.packages("tidyverse")
install.packages("lubridate")
library(tidyverse)
library(lubridate)

#Import and Merge Data from Dec2021 to Mar2022

dec2021_trip <- read_csv('202112-divvy-tripdata.csv')
jan2022_trip <- read_csv('202201-divvy-tripdata.csv')
feb2022_trip <- read_csv('202202-divvy-tripdata.csv')
mar2022_trip <- read_csv('202203-divvy-tripdata.csv')

#Checking colnames

colnames(dec2021_trip)
colnames(jan2022_trip)
colnames(feb2022_trip)
colnames(mar2022_trip)

#Processing Data (Merging the Data First)

Trips_Combined <-rbind(dec2021_trip,jan2022_trip,feb2022_trip,mar2022_trip)

##CLEANING DATA

#removing rows with missing values 

trip_clean <- na.omit(Trips_Combined) 

#removing duplicate rows

trip_clean<-distinct(trip_clean)

#changing formats of columns - started_at and ended_at by creating two new columns so as to calculate ride_length later

trip_clean$end_time <- as.POSIXct(trip_clean$ended_at, format = "%Y-%m-%d %H:%M")

trip_clean$start_time <- as.POSIXct(trip_clean$started_at, format = "%Y-%m-%d %H:%M")

#creating a separate column named ride_length which stands for total length of the ride and will later help us in our analysis

trip_clean$ride_length <- round(difftime(trip_clean$end_time,trip_clean$start_time,units='mins'),2)

#creating a separate column which shows the day of the week 

trip_clean$day_of_week <- wday(trip_clean$start_time,week_start = 1)

#removing rows with negative or zero values for data cleaning

trip_clean <- subset(trip_clean,ride_length>0)

# Upto this step, my cleaning process is complete

##ANALYZING DATA

summary(trip_clean$ride_length)

# calculate the minimum, maximum and average of ride_length for both casual and member riders

trip_clean %>% group_by(member_casual) %>% 
  summarise(minimum_ride_length=min(ride_length), maximum_ride_length= max(ride_length),average_ride_length= mean(ride_length))

# Calculating the total number of rides for different conditions



#Total number of rides for each type of member

trip_clean %>% group_by(member_casual) %>% 
  summarise(total_count=n())

#Total number of rides for each bike type

trip_clean %>% group_by(rideable_type) %>% 
  summarise(total_count=n())

#Total number of rides for each start station and end station

trip_clean %>% group_by(start_station_name,end_station_name) %>% 
  summarise(total_count=n())

#Total number of rides for each bike type and member type

trip_clean %>% group_by(member_casual,rideable_type) %>% 
  summarise(total_count=n())

#Total number of rides for each day of the week, 1 being the Monday

trip_clean %>% group_by(day_of_week) %>% 
  summarise(total_count=n())

#Total number of rides for each day of the week per each member type

trip_clean %>% group_by(member_casual,day_of_week) %>% 
  summarise(total_count=n())


#Calculating the average ride length for different conditions


#Average ride length for each type of member

trip_clean %>% group_by(member_casual) %>% 
  summarise(average_ride_length= mean(ride_length))

#Average ride length for each bike type

trip_clean %>% group_by(rideable_type) %>%
  summarise(average_ride_length= mean(ride_length))

#Average ride length for each start station and end station

trip_clean %>% group_by(start_station_name,end_station_name) %>% 
  summarise(average_ride_length= mean(ride_length))

#Average ride length for each member type and bike type

trip_clean %>% group_by(member_casual,rideable_type) %>% 
  summarise(average_ride_length= mean(ride_length))

#Average ride length for each day of the week, 1 being Monday

trip_clean %>% group_by(day_of_week) %>% 
  summarise(average_ride_length= mean(ride_length))

#Average ride length for each day of the week for each member type

trip_clean %>% group_by(member_casual,day_of_week) %>% 
  summarise(average_ride_length= mean(ride_length))

# Now that we have analyzed our data, we are in the position to answer some of the stakeholder's questions
# But to make it more easier and fun, we can get them the answers to their questions through visualizations

##VISUALIZING DATA

#Creating a pie chart for viewing contribution of each member type to total number of rides

member_percentage <- trip_clean %>% 
  group_by(member_casual) %>% 
  summarise(count=n()) %>% 
  mutate(perc=count/sum(count)) %>% 
  ungroup()
  
ggplot(member_percentage,aes(x="",y=perc,fill= member_casual))+geom_bar(stat = "identity",width = 1)+
  coord_polar(theta = "y")+labs(title = "Distribution of Total rides among Different member types",fill="member type")

# Total number of rides for each member type and bike type

trip_clean %>% group_by(member_casual,rideable_type) %>% 
  summarise(total_count=n()) %>% 
  ggplot(aes(x=rideable_type,y=total_count,fill=member_casual))+geom_bar(position="dodge", stat="identity")+
  labs(title = "Number of rides for each bike type and fro each rider type",x="Bike Type",y="Number of rides")+theme_minimal()

# Total number of rides for each day of the week per each member type

trip_clean %>% group_by(member_casual,day_of_week) %>% 
  summarise(total_count=n()) %>% 
  ggplot(aes(x=day_of_week,y=total_count,fill=member_casual))+geom_bar(position="dodge", stat="identity")+
  labs(title = "Number of rides for Different Days of Week for each Member Type",x="Day of Week 1 being Mon",y="Number of rides")

#Average Ride Length by Member Type 
trip_clean %>% group_by(member_casual) %>% 
  summarise(average_ride_length= mean(ride_length)) %>% 
  ggplot(aes(x=member_casual,y=average_ride_length,fill=member_casual))+geom_bar(position = "dodge",stat = "identity")+
  labs(title = "Average Ride Length by Member Type",x="Type of rider",y="Average Ride Length")

#Average Ride Length by Member and Type of Ride

trip_clean %>% group_by(member_casual,rideable_type) %>% 
  summarise(average_ride_length= mean(ride_length)) %>% 
  ggplot(aes(x=rideable_type,y=average_ride_length,fill=member_casual))+geom_bar(position = "dodge",stat = "identity")+
  labs(title = "Average Ride Length by Member Type and Type of Bike",x="Type of Bike",y="Average Ride Length")

