WITH SCORES AS (
SELECT  
  (SELECT CASE WHEN POWER(2,COUNT(DISTINCT held)-1) < 1 THEN 0 ELSE POWER(2,COUNT(DISTINCT held)-1) END
   FROM UNNEST(
     ARRAY(
       SELECT CAST(number AS INT) 
       FROM UNNEST(REGEXP_EXTRACT_ALL(winners, r'(\d+) ')) AS number
     )
   ) AS winners
   JOIN UNNEST(
     ARRAY(
       SELECT CAST(number AS INT) 
       FROM UNNEST(SPLIT(held, ' ')) AS number
       WHERE number != ''
     )
   ) AS held
   ON winners = held) AS score
FROM `advent-of-code-2023.puzzle_inputs.day_4` LIMIT 1000
)
SELECT 
CAST(SUM(score) AS INT)
FROM 
SCORES