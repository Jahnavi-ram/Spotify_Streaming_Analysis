-- Step 1: Understanding the Data Structure
-- Describe the table to understand the columns and data types
DESCRIBE spotify_history;

-- Preview the first 10 rows to inspect data quality
SELECT * FROM spotify_history LIMIT 10;

-- Step 2: Splitting Timestamp (ts) into Separate Date and Time Columns
-- Adding new columns for date and time
ALTER TABLE spotify_history 
ADD COLUMN date DATE,
ADD COLUMN time TIME;

-- Disable safe updates to allow modifications
SET SQL_SAFE_UPDATES = 0;

-- Populate the new columns by extracting date and time from ts
UPDATE spotify_history 
SET date = DATE(ts), 
    time = TIME(ts);

-- Enable safe updates again
SET SQL_SAFE_UPDATES = 1;

-- Verify that the new columns have been populated correctly
SELECT date, time FROM spotify_history LIMIT 10;

-- Remove the original timestamp column as it is now redundant
ALTER TABLE spotify_history
DROP COLUMN ts;

-- Step 3: Checking for Unique and NULL Values in Shuffle and Skipped Columns
-- Checking unique values in shuffle column to verify data consistency
SELECT DISTINCT shuffle FROM spotify_history;

-- Checking for NULL values in shuffle and skipped columns
SELECT COUNT(*) AS null_shuffle_values FROM spotify_history WHERE shuffle IS NULL;
SELECT COUNT(*) AS null_skipped_values FROM spotify_history WHERE skipped IS NULL;

-- Step 4: Identifying Missing Values in Critical Columns
-- Counting missing values in key columns to assess data completeness
SELECT 
    SUM(CASE WHEN track_id IS NULL OR track_id = '' THEN 1 ELSE 0 END) AS missing_track_id,
    SUM(CASE WHEN platform IS NULL OR platform = '' THEN 1 ELSE 0 END) AS missing_platform,
    SUM(CASE WHEN ms_played IS NULL OR ms_played = '' THEN 1 ELSE 0 END) AS missing_ms_played,
    SUM(CASE WHEN track_name IS NULL OR track_name = '' THEN 1 ELSE 0 END) AS missing_track_name,
    SUM(CASE WHEN artist_name IS NULL OR artist_name = '' THEN 1 ELSE 0 END) AS missing_artist_name,
    SUM(CASE WHEN album_name IS NULL OR album_name = '' THEN 1 ELSE 0 END) AS missing_album_name,
    SUM(CASE WHEN reason_start IS NULL OR reason_start = '' THEN 1 ELSE 0 END) AS missing_reason_start,
    SUM(CASE WHEN reason_end IS NULL OR reason_end = '' THEN 1 ELSE 0 END) AS missing_reason_end
FROM spotify_history;

-- Step 5: Identifying Skipped Songs and Empty Strings in reason_start and reason_end
-- Counting the number of records where ms_played is 0 (indicating a likely skipped song)
SELECT COUNT(*) FROM spotify_history WHERE ms_played=0;

-- Checking for empty strings in reason_start and reason_end columns
SELECT 
    SUM(CASE WHEN reason_start = '' THEN 1 ELSE 0 END) AS empty_reason_start,
    SUM(CASE WHEN reason_end = '' THEN 1 ELSE 0 END) AS empty_reason_end
FROM spotify_history;

-- Viewing records where reason_start or reason_end is empty
SELECT * FROM spotify_history WHERE reason_start = '' OR reason_end = '';

-- Checking distinct values in reason_start column
SELECT DISTINCT reason_start FROM spotify_history;

-- Viewing 20 sample records where reason_start or reason_end is empty
SELECT * FROM spotify_history WHERE reason_start = '' OR reason_end = '' LIMIT 20;

-- Step 6: Replacing Empty Strings in reason_start and reason_end with 'UNKNOWN'
SET SQL_SAFE_UPDATES = 0;
UPDATE spotify_history SET reason_start = 'UNKNOWN' WHERE reason_start = '';
UPDATE spotify_history SET reason_end = 'UNKNOWN' WHERE reason_end = '';
SET SQL_SAFE_UPDATES = 1;

-- Step 7: Identifying and Removing Duplicate Records
-- Checking for duplicate records based on all relevant columns
SELECT track_id, date, time, platform, ms_played, track_name, artist_name, album_name, reason_start, reason_end, shuffle, skipped, 
       COUNT(*) AS duplicate_count
FROM spotify_history
GROUP BY track_id, date, time, platform, ms_played, track_name, artist_name, album_name, reason_start, reason_end, shuffle, skipped
HAVING COUNT(*) > 1;

-- Adding an ID column to facilitate duplicate removal
ALTER TABLE spotify_history ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

-- Removing duplicate records while keeping the first occurrence
DELETE FROM spotify_history
WHERE id NOT IN (
    SELECT id FROM (
        SELECT MIN(id) AS id
        FROM spotify_history
        GROUP BY track_id, date, time, platform, ms_played, track_name, artist_name, album_name, reason_start, reason_end, shuffle, skipped
    ) AS unique_rows
);

-- Verifying that duplicates have been removed
SELECT track_id, date, time, platform, ms_played, track_name, artist_name, album_name, reason_start, reason_end, shuffle, skipped, 
       COUNT(*) AS duplicate_count
FROM spotify_history
GROUP BY track_id, date, time, platform, ms_played, track_name, artist_name, album_name, reason_start, reason_end, shuffle, skipped
HAVING COUNT(*) > 1;
