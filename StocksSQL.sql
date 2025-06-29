#What is the total number of trading days recorded for each company?

select Company , count(distinct Date)as total_trading_days 
from stocks_cleaned
group by 1 ;

#What is the average closing price for each company?

select Company , avg(Close) as average_closing_price
from stocks_cleaned 
group by 1;

#What is the highest and lowest stock price (High/Low) recorded for each company in the dataset?

select Company , max(High)as highest_stock_price , min(Low)as lowest_stock_price
from stocks_cleaned 
group by 1;

#Which date had the highest trading volume for each company?

select Company , Date , Volume
from stocks_cleaned a
where Volume = (select Max(Volume) from stocks_cleaned b where a.Company = b.Company);

#What is the average daily trading volume per company?

select Company , round(avg(Volume),0)
from stocks_cleaned 
group by 1;

#List all days where a company’s stock closed higher than it opened.

select Company, Date , Open , Close 
from stocks_cleaned 
where Close>Open;