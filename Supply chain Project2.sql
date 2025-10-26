CREATE DATABASE SupplyChainFinanceManagement;
Create Table dim_Customer(customer_code int,customer varchar(150),platform varchar(45),channel varchar(45),market varchar(45),sub_zone varchar(45),region varchar (45))
Create Table fact_sales_monthly(date date, product_code varchar(45),customer_code int,sold_quantity int,dim_customer_customer_code int,fact_post_invoice_deduction int,fact_post_invoice_deduction_product_code varchar(45),fact_post_invoice_deduction _data data,fact_pre_invoice_decduction_customer_code int,fact_per_invoice_deduction_fiscal_year Year)
Create Table fact_post_invoice_deductions(customer_code int,product_code varchar(45),date date,discounts_pctdecimal(5,4),other_deductions_pctdecimal(5,4))
Create Table dim_product(product_code varchar(45),division varchar(45),segment varchar(45),category varchar(45),product varchar(200), variant varchar(45))
Create Table fact_forcast_monthly(date date, fiscal_year Year,product_code varchar(45),customer_code int,forcast_quantity int,dim_customer_customer_code int,dim_product_product_code varchar(45))
Create Table fact_pre_invoice_deductions(customer_code int,fiscal_year Year,per_invoice_discount_pct_decimal(5,4))
Create Table fact_manufacturing_cost(product_code varchar(45),cost_year year,manufacturing_cost decimal(15,4),dim_product_product_code varchar(max))
Create Table fact_freight_cost(market varchar(45),fiscal_year year,freight_pct_decimal(5,4),other_cost_pctdecimal(5,4))
Create Table fact_gross_price(product_code varchar (45),fiscal_year Year,gross price decimal(15,4),dim_product_code varchar(45))
INSERT INTO dim_customer(customer_code ,customer ,platform ,channel ,market ,sub_zone ,region )

   ('70020104', 'Atliq e Store', 'E-Commerce', 'Direct', 'Austria', 'NE', 'EU'),
    ('70021096', 'Atliq e Store', 'E-Commerce', 'Direct', 'United Kingd...', 'NE', 'EU'),
    ('70022084', 'Atliq Exclusive', 'Brick & Mortar', 'Direct', 'USA', 'NA', 'NA'),
    ('70022085', 'Atliq e Store', 'E-Commerce', 'Direct', 'USA', 'NA', 'NA'),
    ('70023031', 'Atliq Exclusive', 'Brick & Mortar', 'Direct', 'Canada', 'NA', 'NA'),
    ('70023032', 'Atliq e Store', 'E-Commerce', 'Direct', 'Canada', 'NA', 'NA'),
    ('70026206', 'Atliq e Store', 'E-Commerce', 'Direct', 'Mexico', 'LATAM', 'LATAM'),
    ('70027208', 'Atliq e Store', 'E-Commerce', 'Direct', 'Brazil', 'LATAM', 'LATAM'),
    ('80001019', 'Neptune', 'Brick & Mortar', 'Distributor', 'China', 'ROA', 'APAC'),
    ('80006154', 'Synthetic', 'Brick & Mortar', 'Distributor', 'Philiphines', 'ROA', 'APAC'),
    ('80006155', 'Novus', 'Brick & Mortar', 'Distributor', 'Philiphines', 'ROA', 'APAC');
Insert into fact_sales_monthly(date , product_code ,customer_code ,sold_quantity ,dim_customer_customer_code ,fact_post_invoice_deduction ,fact_post_invoice_deduction_product_code ,fact_post_invoice_deduction _data ,fact_pre_invoice_decduction_customer_code ,fact_per_invoice_deduction_fiscal_year)
    ('2017-09-01', 'A0118150101', '70002017', 51),
    ('2017-09-01', 'A0118150101', '70002018', 77),
    ('2017-09-01', 'A0118150101', '70003181', 17),
    ('2017-09-01', 'A0118150101', '70003182', 6),
    ('2017-09-01', 'A0118150101', '70006157', 5),
    ('2017-09-01', 'A0118150101', '70006158', 7),
    ('2017-09-01', 'A0118150101', '70007198', 29),
    ('2017-09-01', 'A0118150101', '70007199', 34),
    ('2017-09-01', 'A0118150101', '70008169', 22),
    ('2017-09-01', 'A0118150101', '70008170', 5),
    ('2017-09-01', 'A0118150101', '70011193', 10);
	Insert into fact_freight_cost(market ,fiscal_year ,freight_pct_decimal,other_cost_pctdecimal)
	('Germany', 2020, 0.0226, 0.0060),
    ('Germany', 2021, 0.0226, 0.0060),
    ('Germany', 2022, 0.0226, 0.0060),
    ('India', 2018, 0.0244, 0.0026),
    ('India', 2019, 0.0219, 0.0057),
    ('India', 2020, 0.0309, 0.0029),
    ('India', 2021, 0.0309, 0.0029),
    ('India', 2022, 0.0309, 0.0029),
    ('Indonesia', 2018, 0.0190, 0.0042),
    ('Indonesia', 2019, 0.0187, 0.0052),
    ('Indonesia', 2020, 0.0195, 0.0023);
