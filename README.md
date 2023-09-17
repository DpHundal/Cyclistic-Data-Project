# Cyclistic Data Project
##### By Dilpreet Singh
## Background

Cyclistic is a bike-share offering launched in 2016 and has only grown since then. It has a total of 5,824 bicycles which are geotracked and locked into a network of 692 stations across Chicago. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

## Ask

*Business Question:*

How do annual members and casual riders use Cyclistic bikes differently?

*Key Stakeholders:*


1.	Lily Moreno
2.	Cyclistic marketing analytics team
3.	Cyclistic executive team

*Deliverable:* 

Use the given dataset to understand the difference between casual riders and annual members based on their needs and other metrics. After analyzing the data, help the marketing team to convert casual riders into annual members by giving them recommendations. 

## Prepare

The data contains information about different rides taken by both casual riders and annual members between December 2021 and March 2022 (a period of 12 months).

Link to Data Source: [Click Here](https://divvy-tripdata.s3.amazonaws.com/index.html)

## Process

For this dataset, I will be using R to combine the data for the months of December 2021 to March 2022, analyze the data and visualize it all in one place. R is a great one stop shop for different data operations including cleaning and visualizing. 

**Data Cleaning**

•	Removed rows with missing values using na.omit() function.

•	Removed duplicate rows using distinct() function.

•	Created two new columns named ‘start_time’ and ‘end_time’ by changing the format of ‘ended_at’ and ‘started_at’ from ‘character’ to ‘datetime’.

•	Created another new column named ‘ride_length’ by calculating the difference between ‘end_time’ and ‘start_time’ in mins.

•	Cleaned any row negative or zero value in ride_length column.

•	Created another column named day_of_week which shows the Day of the Week, with 1 being Monday and so on.

## Analyze

Now that we have assured the data integrity, we are finally at the analyze phase where we perform some functions to extract data and get answer to the stakeholder’s question: “How do annual members and casual riders use Cyclistic differently?” 

•	Utilizing the summarise() function, I calculated the mean, minimum, and maximum ride lengths for both categories of riders after ensuring data integrity.

•	Subsequently, I delved deeper into the dataset to uncover more intriguing insights. Employing the same summarise() function, I determined the total number of rides for each membership type and also for each bicycle type.

•	To gain a granular perspective, I calculated the total number of rides for each combination of start and end stations. This data not only assisted in addressing stakeholder queries but also provided valuable input for future data-driven decisions.

•	I calculated the total number of rides for each day of the week, with Monday designated as 1. This analysis was performed separately for each rider type, shedding light on weekly utilization patterns.

•	By employing the mean() function, I ascertained the average ride length for both rider types and types of bikes.

•	Further, I determined the average ride length for each day of the week, differentiating between rider types.

**Summary of Analysis:** 

Distinguishing factors between casual riders and annual members reveal notable patterns. Casual riders, while accounting for approximately one-third of annual members in terms of ride frequency, exhibit a distinct behavior: they engage in rides with an average length more than double that of annual members. This implies that, despite their lower ride frequency, casual riders tend to embark on significantly longer journeys.

Among casual, the classic bike takes the lead as the preferred choice, used more frequently than other options. In contrast, annual members show a balanced preference, evenly splitting their utilization between electric and classic bikes. It's noteworthy that both groups demonstrate a lesser inclination toward docked bikes, even though this category boasts the longest average ride length.

Analyzing ridership across weekdays reveals intriguing trends. When considering all riders, Thursdays emerge as the most profitable day. However, casual riders display a slight preference for Fridays, suggesting a nuanced variance in ridership patterns that warrants further exploration.

## Share

Visualizations are a great way of depicting our key findings and can serve as a one stop shop for our stakeholders to get answers to most of the possible questions about a dataset. Firstly, I will use Pie Chart to discern the differences between annual members and casual riders.

**#1 Distribution of Total Rides between Casual Riders and Annual Members**

![image](https://github.com/DpHundal/Cyclistic-Data-Project/assets/139656045/7c58139d-1eca-4af6-bc14-7c5793e3c804)


*Looking at the Chart, we can say that the members make up to about 74% of the Total Rides.*

**#2 Number of rides for each day of the week for each type of rider**

![image](https://github.com/DpHundal/Cyclistic-Data-Project/assets/139656045/51c90778-2a01-413d-b30a-9334b804e693)

*When considering all riders, Thursdays emerge as the most profitable day. However, casual riders display a slight preference for Fridays, suggesting a variance in ridership patterns that suggests further exploration.*

**#3 Average ride length for each member type**

![image](https://github.com/DpHundal/Cyclistic-Data-Project/assets/139656045/15ff3688-b720-4cf9-b9af-5df712fd8868)


*Casual riders, while accounting for approximately one-third of annual members in terms of ride frequency, exhibit a distinct behavior: they engage in rides with an average length more than double that of annual members. This implies that, despite their lower ride frequency, casual riders tend to embark on significantly longer journeys.*

**#4 Average Ride Length by Member Type and Type of Bike**

![image](https://github.com/DpHundal/Cyclistic-Data-Project/assets/139656045/a62536f5-6e6b-42ad-8cc6-90ec8d09289d)

*Among annual members, the classic bike takes the lead as the preferred choice, used more frequently than other options. In contrast, casual riders show a balanced preference, evenly splitting their utilization between electric and classic bikes. It's noteworthy that both groups demonstrate a lesser inclination toward docked bikes, even though this category boasts the longest average ride length.*

## Act

Conclusion: Annual Members even though account for most of the rides for the months of December 2021 to March 2022, but average ride length of casual riders is much more. Casual riders go more for classic bike as compared to annual members which go for electric bike almost equally.

**Top Three Recommendations:**

1.	Find why casual riders tend to use bikes for much longer times, this can help us to put some time conditions which might be a source of profit.

2.	Collect more data to check how longer trips affect the company’s profit and promote discounts on longer trips to casual riders once they join the membership.

3.	Invest in more classic bikes as casual or likely new customers tend to go for the classic bike but at the same time take actions to promote the other bikes too, so as to increase the options and potentially increase the chances of someone becoming a member of the company. 

