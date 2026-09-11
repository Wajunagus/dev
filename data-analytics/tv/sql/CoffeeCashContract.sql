Select Top 1
	Date,
	Volume As [Volume (Market activity)]
From TV..CCC_D1
Order By Volume Desc

Select COUNT(*)
From TV..CCC_D1

--------------------------------------------------------------------------------------

-- Data

-- CCC_D1
--Insert Into TV..CCC_D1 Values
Day,Date,OpenPrice,High,Low,ClosePrice,Volume

-- CCC_W1
--Insert Into TV..CCC_W1 Values

-- CCC_MN
--Insert Into TV..CCC_MN Values

--------------------------------------------------------------------------------------

-- CCC_D1
Select
	Date,
	OpenPrice,
	High,
	Low,
	ClosePrice,
	Volume As [Volume(Market activity)],
 	(ClosePrice-OpenPrice)/0.0001 As [ClosePrice-OpenPrice],
	(High-Low)/0.0001 As [High-Low],
	Format(((ClosePrice-OpenPrice)/OpenPrice)*100,'N2')+'%' As [% Move]
From TV..CCC_D1
/*Where Date = '2025-04-14'*/
/*Where Date = '2025-01-02' Or Date = '2025-03-31'*/
Where Date Between '2025-04-25' And '2025-05-02'
/*Where (High-Low)/0.0001 > 100*/
/*Where (ClosePrice-OpenPrice)/0.0001 > 100*/
/*Where Volume > 200000*/
Order By Date

--------------------------------------------------------------------------------------

-- CCC_W1
Select
	WeekStarting,
	OpenPrice,
	High,
	Low,
	ClosePrice,
	Volume As [Volume(Market activity)],
	(ClosePrice-OpenPrice)/0.0001 As [CP-OP],
	(High-Low)/0.0001 As [H-L],
	Format(((ClosePrice-OpenPrice)/OpenPrice)*100,'N2')+'%' As [% Move (CP-OP)/OP*100]
From TV..CCC_W1
/*Where WeekStarting = '2025-04-20'*/
/*Where WeekStarting Between
	'2025-03-30' And
	'2025-04-20'*/
Order By WeekStarting

--------------------------------------------------------------------------------------

-- CCC_MN
Select
	MonthStarting,
	OpenPrice,
	High,
	Low,
	ClosePrice,
	Volume As [Volume(Market activity)],
	(ClosePrice-OpenPrice)/0.0001 As [ClosePrice-OpenPrice],
	(High-Low)/0.0001 As [Volatility(High-Low)],
	Format(((ClosePrice-OpenPrice)/OpenPrice)*100,'N2')+'%' As [% Move]
From TV..CCC_MN
Order By MonthStarting

--------------------------------------------------------------------------------------

-- TV

-- CCC_D1
/*
DROP TABLE IF EXISTS TV..CCC_D1
Create Table TV..CCC_D1 (
	Date DATE,
	OpenPrice DECIMAL(10,5),
	High DECIMAL(10,5),
	Low DECIMAL(10,5),
	ClosePrice DECIMAL(10,5),
	Volume INT
)

-- CCC_W1
DROP TABLE IF EXISTS TV..CCC_W1
CREATE TABLE TV..CCC_W1 (
    WeekStarting DATE,         -- Date of the week starting
    OpenPrice DECIMAL(10,5),   -- Opening price
    High DECIMAL(10,5),		   -- Highest price
    Low DECIMAL(10,5),		   -- Lowest price
    ClosePrice DECIMAL(10,5),  -- Closing price
    Volume BIGINT              -- Volume of trades
);

-- CCC_MN
DROP TABLE IF EXISTS TV..CCC_MN
CREATE TABLE TV..CCC_MN (
    MonthStarting DATE,
    OpenPrice DECIMAL(10,5),
    High DECIMAL(10,5),
    Low DECIMAL(10,5),
    ClosePrice DECIMAL(10,5),
    Volume BIGINT
);
*/