insert into fact_forcast_monthly(date , fiscal_year ,product_code ,customer_code ,forcast_quantity ,dim_customer_customer_code ,dim_product_product_code )
    ('2017-09-01', 2018, 'A0118150101', '70002017', 18),
    ('2017-09-01', 2018, 'A0118150101', '70002018', 11),
    ('2017-09-01', 2018, 'A0118150101', '70003181', 9),
    ('2017-09-01', 2018, 'A0118150101', '70003182', 6),
    ('2017-09-01', 2018, 'A0118150101', '70006157', 5),
    ('2017-09-01', 2018, 'A0118150101', '70006158', 6),
    ('2017-09-01', 2018, 'A0118150101', '70007198', 4),
    ('2017-09-01', 2018, 'A0118150101', '70007199', 7),
    ('2017-09-01', 2018, 'A0118150101', '70008169', 7),
    ('2017-09-01', 2018, 'A0118150101', '70008170', 8),
    ('2017-09-01', 2018, 'A0118150101', '70011193', 5);
Insert into fact_gross_price(product_code ,fiscal_year ,gross price ,dim_product_code )
    ('A0118150101', 2018, 15.3952),
    ('A0118150101', 2019, 14.4392),
    ('A0118150101', 2020, 16.2323),
    ('A0118150101', 2021, 19.0573),
    ('A0118150102', 2018, 19.5875),
    ('A0118150102', 2019, 18.5595),
    ('A0118150102', 2020, 19.8577),
    ('A0118150102', 2021, 21.4565),
    ('A0118150103', 2018, 19.3630),
    ('A0118150103', 2019, 19.3442),
    ('A0118150103', 2020, 22.1317);
	Insert into fact_manufacturing_cost(product_code ,cost_year ,manufacturing_cost ,dim_product_product_code )
	    ('A0118150101', 2018, 4.6190),
    ('A0118150101', 2019, 4.2033),
    ('A0118150101', 2020, 5.0207),
    ('A0118150101', 2021, 5.5172),
    ('A0118150102', 2018, 5.6036),
    ('A0118150102', 2019, 5.3235),
    ('A0118150102', 2020, 5.7180),
    ('A0118150102', 2021, 6.2835),
    ('A0118150103', 2018, 5.9469),
    ('A0118150103', 2019, 5.5306),
    ('A0118150103', 2020, 6.3264);
	Insert into  fact_post_invoice_deductions(customer_code ,product_code ,date ,discounts_pctdecimal,other_deductions_pctdecimal)
	    ('70002017', 'A0118150101', '2017-09-01', 0.2660, 0.0719),
    ('70002017', 'A0118150101', '2017-10-01', 0.3090, 0.0976),
    ('70002017', 'A0118150101', '2017-11-01', 0.3313, 0.0752),
    ('70002017', 'A0118150101', '2018-01-01', 0.2958, 0.0720),
    ('70002017', 'A0118150101', '2018-02-01', 0.3208, 0.0793),
    ('70002017', 'A0118150101', '2018-03-01', 0.2635, 0.1007),
    ('70002017', 'A0118150101', '2018-05-01', 0.2231, 0.0820),
    ('70002017', 'A0118150101', '2018-06-01', 0.3020, 0.0791),
    ('70002017', 'A0118150101', '2018-07-01', 0.3123, 0.0929),
    ('70002017', 'A0118150101', '2018-09-01', 0.1530, 0.1288),
    ('70002017', 'A0118150101', '2018-10-01', 0.1363, 0.1542);
