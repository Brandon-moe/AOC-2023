CREATE OR REPLACE TABLE `advent-of-code-2023.puzzle_inputs.day_2_temp` AS 
SELECT
  REGEXP_EXTRACT(string_field_0, r': (.+)$') AS PULL0,
  string_field_1 AS PULL1,
  string_field_2 AS PULL2,
  string_field_3 AS PULL3,
  string_field_4 AS PULL4,
  string_field_5 AS PULL5,
  CAST(REGEXP_EXTRACT(string_field_0, r'(\d+)') AS INT) AS GAMENO,
FROM 
  `advent-of-code-2023.puzzle_inputs.day_2`;
DROP TABLE `advent-of-code-2023.puzzle_inputs.day_2`;
ALTER TABLE `advent-of-code-2023.puzzle_inputs.day_2_temp` RENAME TO day_2;
SELECT
  SUM(GAMENO)
FROM
  `advent-of-code-2023.puzzle_inputs.day_2`
WHERE
  NOT (
    COALESCE(CAST(REGEXP_EXTRACT(PULL0, r'(\d+)\s+blue') AS INT), 0) > 14
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL0, r'(\d+)\s+green') AS INT), 0) > 13
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL0, r'(\d+)\s+red') AS INT), 0) > 12
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL1, r'(\d+)\s+blue') AS INT), 0) > 14
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL1, r'(\d+)\s+green') AS INT), 0) > 13
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL1, r'(\d+)\s+red') AS INT), 0) > 12
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL2, r'(\d+)\s+blue') AS INT), 0) > 14
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL2, r'(\d+)\s+green') AS INT), 0) > 13
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL2, r'(\d+)\s+red') AS INT), 0) > 12
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL3, r'(\d+)\s+blue') AS INT), 0) > 14
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL3, r'(\d+)\s+green') AS INT), 0) > 13
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL3, r'(\d+)\s+red') AS INT), 0) > 12
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL4, r'(\d+)\s+blue') AS INT), 0) > 14
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL4, r'(\d+)\s+green') AS INT), 0) > 13
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL4, r'(\d+)\s+red') AS INT), 0) > 12
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL5, r'(\d+)\s+blue') AS INT), 0) > 14
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL5, r'(\d+)\s+green') AS INT), 0) > 13
    OR
    COALESCE(CAST(REGEXP_EXTRACT(PULL5, r'(\d+)\s+red') AS INT), 0) > 12
  );
WITH MAXIMUMS AS(
  SELECT
  GREATEST(
    COALESCE(CAST(REGEXP_EXTRACT(PULL0, r'(\d+)\s+blue') AS INT), 0),
    COALESCE(CAST(REGEXP_EXTRACT(PULL1, r'(\d+)\s+blue') AS INT), 0),
    COALESCE(CAST(REGEXP_EXTRACT(PULL2, r'(\d+)\s+blue') AS INT), 0),
    COALESCE(CAST(REGEXP_EXTRACT(PULL3, r'(\d+)\s+blue') AS INT), 0),
    COALESCE(CAST(REGEXP_EXTRACT(PULL4, r'(\d+)\s+blue') AS INT), 0),
    COALESCE(CAST(REGEXP_EXTRACT(PULL5, r'(\d+)\s+blue') AS INT), 0)
  ) AS MAXBLUE,
  GREATEST(
      COALESCE(CAST(REGEXP_EXTRACT(PULL0, r'(\d+)\s+red') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL1, r'(\d+)\s+red') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL2, r'(\d+)\s+red') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL3, r'(\d+)\s+red') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL4, r'(\d+)\s+red') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL5, r'(\d+)\s+red') AS INT), 0)
    ) AS MAXRED,
  GREATEST(
      COALESCE(CAST(REGEXP_EXTRACT(PULL0, r'(\d+)\s+green') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL1, r'(\d+)\s+green') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL2, r'(\d+)\s+green') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL3, r'(\d+)\s+green') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL4, r'(\d+)\s+green') AS INT), 0),
      COALESCE(CAST(REGEXP_EXTRACT(PULL5, r'(\d+)\s+green') AS INT), 0)
    ) AS MAXGREEN 
  FROM  
    `advent-of-code-2023.puzzle_inputs.day_2`
)
SELECT
  SUM(MAXBLUE*MAXRED*MAXGREEN)
FROM
  MAXIMUMS;