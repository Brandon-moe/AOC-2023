WITH 
  REGEX AS (
    SELECT '[0-9]' AS PATTERN
  ),
  FIRSTANDLAST AS (
    SELECT 
      REGEXP_SUBSTR(input_line, PATTERN) AS FIRST,
      REGEXP_SUBSTR(REVERSE(input_line), PATTERN) AS LAST
    FROM `advent-of-code-2023.puzzle_inputs.day_1`
    LEFT JOIN 
        REGEX on TRUE
  )
SELECT 
  SUM(CAST(CONCAT(FIRST,LAST) AS INT))
FROM FIRSTANDLAST;
WITH 
  REGEX AS (
    SELECT '(one|two|three|four|five|six|seven|eight|nine|[0-9])' AS PATTERN,
    '(eno|owt|eerht|ruof|evif|xis|neves|thgie|enin|[0-9])' AS REVPATTERN
  ),
  NUMBERMAP AS (
    SELECT "one" AS str, 1 as digit
    UNION ALL SELECT "two" AS str, 2 
    UNION ALL SELECT "three" AS str, 3
    UNION ALL SELECT "four" AS str, 4 
    UNION ALL SELECT "five" AS str, 5 
    UNION ALL SELECT "six" AS str, 6 
    UNION ALL SELECT "seven" AS str, 7 
    UNION ALL SELECT "eight" AS str, 8 
    UNION ALL SELECT "nine" AS str, 9 
  ),
  REVNUMBERMAP AS (
    SELECT "eno" AS str, 1 as digit
    UNION ALL SELECT "owt" AS str, 2 
    UNION ALL SELECT "eerht" AS str, 3
    UNION ALL SELECT "ruof" AS str, 4 
    UNION ALL SELECT "evif" AS str, 5 
    UNION ALL SELECT "xis" AS str, 6 
    UNION ALL SELECT "neves" AS str, 7 
    UNION ALL SELECT "thgie" AS str, 8 
    UNION ALL SELECT "enin" AS str, 9 
  ),
  FIRSTANDLAST AS (
    SELECT 
      CAST(COALESCE(n.digit,CAST(REGEXP_SUBSTR(t.input_line, r.PATTERN) AS INT)) AS STRING) AS FIRST,
      CAST(COALESCE(m.digit,CAST(REGEXP_SUBSTR(REVERSE(t.input_line), r.REVPATTERN) AS INT)) AS STRING) AS LAST
    FROM `advent-of-code-2023.puzzle_inputs.day_1` t
    LEFT JOIN 
        REGEX r on TRUE
    LEFT JOIN
      NUMBERMAP n ON REGEXP_SUBSTR(t.input_line, r.PATTERN) = n.str
    LEFT JOIN
      REVNUMBERMAP m ON REGEXP_SUBSTR(REVERSE(t.input_line), r.REVPATTERN) = m.str
  )
SELECT 
  SUM(CAST(CONCAT(FIRST,LAST) AS INT))
FROM FIRSTANDLAST