Insert into dim_product(product_code ,division ,segment ,category ,product , variant )
('A1919150403', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito', 'Plus 2'),
    ('A1920150404', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito', 'Premium'),
    ('A2020150501', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Standard'),
    ('A2020150502', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Plus 1'),
    ('A2021150503', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Plus 2'),
    ('A2021150504', 'P & A', 'Peripherals', 'MotherBoard', 'AQ MB Lito 2', 'Premium'),
    ('A2118150101', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Standard 1'),
    ('A2118150102', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Standard 2'),
    ('A2118150103', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Plus 1'),
    ('A2118150104', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Plus 2'),
    ('A2118150105', 'P & A', 'Accessories', 'Mouse', 'AQ Master wired x1 Ms', 'Premium 1');
Insert into fact_pre_invoice_deductions(customer_code ,fiscal_year ,per_invoice_discount_pct_decimal)
   ('70002017', 2018, 0.0824),
    ('70002017', 2019, 0.0777),
    ('70002017', 2020, 0.0735),
    ('70002017', 2021, 0.0703),
    ('70002017', 2022, 0.1057),
    ('70002018', 2018, 0.2956),
    ('70002018', 2019, 0.2577),
    ('70002018', 2020, 0.2255),
    ('70002018', 2021, 0.2061),
    ('70002018', 2022, 0.2931),
    ('70003181', 2018, 0.0536);
	CREATE FUNCTION get_fiscal_year (calendar_date DATE)
RETURNS INT
AS
BEGIN
  DECLARE @fiscal_year INT;
  IF (MONTH(calendar_date) <= 3)
    SET @fiscal_year = YEAR(calendar_date);
  ELSE
    SET @fiscal_year = YEAR(calendar_date) + 1;
  RETURN @fiscal_year;
END;

SELECT get_fiscal_year('2023-07-15') AS fiscal_year;  
SELECT
    fsm.date,
    fsm.product_code,
    dp.product,
    dp.variant,
    fsm.sold_quantity,
    fgp.gross_price,
    (fsm.sold_quantity * fgp.gross_price) AS gross_price_total
FROM
    fact_sales_monthly fsm
JOIN
    dim_product dp ON fsm.product_code = dp.product_code
JOIN
    fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
WHERE
    fsm.customer_code = '70002017' 
    AND YEAR(fsm.date) = 2018; 
	SELECT
    product_code,
    DATE_FORMAT(date, '%Y-%m') AS sale_month,
    SUM(sold_quantity) AS total_sales
FROM
    fact_sales_monthly
GROUP BY
    product_code,
    sale_month
ORDER BY
    product_code,
    sale_month; 

	SELECT
    dc.channel AS customer_segment,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_sales_revenue
FROM
    dim_customer dc
JOIN
    fact_sales_monthly fsm ON dc.customer_code = fsm.customer_code
JOIN
    fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
GROUP BY
    dc.channel
ORDER BY
    total_sales_revenue DESC;

	SELECT
    fsm.product_code,
    dp.product,
    SUM(fsm.sold_quantity) AS total_sales_quantity,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_sales_revenue
FROM
    fact_sales_monthly fsm
JOIN
    dim_product dp ON fsm.product_code = dp.product_code
JOIN
    fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
GROUP BY
    fsm.product_code, dp.product
ORDER BY
    total_sales_revenue DESC;

	WITH YearlyForecast AS (
    SELECT
        dc.market,
        ffm.fiscal_year,
        SUM(ffm.forecast_quantity) AS total_forecast
    FROM
        fact_forecast_monthly ffm
    JOIN
        dim_customer dc ON ffm.customer_code = dc.customer_code
    GROUP BY
        dc.market,
        ffm.fiscal_year
),
YearlyGrowth AS (
    SELECT
        market,
        fiscal_year,
        total_forecast,
        LAG(total_forecast, 1, 0) OVER (PARTITION BY market ORDER BY fiscal_year) AS previous_year_forecast
    FROM
        YearlyForecast
)
SELECT
    market,
    fiscal_year,
    total_forecast,
    (total_forecast - previous_year_forecast) AS forecast_growth
FROM
    YearlyGrowth
ORDER BY
    forecast_growth DESC;

	SELECT
    dp.product_code,
    dp.product,
    fgp.fiscal_year,
    fgp.gross_price,
    fmc.manufacturing_cost,
    (fgp.gross_price - fmc.manufacturing_cost) AS profit_margin
FROM
    dim_product dp
JOIN
    fact_gross_price fgp ON dp.product_code = fgp.product_code
JOIN
    fact_manufacturing_cost fmc ON dp.product_code = fmc.product_code AND fgp.fiscal_year = fmc.cost_year
ORDER BY
    profit_margin DESC;
	SELECT
    fpid.customer_code,
    dc.customer,
    fpid.fiscal_year,
    AVG(fpid.pre_invoice_discount_pct) AS average_discount_percentage,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_sales_revenue
FROM
    fact_pre_invoice_deductions fpid
JOIN
    dim_customer dc ON fpid.customer_code = dc.customer_code
JOIN
    fact_sales_monthly fsm ON fpid.customer_code = fsm.customer_code AND fpid.fiscal_year = YEAR(fsm.date)
JOIN
    fact_gross_price fgp ON fsm.product_code = fgp.product_code AND fpid.fiscal_year = fgp.fiscal_year
GROUP BY
    fpid.customer_code, dc.customer, fpid.fiscal_year
ORDER BY
    average_discount_percentage DESC;

	SELECT
    market,
    fiscal_year,
    AVG(freight_pct) AS average_freight_cost
FROM
    fact_freight_cost
GROUP BY
    market,
    fiscal_year
ORDER BY
    market,
    fiscal_year;

	SELECT
    DATE_FORMAT(date, '%m') AS month,
    SUM(sold_quantity) AS total_sales
FROM
    fact_sales_monthly
GROUP BY
    month
ORDER BY
    month;

	WITH CustomerPurchaseCounts AS (
    SELECT
        customer_code,
        fiscal_year,
        COUNT(DISTINCT DATE_FORMAT(date, '%Y-%m')) AS monthly_purchase_count,
        COUNT(DISTINCT date) AS total_purchase_days
    FROM
        fact_sales_monthly
    GROUP BY
        customer_code,
        fiscal_year
),
CustomerRetention AS (
    SELECT
        customer_code,
        COUNT(DISTINCT fiscal_year) AS years_purchased,
        MIN(fiscal_year) AS first_purchase_year,
        MAX(fiscal_year) AS last_purchase_year
    FROM
        fact_sales_monthly
    GROUP BY
        customer_code
)
SELECT
    cpc.customer_code,
    dc.customer,
    cr.years_purchased,
    cr.first_purchase_year,
    cr.last_purchase_year,
    AVG(cpc.monthly_purchase_count) AS avg_monthly_purchase_count,
    AVG(cpc.total_purchase_days) AS avg_total_purchase_days
FROM
    CustomerPurchaseCounts cpc
JOIN
    CustomerRetention cr ON cpc.customer_code = cr.customer_code
JOIN
    dim_customer dc ON cpc.customer_code = dc.customer_code
GROUP BY
    cpc.customer_code, dc.customer, cr.years_purchased, cr.first_purchase_year, cr.last_purchase_year
ORDER BY
    cr.years_purchased DESC, AVG(cpc.monthly_purchase_count) DESC;

	SELECT
    ffm.fiscal_year,
    ffm.customer_code,
    SUM(ffm.forecast_quantity) AS total_forecasted_quantity,
    SUM(fsm.sold_quantity) AS total_actual_sales,
    (SUM(fsm.sold_quantity) - SUM(ffm.forecast_quantity)) AS forecast_discrepancy,
    ((SUM(fsm.sold_quantity) - SUM(ffm.forecast_quantity)) / SUM(ffm.forecast_quantity)) * 100 AS percentage_discrepancy
FROM
    fact_forecast_monthly ffm
JOIN
    fact_sales_monthly fsm ON ffm.customer_code = fsm.customer_code AND ffm.fiscal_year = YEAR(fsm.date)
GROUP BY
    ffm.fiscal_year, ffm.customer_code
ORDER BY
    ffm.fiscal_year, ffm.customer_code;

	SELECT
    dc.channel,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_sales_revenue,
    SUM(fsm.sold_quantity) AS total_sales_quantity
FROM
    fact_sales_monthly fsm
JOIN
    dim_customer dc ON fsm.customer_code = dc.customer_code
JOIN
    fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
GROUP BY
    dc.channel
ORDER BY
    total_sales_revenue DESC;

SELECT
    dc.region,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_sales_revenue,
    SUM(fsm.sold_quantity) AS total_sales_quantity
FROM
    fact_sales_monthly fsm
JOIN
    dim_customer dc ON fsm.customer_code = dc.customer_code
JOIN
    fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
GROUP BY
    dc.region
ORDER BY
    total_sales_revenue DESC;


WITH AcquiredCustomers AS (
    SELECT
        dc.market,
        dc.channel,
        YEAR(fsm.date) AS fiscal_year,
        COUNT(DISTINCT fsm.customer_code) AS unique_customers
    FROM
        fact_sales_monthly fsm
    JOIN
        dim_customer dc ON fsm.customer_code = dc.customer_code
    GROUP BY
        dc.market, dc.channel, YEAR(fsm.date)
)
SELECT
    ac.market,
    ac.channel,
    ac.fiscal_year,
    ms.spend,
    ac.unique_customers,
    (ms.spend / ac.unique_customers) AS CAC -- Customer Acquisition Cost
FROM
    AcquiredCustomers ac
JOIN
    marketing_spend ms ON ac.market = ms.market AND ac.channel = ms.channel AND ac.fiscal_year = ms.fiscal_year
ORDER BY
    CAC ASC;


SELECT
    fsm.product_code,
    dp.product,
    SUM(fsm.sold_quantity) AS total_sales_quantity,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_sales_revenue,
    AVG(fgp.gross_price - fmc.manufacturing_cost) AS average_profit_margin -- Assuming fact_manufacturing_cost exists
FROM
    fact_sales_monthly fsm
JOIN
    dim_product dp ON fsm.product_code = dp.product_code
JOIN
    fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
LEFT JOIN
    fact_manufacturing_cost fmc ON fsm.product_code = fmc.product_code AND YEAR(fsm.date) = fmc.cost_year
GROUP BY
    fsm.product_code, dp.product
ORDER BY
    total_sales_revenue DESC, average_profit_margin DESC;


WITH CustomerValue AS (
    SELECT
        fsm.customer_code,
        YEAR(fsm.date) AS fiscal_year,
        SUM(fsm.sold_quantity * fgp.gross_price) AS annual_revenue
    FROM
        fact_sales_monthly fsm
    JOIN
        fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
    GROUP BY
        fsm.customer_code, YEAR(fsm.date)
),
CustomerLifetimeRevenue AS (
    SELECT
        customer_code,
        SUM(annual_revenue) AS total_revenue
    FROM
        CustomerValue
    GROUP BY
        customer_code
)
SELECT
    dc.customer,
    clr.total_revenue AS CLV
FROM
    CustomerLifetimeRevenue clr
JOIN
    dim_customer dc ON clr.customer_code = dc.customer_code
ORDER BY
    CLV DESC;

	
SELECT
    i.product_code,
    dp.product,
    i.fiscal_year,
    (i.beginning_inventory + i.ending_inventory) / 2 AS average_inventory,
    i.cost_of_goods_sold / ((i.beginning_inventory + i.ending_inventory) / 2) AS inventory_turnover_rate
FROM
    inventory i
JOIN
    dim_product dp ON i.product_code = dp.product_code
ORDER BY
    inventory_turnover_rate ASC; 
WITH CompanySales AS (
    SELECT
        dc.market,
        fsm.product_code,
        YEAR(fsm.date) AS fiscal_year,
        SUM(fsm.sold_quantity * fgp.gross_price) AS sales_revenue
    FROM
        fact_sales_monthly fsm
    JOIN
        dim_customer dc ON fsm.customer_code = dc.customer_code
    JOIN
        fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
    GROUP BY
        dc.market, fsm.product_code, YEAR(fsm.date)
),
MarketSales AS (
    SELECT
        market,
        product_code,
        fiscal_year,
        SUM(sales_revenue) AS total_market_sales
    FROM (
        SELECT market, product_code, fiscal_year, sales_revenue FROM CompanySales
        UNION ALL
        SELECT market, product_code, fiscal_year, sales_revenue FROM competitor_sales
    ) AS all_sales
    GROUP BY market, product_code, fiscal_year
)
SELECT
    cs.market,
    cs.product_code,
    cs.fiscal_year,
    cs.sales_revenue AS company_sales,
    ms.total_market_sales,
    (cs.sales_revenue / ms.total_market_sales) * 100 AS market_share
FROM
    CompanySales cs
JOIN
    MarketSales ms ON cs.market = ms.market AND cs.product_code = ms.product_code AND cs.fiscal_year = ms.fiscal_year
ORDER BY
    market_share DESC;


SELECT
    fsm.product_code,
    dp.product,
    YEAR(fsm.date) AS fiscal_year,
    AVG(fgp.gross_price) AS average_price,
    SUM(fsm.sold_quantity) AS total_sales_quantity
FROM
    fact_sales_monthly fsm
JOIN
    dim_product dp ON fsm.product_code = dp.product_code
JOIN
    fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
GROUP BY
    fsm.product_code, dp.product, YEAR(fsm.date)
ORDER BY
    fsm.product_code, YEAR(fsm.date);


SELECT
    cf.fiscal_year,
    AVG(cf.satisfaction_score) AS average_satisfaction,
    SUM(fsm.sold_quantity * fgp.gross_price) AS total_sales_revenue
FROM
    customer_feedback cf
JOIN
    fact_sales_monthly fsm ON cf.customer_code = fsm.customer_code AND cf.fiscal_year = YEAR(fsm.date)
JOIN
    fact_gross_price fgp ON fsm.product_code = fgp.product_code AND cf.fiscal_year = fgp.fiscal_year
GROUP BY
    cf.fiscal_year
ORDER BY
    cf.fiscal_year;

WITH CampaignSalesRevenue AS (
    SELECT
        mc.campaign_id,
        mc.campaign_name,
        mc.fiscal_year,
        mc.market,
        mc.channel,
        mc.spend,
        SUM(cs.sold_quantity * fgp.gross_price) AS sales_revenue
    FROM
        marketing_campaigns mc
    JOIN
        campaign_sales cs ON mc.campaign_id = cs.campaign_id
    JOIN
        fact_sales_monthly fsm ON cs.customer_code = fsm.customer_code AND cs.date = fsm.date
    JOIN
        fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
    GROUP BY
        mc.campaign_id, mc.campaign_name, mc.fiscal_year, mc.market, mc.channel, mc.spend
)
SELECT
    campaign_id,
    campaign_name,
    fiscal_year,
    market,
    channel,
    spend,
    sales_revenue,
    (sales_revenue - spend) AS profit,
    ((sales_revenue - spend) / spend) * 100 AS ROI
FROM
    CampaignSalesRevenue
ORDER BY
    ROI DESC;

	CREATE FUNCTION CalculateTotalForecastedQuantity (
    @productCode VARCHAR(20),
    @fiscalYear INT
)
RETURNS INT
AS
BEGIN
    DECLARE @totalForecastedQuantity INT;

    SELECT @totalForecastedQuantity = SUM(forecast_quantity)
    FROM fact_forecast_monthly
    WHERE product_code = @productCode AND fiscal_year = @fiscalYear;

    RETURN ISNULL(@totalForecastedQuantity, 0); 
	WITH AvgMonthlySales AS (
    SELECT AVG(sold_quantity) AS avg_sales
    FROM fact_sales_monthly
),
CustomerMonthlySales AS (
    SELECT customer_code, DATE_FORMAT(date, '%Y-%m') AS sale_month, SUM(sold_quantity) AS monthly_sales
    FROM fact_sales_monthly
    GROUP BY customer_code, sale_month
)
SELECT DISTINCT cms.customer_code
FROM CustomerMonthlySales cms, AvgMonthlySales ams
WHERE cms.monthly_sales > ams.avg_sales;

CREATE PROCEDURE UpdateGrossPrice (
    @productCode VARCHAR(20),
    @fiscalYear INT,
    @newGrossPrice DECIMAL(10, 4)
)
AS
BEGIN
    UPDATE fact_gross_price
    SET gross_price = @newGrossPrice
    WHERE product_code = @productCode AND fiscal_year = @fiscalYear;
END;

CREATE TABLE SalesAuditLog (
    AuditID INT IDENTITY(1, 1) PRIMARY KEY,
    SaleID INT,
    AuditDate DATETIME,
    AuditAction VARCHAR(50)
);

CREATE TRIGGER SalesInsertAudit
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    INSERT INTO SalesAuditLog (SaleID, AuditDate, AuditAction)
    SELECT inserted.InvoiceID, GETDATE(), 'INSERT'
    FROM inserted;
END;

SELECT
    product_code,
    DATE_FORMAT(date, '%Y-%m') AS sale_month,
    sold_quantity,
    RANK() OVER (PARTITION BY fiscal_year ORDER BY sold_quantity DESC) AS sales_rank
FROM
    fact_sales_monthly;

	SELECT STRING_AGG(dc.customer, ', ')
FROM fact_sales_monthly fsm
JOIN dim_customer dc ON fsm.customer_code = dc.customer_code
WHERE fsm.product_code = 'A0118150101' AND fsm.date BETWEEN '2018-01-01' AND '2019-12-31';

CREATE FUNCTION CalculateTotalManufacturingCost (
    @productCode VARCHAR(20),
    @startYear INT,
    @endYear INT
)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @totalCost DECIMAL(18, 2);

    SELECT @totalCost = SUM(manufacturing_cost)
    FROM fact_manufacturing_cost
    WHERE product_code = @productCode AND cost_year BETWEEN @startYear AND @endYear;

    RETURN ISNULL(@totalCost, 0);
END;

CREATE PROCEDURE InsertSale (
    @customerCode VARCHAR(20),
    @productCode VARCHAR(20),
    @date DATE,
    @soldQuantity INT
)
AS
BEGIN
    -- Insert into sales table
    INSERT INTO fact_sales_monthly (customer_code, product_code, date, sold_quantity)
    VALUES (@customerCode, @productCode, @date, @soldQuantity);
END;

-- Assume you have an Inventory table with 'product_code' and 'stock'
CREATE TRIGGER CheckInventory
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        JOIN Inventory inv ON i.product_code = inv.product_code
        WHERE i.sold_quantity > inv.stock
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50001, 'Insufficient inventory.', 1;
    END;
    -- Update inventory here
    UPDATE Inventory SET stock = stock - inserted.sold_quantity
    FROM inserted WHERE Inventory.product_code = inserted.product_code;
END;

SELECT
    product_code,
    DATE_FORMAT(date, '%Y-%m') AS sale_month,
    sold_quantity,
    LAG(sold_quantity, 1, 0) OVER (PARTITION BY product_code ORDER BY DATE_FORMAT(date, '%Y-%m')) AS previous_month_sales
FROM
    fact_sales_monthly;

	WITH RankedSales AS (
    SELECT
        dc.market,
        fsm.product_code,
        SUM(fsm.sold_quantity) AS total_sales,
        RANK() OVER (PARTITION BY dc.market ORDER BY SUM(fsm.sold_quantity) DESC) AS sales_rank
    FROM
        fact_sales_monthly fsm
    JOIN
        dim_customer dc ON fsm.customer_code = dc.customer_code
    GROUP BY
        dc.market, fsm.product_code
)
SELECT
    market,
    product_code,
    total_sales
FROM
    RankedSales
WHERE
    sales_rank = 1;

	CREATE FUNCTION CalculateFreightCost (
    @productCode VARCHAR(20),
    @market VARCHAR(50),
    @fiscalYear INT
)
RETURNS DECIMAL(10, 4)
AS
BEGIN
    DECLARE @freightCost DECIMAL(10, 4);

    SELECT @freightCost = freight_pct
    FROM fact_freight_cost ffc
    JOIN dim_customer dc ON ffc.market = dc.market
    WHERE ffc.fiscal_year = @fiscalYear AND dc.market = @market;

    RETURN ISNULL(@freightCost, 0);
END;

CREATE PROCEDURE UpdateOverallCost (
    @productCode VARCHAR(20),
    @market VARCHAR(50),
    @fiscalYear INT
)
AS
BEGIN
    DECLARE @freight DECIMAL(10, 4);
    SET @freight = dbo.CalculateFreightCost(@productCode, @market, @fiscalYear);
    -- Update your table with the freight data here
    -- UPDATE ProductCosts SET FreightCost = @freight
    -- WHERE product_code = @productCode AND market = @market AND fiscal_year = @fiscalYear;
END;

CREATE TRIGGER UpdateInventory
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    UPDATE Inventory
    SET stock = stock - i.sold_quantity
    FROM Inventory inv
    JOIN inserted i ON inv.product_code = i.product_code;
END;

CREATE TRIGGER CheckProductExists
ON fact_sales_monthly
BEFORE INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS (SELECT 1 FROM dim_product dp WHERE dp.product_code = i.product_code)
    )
    BEGIN
        ROLLBACK TRANSACTION;
        THROW 50002, 'Product does not exist.', 1;
    END;
END;

CREATE PROCEDURE GenerateMonthOverMonthGrowthReport
AS
BEGIN
    WITH MonthlySales AS (
        SELECT
            product_code,
            DATE_FORMAT(date, '%Y-%m') AS sale_month,
            SUM(sold_quantity) AS total_sales
        FROM
            fact_sales_monthly
        GROUP BY
            product_code, DATE_FORMAT(date, '%Y-%m')
    ),
    GrowthRates AS (
        SELECT
            product_code,
            sale_month,
            total_sales,
            LAG(total_sales, 1, 0) OVER (PARTITION BY product_code ORDER BY sale_month) AS previous_month

			CREATE FUNCTION CalculateAverageDiscountPercentage (
    @productCode VARCHAR(20)
)
RETURNS DECIMAL(6, 4)
AS
BEGIN
    DECLARE @avgDiscount DECIMAL(6, 4);

    SELECT @avgDiscount = AVG(fpid.pre_invoice_discount_pct)
    FROM fact_pre_invoice_deductions fpid
    JOIN fact_sales_monthly fsm ON fpid.customer_code = fsm.customer_code AND fpid.fiscal_year = YEAR(fsm.date)
    WHERE fsm.product_code = @productCode;

    RETURN ISNULL(@avgDiscount, 0); -- Return 0 if no data found
END;
WITH CustomerRegionSales AS (
    SELECT
        dc.region,
        fsm.customer_code,
        SUM(fsm.sold_quantity * fgp.gross_price) AS total_purchases,
        RANK() OVER (PARTITION BY dc.region ORDER BY SUM(fsm.sold_quantity * fgp.gross_price) DESC) AS purchase_rank
    FROM
        fact_sales_monthly fsm
    JOIN
        dim_customer dc ON fsm.customer_code = dc.customer_code
    JOIN
        fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
    GROUP BY
        dc.region, fsm.customer_code
)
SELECT
    region,
    customer_code,
    total_purchases
FROM
    CustomerRegionSales
WHERE
    purchase_rank = 1;

	CREATE PROCEDURE CalculateTotalRevenue (
    @startDate DATE,
    @endDate DATE
)
AS
BEGIN
    SELECT
        SUM(fsm.sold_quantity * fgp.gross_price) AS total_revenue
    FROM
        fact_sales_monthly fsm
    JOIN
        fact_gross_price fgp ON fsm.product_code = fgp.product_code AND YEAR(fsm.date) = fgp.fiscal_year
    WHERE
        fsm.date BETWEEN @startDate AND @endDate;
END;

CREATE TRIGGER UpdateForecastOnNewProduct
ON dim_product
AFTER INSERT
AS
BEGIN
    INSERT INTO fact_forecast_monthly (product_code, fiscal_year, forecast_quantity)
    SELECT i.product_code, YEAR(GETDATE()), dbo.CalculateTotalForecastedQuantity(i.product_code, YEAR(GETDATE()))
    FROM inserted i;
END;

CREATE TRIGGER FlagSalesOutliers
ON fact_sales_monthly
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    WITH MonthlySales AS (
        SELECT
            DATE_FORMAT(date, '%Y-%m') AS sale_month,
            product_code,
            SUM(sold_quantity) AS monthly_sales
        FROM
            fact_sales_monthly
        GROUP BY
            DATE_FORMAT(date, '%Y-%m'), product_code
    ),
    SalesStats AS (
        SELECT
            sale_month,
            product_code,
            monthly_sales,
            AVG(monthly_sales) OVER (PARTITION BY product_code) AS avg_sales,
            STDEV(monthly_sales) OVER (PARTITION BY product_code) AS std_sales
        FROM
            MonthlySales
    )
    -- Insert into a table to flag outliers, or update a flag column
    -- Example: INSERT INTO SalesOutliers (sale_month, product_code, monthly_sales)
    SELECT
        sale_month,
        product_code,
        monthly_sales
    FROM
        SalesStats
    WHERE
        monthly_sales > (avg_sales + 3 * std_sales) OR monthly_sales < (avg_sales - 3 * std_sales);
END;

WITH ProductAvgPrice AS (
    SELECT
        product_code,
        AVG(gross_price) AS average_gross_price,
        RANK() OVER (ORDER BY AVG(gross_price) DESC) AS price_rank
    FROM
        fact_gross_price
    GROUP BY
        product_code
)
SELECT
    product_code,
    average_gross_price
FROM
    ProductAvgPrice
WHERE
    price_rank = 1;


	-- 1. Calculate Forecast Accuracy for a Given Product over Fiscal Years
WITH ForecastVsActual AS (
    SELECT
        ffm.fiscal_year,
        ffm.product_code,
        SUM(ffm.forecast_quantity) AS total_forecasted_quantity,
        SUM(fsm.sold_quantity) AS total_actual_sales
    FROM
        fact_forecast_monthly ffm
    JOIN
        fact_sales_monthly fsm ON ffm.product_code = fsm.product_code AND ffm.fiscal_year = YEAR(fsm.date)
    WHERE ffm.product_code = 'YourProductID' -- Replace 'YourProductID'
    GROUP BY
        ffm.fiscal_year, ffm.product_code
)
SELECT
    fiscal_year,
    product_code,
    total_forecasted_quantity,
    total_actual_sales,
    CASE
        WHEN total_forecasted_quantity = 0 THEN NULL -- Avoid division by zero
        ELSE (total_actual_sales * 1.0 / total_forecasted_quantity) * 100
    END AS forecast_accuracy_percentage
FROM
    ForecastVsActual
ORDER BY
    fiscal_year;

-- 2. Pivot Table Functionality (Monthly Forecast vs. Actual)
-- Note: Pivot functionality varies between SQL dialects. This example is for SQL Server.
-- If using other databases, you may need to adjust the syntax.

WITH MonthlyData AS (
    SELECT
        YEAR(fsm.date) AS fiscal_year,
        MONTH(fsm.date) AS sale_month,
        SUM(fsm.sold_quantity) AS actual_sales,
        (SELECT SUM(ffm.forecast_quantity) FROM fact_forecast_monthly ffm WHERE ffm.product_code = 'YourProductID' AND ffm.fiscal_year = YEAR(fsm.date) AND MONTH(fsm.date) = MONTH(ffm.date)) as forecast_quantity
    FROM fact_sales_monthly fsm
    WHERE fsm.product_code = 'YourProductID'
    GROUP BY YEAR(fsm.date), MONTH(fsm.date)
),
PivotData AS (
    SELECT
        fiscal_year,
        [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]
    FROM (
        SELECT fiscal_year, sale_month, actual_sales, forecast_quantity FROM MonthlyData
    ) AS SourceTable
    PIVOT (
        SUM(actual_sales)
        FOR sale_month IN ([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12])
    ) AS PivotTable
)
SELECT
    pd.fiscal_year,
    pd.[1] AS actual_Jan, md.[1] as forecast_Jan,
    pd.[2] AS actual_Feb, md.[2] as forecast_Feb,
    pd.[3] AS actual_Mar, md.[3] as forecast_Mar,
    pd.[4] AS actual_Apr, md.[4] as forecast_Apr,
    pd.[5] AS actual_May, md.[5] as forecast_May,
    pd.[6] AS actual_Jun, md.[6] as forecast_Jun,
    pd.[7] AS actual_Jul, md.[7] as forecast_Jul,
    pd.[8] AS actual_Aug, md.[8] as forecast_Aug,
    pd.[9] AS actual_Sep, md.[9] as forecast_Sep,
    pd.[10] AS actual_Oct, md.[10] as forecast_Oct,
    pd.[11] AS actual_Nov, md.[11] as forecast_Nov,
    pd.[12] AS actual_Dec, md.[12] as forecast_Dec
FROM PivotData pd
JOIN MonthlyData md on pd.fiscal_year = md.fiscal_year;

-- 3. Calculate Forecast Accuracy (Monthly)
WITH MonthlyForecastAccuracy AS (
    SELECT
        YEAR(fsm.date) AS fiscal_year,
        MONTH(fsm.date) AS sale_month,
        SUM(fsm.sold_quantity) AS actual_sales,
        (SELECT SUM(ffm.forecast_quantity) FROM fact_forecast_monthly ffm WHERE ffm.product_code = 'YourProductID' AND ffm.fiscal_year = YEAR(fsm.date) AND MONTH(fsm.date) = MONTH(fsm.date)) as forecast_quantity
    FROM fact_sales_monthly fsm
    WHERE fsm.product_code = 'YourProductID'
    GROUP BY YEAR(fsm.date), MONTH(fsm.date)
)
SELECT
    fiscal_year,
    sale_month,
    actual_sales,
    forecast_quantity,
    CASE
        WHEN forecast_quantity = 0 THEN NULL
        ELSE (actual_sales * 1.0 / forecast_quantity) * 100
    END AS monthly_forecast_accuracy
FROM
    MonthlyForecastAccuracy
ORDER BY
    fiscal_year, sale_month;

-- Interpretation and Considerations:

-- High/Low Forecast Accuracy:
-- * High accuracy indicates effective forecasting.
-- * Low accuracy suggests issues with forecasting models or unexpected market changes.
-- Possible Reasons for Discrepancies:
-- * Seasonal fluctuations not accounted for.
-- * Unexpected market events (economic changes, competitor actions).
-- * Inaccurate historical data.
-- * Changes in marketing or promotional activities.
-- * Issues with the forecasting model itself.

-- Handling Missing/Incomplete Data:
-- * Use CASE statements to handle division by zero (as shown above).
-- * Impute missing sales data with averages or other statistical methods (with caution).
-- * Flag rows with missing data for further investigation.
-- * Use LEFT JOINs to ensure you include all forecast data, even if there's no corresponding sales data.
-- * Consider using window functions to fill in missing values based on surrounding data.
-- * If there is a large amount of missing data, consider the data as unreliable.
















