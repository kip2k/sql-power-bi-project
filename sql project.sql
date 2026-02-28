#1 coi country nao nhieu views/subs/tien nhat
SELECT
 Country,
    round(avg(subscribers), 2) as avg_subs, 
    round(avg(`video views`), 2) as avg_views, 
    round(avg((highest_yearly_earnings + lowest_yearly_earnings) / 2), 2) as avg_earnings, 
    count(Youtuber) as number_of_Ytbers 
FROM youtube.`global youtube statistics` 
GROUP BY Country
Order by 4 desc;

#2  coi percentage cua country trong dong nay, minh se chon percentage of number of youtubers
SELECT 
    Country,
    COUNT(Youtuber) as number_of_Ytbers,
    ROUND(COUNT(Youtuber) / SUM(COUNT(Youtuber)) OVER() * 100.0, 2) as percentage_of_total
FROM youtube.`global youtube statistics`
GROUP BY Country
ORDER BY number_of_Ytbers DESC
LIMIT 10;

#3  coi category nao nhieu views nhat
SELECT 
    category,
   sum(`video views`) as total_views 
FROM youtube.`global youtube statistics`
GROUP BY category
ORDER BY total_views DESC
LIMIT 10;

