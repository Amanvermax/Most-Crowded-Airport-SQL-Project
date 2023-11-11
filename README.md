SQL-Project.

# Most Crowded Airports from 2016 to 2020

This SQL project analyzes passenger data for airports from 2016 to 2020 to find the most crowded airports, make various queries, and generate insights from the provided dataset. This repository contains SQL queries and related documentation for the project.

## Table of Contents

- [Introduction](#introduction)
- [Dataset](#dataset)
- [Insights](#Insights)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

Air travel is a crucial part of global transportation. This project aims to analyze passenger data to identify the most crowded airports from 2016 to 2020, providing insights into trends in air travel during this period.

## Dataset

The project uses a dataset with the following metadata:

- Ranks
- Year
- Airport
- Location
- Country
- Code
- Passengers
- Male
- Female
- Economy_class
- Business_class
- Age_above_50
- Age_below_50

## Insights

This project includes a collection of Analysis to extract useful information from the dataset. Here are some examples of finding the insights.

1. Find the country with the most passengers in the year 2018.
2. Find the top 5 airports with the highest gender diversity
(lowest ratio of male to female passengers) in the year 2017.
3. Calculate the percentage change in the number of passengers
 for each airport from 2016 to 2022.
4. Retrieve the airport with the highest number of passengers for each year.
5. The top 5 airports
 with the highest percentage of passengers above 50 in 2020.
6.Countries with the Most Passengers in 2018 Here I am finding the countries with the most passengers in 2018.
7. find out how many total passengers traveled in economy_class and business_class in 2020, we can use the following SQL query
8.Finding the top 5 countries with the most airports.
9.Query to categorize airports by country into regions.
10.Find pairs of airports in the same country by joining the "airport" table with itself (a1 and a2). Match rows where a1 and a2 have 
the same country and ensure that a1's airport is less than a2's airport to avoid duplicates or self-pairs.
11.Identifies the year(s) with the highest number of business class passengers, matching the maximum count among all years in the provided data.
12.Finding the lists airports with above-average male passengers, ranked by descending male passenger count,
 identifying airports with a higher concentration of male passengers than the average.
13. Identifies locations with the highest passenger traffic and orders them in descending order based on the total number of passengers.
   
  and many more.....

Feel free to explore and modify these queries for your specific needs.

## Getting Started

To get started with this project, make sure you have access to a SQL database where you can execute these queries. You can use database management tools like MySQL, PostgreSQL, or SQLite.

1. Clone this repository:

   ```shell
  https://github.com/Amanvermax/SQL-Project


# Navigate to the project directory
CD SQL-Project

# Run the SQL queries against your database of choice.

##Usage
You can use the insights and analysis findings from this project for various purposes, such as understanding Amazon's sales strategies, identifying top-performing products, and exploring customer sentiments.


##Contributing
Contributions to this project are encouraged. If you have additional analyses, new insights, or suggestions, please feel free to open an issue or create a pull request.

##License
This project is licensed under the MIT License.
