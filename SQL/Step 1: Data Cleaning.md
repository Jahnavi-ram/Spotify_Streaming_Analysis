# Step 1: Data Cleaning - Spotify Streaming History 🎵

## **Objective**
The goal of this step is to clean and preprocess the **Spotify streaming history** dataset for further analysis. This involves **handling missing values, splitting columns, and removing duplicates** to ensure data integrity.

---
## **1️⃣ Understanding the Data**
Before making changes, we first inspected the table structure and previewed a few records:

### ✅ Checking Table Structure
```sql
DESCRIBE spotify_history;
SELECT * FROM spotify_history LIMIT 10;
```

### 🔍 Observations:
- The `ts` column contains **date and time combined**.
- `shuffle` and `skipped` are stored as **boolean values** (0/1).
- Some columns might have **missing or empty values**.

---
## **2️⃣ Splitting 'ts' into Separate Date & Time Columns**
Since `ts` contains **both date and time**, we split it into separate columns:

```sql
ALTER TABLE spotify_history
ADD COLUMN date DATE,
ADD COLUMN time TIME;
```

Then, we populated these new columns:
```sql
SET SQL_SAFE_UPDATES = 0;
UPDATE spotify_history
SET date = DATE(ts),
    time = TIME(ts);
SET SQL_SAFE_UPDATES = 1;
```
Finally, we removed the `ts` column:
```sql
ALTER TABLE spotify_history DROP COLUMN ts;
```

### 🔍 Why?
- This allows for **better time-based analysis** (e.g., daily trends, peak hours).

---
## **3️⃣ Checking for Missing Values**
We identified missing values in key columns:

```sql
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
```
### 🔍 Findings:
- **3733 rows have `ms_played` as 0** → Possible instant skips.
- **143 missing `reason_start` values**, **117 missing `reason_end` values**.
- Other columns had no missing values.

---
## **4️⃣ Handling Empty Values in 'reason_start' & 'reason_end'**
We replaced empty values with `'UNKNOWN'`:
```sql
SET SQL_SAFE_UPDATES = 0;
UPDATE spotify_history SET reason_start = 'UNKNOWN' WHERE reason_start = '';
UPDATE spotify_history SET reason_end = 'UNKNOWN' WHERE reason_end = '';
SET SQL_SAFE_UPDATES = 1;
```
### 🔍 Why?
- Avoids **misinterpretation of missing reasons**.
- Provides a **default category** for analysis.

---
## **5️⃣ Identifying & Removing Duplicates**
We checked for duplicates:
```sql
SELECT track_id, date, time, platform, ms_played, track_name, artist_name, album_name, reason_start, reason_end, shuffle, skipped,
       COUNT(*) AS duplicate_count
FROM spotify_history
GROUP BY track_id, date, time, platform, ms_played, track_name, artist_name, album_name, reason_start, reason_end, shuffle, skipped
HAVING COUNT(*) > 1;
```
### 🔍 Findings:
- Some rows were **exact duplicates**, likely due to repeated data sync.

To remove duplicates, we first added a unique identifier:
```sql
ALTER TABLE spotify_history ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;
```
Then, we deleted duplicate rows while keeping the first occurrence:
```sql
DELETE FROM spotify_history
WHERE id NOT IN (
    SELECT id FROM (
        SELECT MIN(id) AS id
        FROM spotify_history
        GROUP BY track_id, date, time, platform, ms_played, track_name, artist_name, album_name, reason_start, reason_end, shuffle, skipped
    ) AS unique_rows
);
```
Finally, we rechecked for duplicates:
```sql
SELECT COUNT(*) FROM spotify_history;
```

### 🔍 Why?
- Ensures **data integrity** by keeping only unique entries.
- Prevents **bias in analysis** due to repeated entries.

---
## **✅ Final Data Cleaning Summary**

| Step | Action | Outcome |
|------|--------|---------|
| 1️⃣ | Split `ts` into `date` & `time` | Improved time-based analysis |
| 2️⃣ | Checked missing values | Identified missing `reason_start`, `reason_end` |
| 3️⃣ | Replaced missing values with `'UNKNOWN'` | Standardized data |
| 4️⃣ | Checked and removed duplicates | Ensured unique records |

---
## **Next Steps** 🚀
Now that our data is **clean and structured**, we can proceed to **Step 2: Exploratory Data Analysis (EDA)** to uncover **insights on listening behavior, song popularity, and user engagement!** 🎶

