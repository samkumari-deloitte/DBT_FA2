# Documentation

### Using the starter project

Try running the following commands:
- dbt run
- dbt test

Kindly check the /models/examples folder to check SQL queries. 
## Milestone 1 

## Question 1 : Calculate Monthly average NAV, Repurchase & Sale Price for each scheme.

I've grouped the data according to month of nav_date column. Then I calculated the avergaes required in the question for each group. 

<img width="951" alt="m1_q1" src="https://user-images.githubusercontent.com/104750276/171578300-056d2c9f-690a-4b21-9936-ecb3cdecd73d.PNG">

## Question : 2.	Find out each scheme’s Max and Min NAV value and Date it occurred

I grouped data by the code column and found the max and min nav values for each group. I tried to figure out the date column, But it was creating some errors. 

<img width="956" alt="m1_q2" src="https://user-images.githubusercontent.com/104750276/171578310-ace1b4ef-84ae-4870-adda-9b8b1ae4be24.PNG">

## Milestone 2

## Question 1 : Mutual fund performance - including YTD, MTD, 1 Year and Since Inception returns

Here, We have to calculate YTD, MTD and Overall percentages. I used three different queries to find YTD, MTD and overall percentages. I grouped the data by code and year in the case of YTD. Then I calculated the maximum and minimum date for each code in every year using subqueries. After that I found out the starting and ending nav on those maximum and minimum dates and lastly, I used the formula given to us to calculate the percentage change. 

I repeated the similar steps for calculating MTD. I just grouped there by code and month. 

For calculating the overall (since inception) percentage, I grouped the whole data by code only and repeated the previous steps. 

1. YTD 
<img width="952" alt="m2_q1_ytd" src="https://user-images.githubusercontent.com/104750276/171584910-6f17a326-13b9-4785-b200-714cfaa5cc1e.PNG">

2. MTD
<img width="954" alt="m2_q2_mtd" src="https://user-images.githubusercontent.com/104750276/171585056-82140394-c88a-4ba3-b2a8-2df462b83d10.PNG">


3. Overall (Since Insception)
 <img width="950" alt="m2_q1_overall" src="https://user-images.githubusercontent.com/104750276/171585303-20afd46d-8496-432d-b08c-93fc82db2d3b.PNG">

### Questionn 2 : Plot performance of upto 3 funds for the past 3 months 

I used the same logic as in the above question. But in this question I ran the query for three codes oonly. I used snowflake charts to plot the results too. 

1. YTD
<img width="947" alt="m2_q2_ytd" src="https://user-images.githubusercontent.com/104750276/171585822-5f6af6ab-fde2-4231-be3a-dc070e36e480.PNG">

2. MTD

<img width="954" alt="m2_q2_mtd" src="https://user-images.githubusercontent.com/104750276/171585926-c6440d1a-f04d-4008-8dc0-65d6e30160e7.PNG">

3. Overall 
<img width="955" alt="m2_q2_overall" src="https://user-images.githubusercontent.com/104750276/171586036-c78e94af-f2e2-4d0b-97ef-d02a64da6797.PNG">

### Q3 : List of mutual funds which were discontinued in a given year

I created a column a last_present_year. If the last_present_year for a code is 2018. That means it is discontinued in 2019. I used group by code to find max dates for each codes. Then etracted it's year part for last_present_date. Then I joined nav_history table with mutual fuds table to extract the fund's name. At last, I used a where condition to filter 2018 data. In such way almost 157 mutual funds were discontinued in 2018. 
<img width="956" alt="m2_q3" src="https://user-images.githubusercontent.com/104750276/171586585-bdc627d2-4e2a-45a7-8f84-8fb5d0d48ab4.PNG">

### Q4 : Weekly, monthly and ytd results for all funds in liquid fund category 

I used to same logic as used in Q1. For weekly percentage I grouped by week(nav_date) and code. Then I joined the table nav_history with mutual funds and category table. At last I used a where condition to filter out only Liquid categories. 


1. Weekly

<img width="955" alt="m2_q4_weekly" src="https://user-images.githubusercontent.com/104750276/171587015-d22e894d-96e1-479f-b40e-8b91551fd909.PNG">

2. MTD
<img width="956" alt="m2_q4_mtd" src="https://user-images.githubusercontent.com/104750276/171587065-99cd7886-8d6b-4b9b-a52b-4defbadab46a.PNG">

3. YTD
<img width="956" alt="m2_q4_ytd" src="https://user-images.githubusercontent.com/104750276/171587100-0cc7909d-bc45-4aee-9adf-32cf2ae0e226.PNG">

### Question 5 : Best and worst performing fund in a given category on the basis of 1 year returns 

I used the sale_price to calculate the overall returns. I assumed that whichever mutual fund is getting the maximum sum of sale price is the best performing. And the opposite is worst performing mutual fund. According to question, I added a actegory flter using where condition that finds the best and worst funds in a particular category. In my case I used the category Liquid. So the queries will return best and worst performing funds in liquid category. 

1. Best
 <img width="959" alt="m2_q5_best" src="https://user-images.githubusercontent.com/104750276/171587799-a80d6c39-1a2d-46d2-a154-ec4392425894.PNG">

2. Worst

<img width="953" alt="m2_q5_worst" src="https://user-images.githubusercontent.com/104750276/171587856-0632e9b6-7731-4ccf-aea6-adbba02090b3.PNG">





