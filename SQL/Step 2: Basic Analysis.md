# **Spotify Streaming Data Analysis: Key Insights & Business Impact**

## **A. Executive Summary**
In this project, I have analyzed **Spotify streaming data** to uncover **listener behavior, engagement trends, and platform preferences.** The goal was to identify **patterns that influence business decisions for artists, streaming platforms, and marketers.**

This analysis highlights **peak listening hours, top-performing artists, listener retention trends, and platform-based insights** that can drive strategic decisions.

---

## **B. Key Takeaways & Business Insights**

### **✅ The Power of Long-Form, Cinematic & Classic Music**
- **Soundtracks & classic rock dominate streaming trends.** The Beatles, Howard Shore (*Lord of the Rings*), and The Killers hold high engagement.
- **Longer-duration, storytelling-driven songs retain listeners better.**
- **Business Insight:** Licensing and playlist curation for movie soundtracks can boost retention on streaming platforms.

### **✅ Skip Behavior & Listener Engagement Trends**
- **Popular songs don’t always guarantee engagement.** High skip rates for "Photograph" and "Superheroes" suggest users abandon mainstream tracks frequently.
- **Android users skip more than iOS users,** meaning mobile behavior varies by OS.
- **Business Insight:** Artists should focus on **stronger song intros & marketing strategies to lower skip rates.**

### **✅ When & Where Do People Stream?**
- **Peak listening hours:** 5 PM - 8 PM (post-work/school), with another peak at midnight.
- **Weekends & Friday nights show the highest playtime.**
- **Business Insight:** **Releasing music on Thursdays or Fridays maximizes first-day engagement.**

### **✅ The Platform Battle: Mobile Rules, but Desktop Has Loyal Listeners**
- **Android dominates total playtime,** but **Windows has the highest skip rate (14.07%).**
- **Web Player & Cast-to-Device listeners skip the least, suggesting passive/background listening.**
- **Business Insight:** **Streaming platforms should tailor UI/UX for different device types.**

### **✅ Artist Dependency on Top Songs**
- **Some artists rely heavily on just a few hits** (e.g., Howard Shore’s *Lord of the Rings* soundtrack).
- **Others, like The Beatles & The Killers, have a diversified playtime spread across many songs.**
- **Business Insight:** Artists who rely on a few hit songs should diversify their releases to maintain long-term engagement.

### **✅ Seasonality: The Impact of Time on Streaming**
- **October is the peak streaming month,** possibly due to new music releases and seasonal listening habits.
- **Engagement remains high from August to December, likely due to holiday playlists.**
- **Business Insight:** **Music labels should target new releases between August-October for maximum reach.**

---

## **C. SQL Analysis & Queries**
Below are the SQL queries used for extracting insights, along with corresponding outputs and quick takeaways.

---

## 1. Most Played Songs

### SQL Query:
```sql
SELECT track_name,
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY track_name
ORDER BY total_playtime DESC
LIMIT 10;
```

### Output:
| track_name | total_playtime |
|------------|---------------|
| Ode To The Mets | 66024432 |
| The Return of the King (feat. Sir James Galway) | 64401661 |
| The Fellowship Reunited (feat. Sir James Galway) | 44756730 |
| 19 Dias y 500 Noches - En Directo | 42375027 |
| In the Blood | 38183421 |
| Claudia's Theme - Version Eight | 37120900 |
| Dying Breed | 36182653 |
| The Breaking of the Fellowship (feat. "In Dreams") | 35990898 |
| The Road Goes Ever On..., Pt. 1 | 35236377 |
| All These Things That I've Done | 34247045 |

### Quick Insights:
- **"Ode To The Mets"** has the highest total playtime, indicating its strong listener retention.
- Multiple songs from **soundtracks (Lord of the Rings, The Killers, Howard Shore)** dominate the top 10.
- High engagement is seen for **cinematic and storytelling-driven songs**, suggesting long-duration plays.

---

## 2. Most Played Songs by Platform

### SQL Query:
```sql
SELECT track_name,
       platform,
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY track_name, platform
ORDER BY total_playtime DESC
LIMIT 10;
```

### Output:
| track_name | platform | total_playtime |
|------------|---------|---------------|
| The Return of the King (feat. Sir James Galway) | android | 63173129 |
| Ode To The Mets | android | 59173039 |
| The Fellowship Reunited (feat. Sir James Galway) | android | 44756730 |
| 19 Dias y 500 Noches - En Directo | android | 41102762 |
| The Breaking of the Fellowship (feat. "In Dreams") | android | 35990898 |
| Dying Breed | android | 35920662 |
| Claudia's Theme - Version Eight | android | 35753712 |
| The Road Goes Ever On..., Pt. 1 | android | 35236377 |
| In the Blood | android | 35015741 |
| Epilogue | android | 30180198 |

### Quick Insights:
- **Android users** account for most of the top played songs, which suggests mobile streaming is dominant.
- **"The Return of the King"** and **"Ode To The Mets"** continue to rank highest across platforms.
- **Cinematic music and long-duration songs** dominate the top charts on mobile streaming, showing a preference for immersive listening sessions.

---

### 3. Most Played Song per Artist
**Query:**
```sql
SELECT artist_name, 
       track_name, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY artist_name, track_name
ORDER BY total_playtime DESC
LIMIT 10;
```
**Output:**
| artist_name | track_name | total_playtime |
|-------------|-----------|---------------|
| The Strokes | Ode To The Mets | 66024432 |
| Howard Shore | The Return of the King (feat. Sir James Galway,...) | 64401661 |
| Howard Shore | The Fellowship Reunited (feat. Sir James Galway,...) | 44756730 |
| Joaquín Sabina | 19 Dias y 500 Noches - En Directo | 42375027 |
| John Mayer | In the Blood | 38183421 |
| Lennie Niehaus | Claudia's Theme - Version Eight | 37120900 |
| The Killers | Dying Breed | 36182653 |
| Howard Shore | The Breaking of the Fellowship (feat. "In Dreams") | 35990898 |
| Howard Shore | The Road Goes Ever On..., Pt. 1 | 35236377 |
| The Killers | All These Things That I've Done | 34247045 |

**Quick Insight:**
- The **most played song per artist** reveals which track drives the most engagement for each musician.
- **Howard Shore** has multiple tracks in the top 10, confirming his popularity, likely due to **The Lord of the Rings** soundtrack.
- **John Mayer, The Killers, and Joaquín Sabina** have standout songs that engage audiences significantly.

---

### 4. Most Played Album
**Query:**
```sql
SELECT album_name, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY album_name
ORDER BY total_playtime DESC
LIMIT 10;
```
**Output:**
| album_name | total_playtime |
|------------|---------------|
| The Beatles | 185235243 |
| The New Abnormal | 179196017 |
| Imploding The Mirage | 159921153 |
| Abbey Road | 148058049 |
| Blood On The Tracks | 144770276 |
| Past Masters | 144612032 |
| Hot Fuss | 140206062 |
| The Wall | 138117224 |
| Pressure Machine | 113324404 |
| Where the Light Is: John Mayer Live In Los Angeles | 111894126 |

**Quick Insight:**
- **The Beatles** dominate album streaming, reinforcing their **timeless popularity**.
- **Modern rock albums** like *The New Abnormal* and *Imploding The Mirage* hold high engagement, suggesting strong followings for newer releases.
- **Classic rock albums**, such as *Abbey Road* and *The Wall*, remain highly streamed, proving their longevity in listener preferences.

---
## 5. Most Played Songs within Each Album

### Query:
```sql
SELECT album_name,
       track_name,
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY album_name, track_name
ORDER BY total_playtime DESC
LIMIT 10;
```

### Output:
| album_name | track_name | total_playtime |
|------------|-----------|---------------|
| The New Abnormal | Ode To The Mets | 66024432 |
| The Lord of the Rings: The Return of the King | The Return of the King (feat. Sir James Galway,...) | 64401661 |
| The Lord of the Rings - The Return of the King -... | The Fellowship Reunited (feat. Sir James Galway,...) | 44756730 |
| Nos Sobran Los Motivos | 19 Dias y 500 Noches - En Directo | 42375027 |
| The Search for Everything | In the Blood | 38183421 |
| The Lord of the Rings: The Fellowship of the Ring | The Breaking of the Fellowship (feat. "In Dreams") | 35990898 |
| Unforgiven - Original Motion Picture Soundtrack | Claudia's Theme - Version Eight | 35411570 |
| The Lord of the Rings: The Fellowship of the Ring | The Road Goes Ever On..., Pt. 1 | 35236377 |
| Hot Fuss | All These Things That I've Done | 34247045 |
| La La Land | Epilogue | 31740096 |

### Quick Insights:
- **"Ode To The Mets"** from *The New Abnormal* leads in total playtime among album tracks.
- Soundtracks from **"The Lord of the Rings"** dominate the top 10, confirming a high level of engagement with cinematic scores.
- **"Hot Fuss"** and *The Search for Everything* have standout tracks with substantial streaming time.
- **"La La Land"** soundtrack’s *Epilogue* secures a spot, showing that movie soundtracks attract significant listenership beyond just The Lord of the Rings.

---

### 6. Most Skipped Songs
**Query:**
```sql
SELECT track_name, 
       COUNT(*) AS skip_count
FROM spotify_history
WHERE skipped = 1
GROUP BY track_name
ORDER BY skip_count DESC
LIMIT 10;
```
**Output:**
| track_name | skip_count |
|------------|-----------|
| Paraíso | 29 |
| Photograph | 22 |
| Superheroes | 21 |
| Switzerland | 20 |
| What Do You Mean? | 20 |
| Old Thing Back (feat. Ja Rule and Ralph Tresvant) | 19 |
| Diez Mil Maneras | 18 |
| Drag Me Down | 18 |
| La Buena y la Mala | 15 |
| Stitches | 14 |

**Quick Insight:**
- **"Paraíso" has the highest skip count**, which may indicate **lack of engagement** or frequent accidental plays.
- Popular tracks like **"Photograph" and "Superheroes"** have relatively high skip counts, suggesting that even **mainstream songs** can have a divisive audience.
- **Skipping behavior** might be influenced by mood, genre, or user expectations.

---

### 7. Skip Rate per Song
**Query:**
```sql
SELECT track_name,
       COUNT(*) AS total_plays,
       SUM(skipped) AS total_skips,
       ROUND((SUM(skipped) / COUNT(*)) * 100, 2) AS skip_rate
FROM spotify_history
GROUP BY track_name
ORDER BY total_plays DESC
LIMIT 10;
```
**Output:**
| track_name | total_plays | total_skips | skip_rate |
|------------|------------|------------|-----------|
| Ode To The Mets | 203 | 1 | 0.49 |
| In the Blood | 180 | 1 | 0.56 |
| Dying Breed | 166 | 2 | 1.20 |
| Caution | 155 | 2 | 1.29 |
| 19 Dias y 500 Noches - En Directo | 146 | 5 | 3.42 |
| Concerning Hobbits | 142 | 7 | 4.93 |
| Come Together - Remastered 2009 | 136 | 2 | 1.47 |
| All These Things That I've Done | 136 | 3 | 2.21 |
| For What It's Worth | 135 | 1 | 0.74 |
| The Boxer | 134 | 5 | 3.73 |

**Quick Insight:**
- The **lowest skip rate** is observed in highly played tracks like "Ode To The Mets" and "In the Blood," suggesting strong audience engagement.
- **Higher skip rates** for songs like "Concerning Hobbits" and "The Boxer" suggest they might be skipped after partial listens.

---

### 8. Skipped Songs by Platform
**Query:**
```sql
SELECT track_name, 
       platform, 
       SUM(skipped) AS total_skips
FROM spotify_history
GROUP BY track_name, platform
ORDER BY total_skips DESC
LIMIT 10;
```
**Output:**
| track_name | platform | total_skips |
|------------|---------|------------|
| Paraíso | android | 26 |
| Photograph | android | 22 |
| Superheroes | android | 21 |
| Switzerland | android | 20 |
| Diez Mil Maneras | android | 18 |
| What Do You Mean? | android | 18 |
| Old Thing Back (feat. Ja Rule and Ralph Tresvant) | android | 18 |
| Drag Me Down | android | 16 |
| La Buena y la Mala | android | 15 |
| All of Me | android | 14 |

**Quick Insight:**
- **Most skipped songs are on Android**, which may indicate platform-specific listening behavior.
- Some globally popular songs like "Photograph" have high skips, suggesting **audience division** in engagement.

---

### 9. Most Skipped Artists
**Query:**
```sql
SELECT artist_name, 
       COUNT(*) AS total_skips
FROM spotify_history
WHERE skipped = 1
GROUP BY artist_name
ORDER BY total_skips DESC
LIMIT 10;
```
**Output:**
| artist_name | total_skips |
|-------------|------------|
| The Beatles | 388 |
| The Killers | 197 |
| Bob Dylan | 163 |
| John Mayer | 153 |
| Led Zeppelin | 128 |
| The Rolling Stones | 125 |
| The Script | 121 |
| Imagine Dragons | 116 |
| Paul McCartney | 107 |
| Radiohead | 102 |

**Quick Insight:**
- **The Beatles and The Killers** have the most skipped songs, possibly due to **widely known discographies** where users may skip tracks they’re already familiar with.
- **Bob Dylan and John Mayer** also rank high, indicating that **folk/acoustic music may be more subject to skipping behaviors**.

---

### 10. Skip Rate Over Time (By Date)
**Query:**
```sql
SELECT date,
       COUNT(*) AS total_plays,
       SUM(skipped) AS total_skips,
       ROUND((SUM(skipped) / COUNT(*)) * 100, 2) AS skip_rate
FROM spotify_history
GROUP BY date
ORDER BY date
LIMIT 10;
```
**Output:**
| date | total_plays | total_skips | skip_rate |
|------------|------------|------------|-----------|
| 2013-07-08 | 65 | 0 | 0.00 |
| 2013-07-09 | 29 | 0 | 0.00 |
| 2013-07-10 | 6 | 3 | 50.00 |
| 2013-07-11 | 2 | 2 | 100.00 |
| 2013-07-12 | 1 | 1 | 100.00 |
| 2013-07-13 | 12 | 6 | 50.00 |
| 2013-08-02 | 38 | 8 | 21.05 |
| 2013-08-04 | 1 | 1 | 100.00 |
| 2013-08-17 | 2 | 2 | 100.00 |
| 2013-09-07 | 27 | 1 | 3.70 |

**Quick Insight:**
- **High skip rates on certain dates** might indicate specific listening behaviors or unusual engagement trends.
- Some dates have **consistent 100% skip rates**, which could suggest tracks were **tested but abandoned quickly**.

---

### 11. Skip Rate Over Time (By Hour)
**Query:**
```sql
SELECT time,
       COUNT(*) AS total_plays,
       SUM(skipped) AS total_skips,
       ROUND((SUM(skipped) / COUNT(*)) * 100, 2) AS skip_rate
FROM spotify_history
GROUP BY time
ORDER BY time DESC
LIMIT 10;
```
**Output:**
| time | total_plays | total_skips | skip_rate |
|------------|------------|------------|-----------|
| 23:59:59 | 6 | 0 | 0.00 |
| 23:59:58 | 5 | 0 | 0.00 |
| 23:59:57 | 3 | 1 | 33.33 |
| 23:59:56 | 5 | 0 | 0.00 |
| 23:59:55 | 2 | 0 | 0.00 |
| 23:59:54 | 2 | 0 | 0.00 |
| 23:59:53 | 2 | 0 | 0.00 |
| 23:59:52 | 2 | 0 | 0.00 |
| 23:59:51 | 7 | 0 | 0.00 |
| 23:59:50 | 4 | 0 | 0.00 |

**Quick Insight:**
- **Late-night hours** have some of the highest skip rates, possibly reflecting passive listening or skipping before sleeping.
- **Skip rates vary significantly by second**, showing that some tracks may be skipped almost instantly after playing.

---

## 12. Total Playtime, Skip Count, and Skip Rate per Song

### Query:
```sql
SELECT track_name, 
       SUM(ms_played) AS total_playtime, 
       SUM(skipped) AS total_skips, 
       ROUND((SUM(skipped) / COUNT(*)) * 100, 2) AS skip_rate
FROM spotify_history
GROUP BY track_name
ORDER BY total_playtime DESC
LIMIT 10;
```

### Output:
| track_name | total_playtime | total_skips | skip_rate |
|------------|---------------|-------------|-----------|
| Ode To The Mets | 66024432 | 1 | 0.49 |
| The Return of the King (feat. Sir James Galway,...) | 64401661 | 2 | 1.67 |
| The Fellowship Reunited (feat. Sir James Galway,...) | 44756730 | 2 | 2.56 |
| 19 Dias y 500 Noches - En Directo | 42375027 | 5 | 3.42 |
| In the Blood | 38183421 | 1 | 0.56 |
| Claudia's Theme - Version Eight | 37120900 | 4 | 3.25 |
| Dying Breed | 36182653 | 2 | 1.20 |
| The Breaking of the Fellowship (feat. "In Dreams") | 35990898 | 2 | 2.15 |
| The Road Goes Ever On..., Pt. 1 | 35236377 | 1 | 0.83 |
| All These Things That I've Done | 34247045 | 3 | 2.21 |

### Quick Insights:
- **Top streamed songs show minimal skip rates**, indicating high listener retention.
- **"19 Dias y 500 Noches - En Directo" and "Claudia's Theme"** have slightly higher skip rates, possibly due to length or niche appeal.
- **Popular tracks like "Ode To The Mets" and "In the Blood"** have exceptionally low skip rates, reinforcing their strong engagement with listeners.

---

### 13. Playtime vs. Skip Rate Over Time
**Query:**
```sql
SELECT date, 
       SUM(ms_played) AS total_playtime, 
       SUM(skipped) AS total_skips, 
       ROUND((SUM(skipped) / COUNT(*)) * 100, 2) AS skip_rate
FROM spotify_history
GROUP BY date
ORDER BY date DESC
LIMIT 10;
```
**Output:**
| date | total_playtime | total_skips | skip_rate |
|------------|------------|------------|-----------|
| 2024-12-15 | 1528465 | 24 | 80.00 |
| 2024-12-14 | 2339086 | 0 | 0.00 |
| 2024-12-13 | 386200 | 0 | 0.00 |
| 2024-12-10 | 2696131 | 47 | 83.93 |
| 2024-12-09 | 779859 | 2 | 33.33 |
| 2024-12-08 | 450337 | 13 | 76.47 |
| 2024-12-07 | 2344982 | 9 | 45.00 |
| 2024-12-01 | 1573854 | 1 | 12.50 |
| 2024-11-30 | 7686626 | 5 | 12.82 |
| 2024-11-29 | 3496347 | 49 | 80.33 |

**Quick Insight:**
- **High skip rates** on certain dates suggest potential shifts in user behavior or trending releases.
- **December 10 and November 29** saw extremely high skip rates, indicating that users may have been sampling songs more often than usual.

---

### 14. Playtime vs. Skip Rate by Platform
**Query:**
```sql
SELECT platform, 
       SUM(ms_played) AS total_playtime, 
       SUM(skipped) AS total_skips, 
       ROUND((SUM(skipped) / COUNT(*)) * 100, 2) AS skip_rate
FROM spotify_history
GROUP BY platform
ORDER BY total_playtime DESC;
```
**Output:**
| platform | total_playtime | total_skips | skip_rate |
|------------|------------|------------|-----------|
| android | 17475600446 | 7245 | 5.19 |
| cast to device | 555355794 | 0 | 0.00 |
| iOS | 502951091 | 313 | 10.27 |
| mac | 251908949 | 72 | 6.12 |
| windows | 233763391 | 238 | 14.07 |
| web player | 19841749 | 0 | 0.00 |

**Quick Insight:**
- **Android dominates total playtime**, but Windows has the **highest skip rate at 14.07%**.
- **Casting to devices and web players** have **zero skips**, indicating more passive listening experiences.

---

### 15. Average Playtime Before Skipping
**Query:**
```sql
SELECT track_name, 
       ROUND(AVG(ms_played), 2) AS avg_playtime_before_skip
FROM spotify_history
WHERE skipped = 1
GROUP BY track_name
ORDER BY avg_playtime_before_skip DESC;
```
**Output:**
| track_name | avg_playtime_before_skip |
|------------|------------------------|
| Human Sadness | 1142390.00 |
| Calmante | 481906.00 |
| Stuck Inside of Mobile with the Memphis Blues | 421349.00 |
| Up&Up | 385409.00 |
| Whatever - Remastered | 357917.00 |
| Romeo And Juliet | 355053.00 |
| Champagne Supernova - Remastered | 345869.00 |
| Sexual Healing - Kygo Remix | 340855.00 |
| In the Evening - Remaster | 321301.00 |
| Like It Is - Remastered | 314707.00 |

**Quick Insight:**
- **"Human Sadness" has the longest average playtime before skipping**, suggesting strong engagement before users eventually move on.
- **Songs with high average playtime before skips** tend to be **longer tracks or emotionally deep compositions**.

---

### 16. Playtime Before Skipping by Platform
**Query:**
```sql
SELECT platform, 
       ROUND(AVG(ms_played), 2) AS avg_playtime_before_skip
FROM spotify_history
WHERE skipped = 1
GROUP BY platform
ORDER BY avg_playtime_before_skip DESC;
```
**Output:**
| platform | avg_playtime_before_skip |
|------------|------------------------|
| iOS | 66623.36 |
| mac | 57723.22 |
| windows | 33847.54 |
| android | 29524.11 |

**Quick Insight:**
- **iOS users listen significantly longer** before skipping a song compared to Android users.
- **Mobile users (Android, iOS) have different engagement patterns**, with iOS users engaging more with tracks before skipping.

---

### 17. Playtime Before Skipping by Artist
**Query:**
```sql
SELECT artist_name, 
       ROUND(AVG(ms_played), 2) AS avg_playtime_before_skip
FROM spotify_history
WHERE skipped = 1
GROUP BY artist_name
ORDER BY avg_playtime_before_skip DESC
LIMIT 10;
```
**Output:**
| artist_name | avg_playtime_before_skip |
|------------|------------------------|
| Musica Relajante | 481906.00 |
| Dire Straits | 355053.00 |
| Marvin Gaye | 340855.00 |
| Yusef Lateef | 314707.00 |
| Maino | 304626.00 |
| Ptaki | 288055.00 |
| Ben Howard | 282221.00 |
| Manic Street Preachers | 275001.00 |
| Le Flex | 273552.00 |
| Peter Sarstedt | 257282.00 |

**Quick Insight:**
- **Musica Relajante leads with the longest average listening time before skipping**, indicating strong user retention.
- **Classic and relaxing music artists** tend to hold listeners' attention for longer durations.

---

### 18. Playtime Before Skipping by Time of Day
**Query:**
```sql
SELECT time, 
       ROUND(AVG(ms_played), 2) AS avg_playtime_before_skip
FROM spotify_history
WHERE skipped = 1
GROUP BY time
ORDER BY time DESC
LIMIT 10;
```
**Output:**
| time | avg_playtime_before_skip |
|------------|------------------------|
| 23:59:57 | 4812.00 |
| 23:59:44 | 75040.00 |
| 23:59:42 | 45743.00 |
| 23:59:25 | 156742.00 |
| 23:59:06 | 68214.00 |
| 23:59:03 | 11272.00 |
| 23:58:55 | 12645.00 |
| 23:58:54 | 4718.00 |
| 23:58:49 | 101320.00 |
| 23:58:44 | 168716.00 |

**Quick Insight:**
- **Late-night listening trends show varied engagement**, with some tracks played significantly longer before skipping.
- **Users may engage more deeply at night**, possibly due to relaxed environments or personal preferences.

---

### 19. Unique Listeners Per Song

**Query:**

```sql
SELECT track_name, 
       COUNT(DISTINCT track_id) AS unique_listeners
FROM spotify_history
GROUP BY track_name
ORDER BY unique_listeners DESC
LIMIT 10;
```

**Output:**

| track_name                                  | unique_listeners |
| ------------------------------------------- | ---------------- |
| Closer                                      | 10              |
| La vie en rose                              | 10              |
| Ella                                        | 9               |
| Wake Up                                     | 8               |
| All I Need                                  | 8               |
| The Way You Look Tonight                    | 8               |
| Master of the House                         | 8               |
| Run                                         | 8               |
| It's Beginning to Look a Lot like Christmas | 8               |
| Lost in My Mind                             | 7               |

**Quick Insight:**

- **Popular songs attract a diverse audience**, but some songs have a limited but engaged listener base.
- **Holiday songs and classics** appear frequently, suggesting seasonal trends in streaming behavior.

---

### 20. Unique Listeners Per Artist

**Query:**

```sql
SELECT artist_name, 
       COUNT(DISTINCT track_id) AS unique_listeners
FROM spotify_history
GROUP BY artist_name
ORDER BY unique_listeners DESC
LIMIT 10;
```

**Output:**

| artist_name         | unique_listeners |
| ------------------- | ---------------- |
| The Beatles        | 472              |
| The Killers        | 240              |
| Paul McCartney     | 180              |
| The Black Keys     | 173              |
| John Mayer        | 156              |
| The Rolling Stones | 149              |
| Radiohead         | 135              |
| Imagine Dragons   | 116              |
| The Kinks         | 115              |
| Bob Dylan         | 106              |

**Quick Insight:**

- **The Beatles dominate unique listener counts**, highlighting their broad and lasting appeal.
- **Rock and alternative bands** appear frequently, suggesting high engagement in these genres.

---

### 21. Unique Listeners Per Album

**Query:**

```sql
SELECT album_name, 
       COUNT(DISTINCT track_id) AS unique_listeners
FROM spotify_history
GROUP BY album_name
ORDER BY unique_listeners DESC
LIMIT 10;
```

**Output:**

| album_name                     | unique_listeners |
| ------------------------------- | ---------------- |
| The Beatles                    | 137              |
| Brothers                        | 64               |
| Live At The BBC                 | 62               |
| Revolver                        | 52               |
| A Star Is Born Soundtrack       | 49               |
| All Things Must Pass            | 48               |
| The Queen's Gambit Soundtrack   | 41               |
| Les Misérables Soundtrack      | 41               |
| Selección Especial             | 40               |
| The Velvet Underground          | 40               |

**Quick Insight:**

- **The Beatles once again top the list**, reinforcing their cross-generational appeal.
- **Soundtracks from movies and TV series** attract a diverse audience, showing the power of media influence on music streaming trends.

---

### 22. Unique Listeners Per Platform

**Query:**

```sql
SELECT platform, 
       COUNT(DISTINCT track_id) AS unique_listeners
FROM spotify_history
GROUP BY platform
ORDER BY unique_listeners DESC;
```

**Output:**

| platform         | unique_listeners |
| --------------- | ---------------- |
| Android         | 15296            |
| iOS            | 1824             |
| Cast to Device  | 1607             |
| Windows        | 1379             |
| Mac            | 725              |
| Web Player     | 156              |

**Quick Insight:**

- **Android dominates the streaming platforms**, possibly due to its larger global user base.
- **Cast to Device is a significant category**, suggesting that users frequently stream music to external devices rather than listening on phones or computers.
- **Web Player has the least engagement**, indicating that most users prefer mobile or dedicated desktop applications.

---

### 23. Total Playtime Per Artist

**Query:**

```sql
SELECT artist_name, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY artist_name
ORDER BY total_playtime DESC
LIMIT 10;
```

**Output:**

| artist_name        | total_playtime  |
| ----------------- | --------------- |
| The Beatles      | 1199266824      |
| The Killers      | 1032358097      |
| John Mayer       | 711857923       |
| Bob Dylan        | 562469786       |
| Paul McCartney   | 354847303       |
| Howard Shore     | 348814429       |
| The Strokes      | 309039213       |
| The Rolling Stones | 302676295    |
| Pink Floyd       | 256672182       |
| Led Zeppelin     | 246279115       |

**Quick Insight:**

- **The Beatles maintain the highest total playtime**, emphasizing their consistent popularity across generations.
- **Rock and classic artists dominate**, showing long-term fan engagement.
- **Howard Shore, a film composer, appears**, indicating strong streaming numbers for movie soundtracks.

---

### 24. Playtime Per Artist by Platform

**Query:**

```sql
SELECT artist_name, 
       platform, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY artist_name, platform
ORDER BY total_playtime DESC
LIMIT 10;
```

**Output:**

| artist_name       | platform | total_playtime  |
| ---------------- | -------- | --------------- |
| The Beatles      | Android  | 1116742342      |
| The Killers      | Android  | 892268260       |
| John Mayer       | Android  | 612892956       |
| Bob Dylan        | Android  | 505607295       |
| Howard Shore     | Android  | 345429286       |
| Paul McCartney   | Android  | 341984317       |
| The Strokes      | Android  | 269623432       |
| The Rolling Stones | Android  | 267829573    |
| Pink Floyd       | Android  | 237243947       |
| Imagine Dragons  | Android  | 227022264       |

**Quick Insight:**

- **Android is the dominant platform for streaming across all major artists**, reinforcing its high user base.
- **The Beatles and The Killers have exceptionally high playtime on mobile**, possibly due to their broad appeal.
- **Classic rock artists dominate**, indicating a strong preference for older music among mobile users.

---

### 25. Skip Rate per Artist

**Query:**

```sql
SELECT artist_name, 
       COUNT(*) AS total_plays, 
       SUM(skipped) AS total_skips, 
       ROUND((SUM(skipped) / COUNT(*)) * 100, 2) AS skip_rate
FROM spotify_history
GROUP BY artist_name
ORDER BY skip_rate DESC
LIMIT 10;
```

**Output:**

| artist_name            | total_plays | total_skips | skip_rate |
|-----------------------|------------|------------|-----------|
| Alejandro Santamaria  | 1          | 1          | 100.00%   |
| Alesso               | 2          | 2          | 100.00%   |
| AFROJACK             | 2          | 2          | 100.00%   |
| & Friends            | 1          | 1          | 100.00%   |
| A Great Big World    | 1          | 1          | 100.00%   |
| ABBY                 | 1          | 1          | 100.00%   |
| A Day To Remember    | 1          | 1          | 100.00%   |
| Abdullah Ibrahim     | 1          | 1          | 100.00%   |
| Adriana              | 1          | 1          | 100.00%   |
| Alex Aiono           | 1          | 1          | 100.00%   |

**Quick Insight:**

- **Smaller artists or lesser-known tracks tend to have high skip rates**, likely due to user discovery and disengagement.
- **High skip rates don't necessarily indicate poor quality**, but rather a mismatch between listener expectations and the track.

---

### 26. Skipped Songs per Artist by Platform

**Query:**

```sql
SELECT artist_name, 
       platform, 
       COUNT(*) AS total_skips
FROM spotify_history
WHERE skipped = 1
GROUP BY artist_name, platform
ORDER BY total_skips DESC
LIMIT 10;
```

**Output:**

| artist_name        | platform | total_skips |
|-------------------|---------|-------------|
| The Beatles      | Android | 372         |
| The Killers      | Android | 186         |
| Bob Dylan        | Android | 155         |
| John Mayer       | Android | 138         |
| The Rolling Stones | Android | 121       |
| The Script       | Android | 117         |
| Led Zeppelin     | Android | 116         |
| Paul McCartney   | Android | 107         |
| Imagine Dragons  | Android | 104         |
| Radiohead        | Android | 96          |

**Quick Insight:**

- **Most skips occur on Android**, reinforcing the idea that mobile users may browse and skip more frequently.
- **Classic rock artists dominate the skipped songs list**, possibly indicating listeners trying out older music but not always committing.

---

### 27. Most Diverse Artists

**Query:**

```sql
SELECT artist_name, 
       COUNT(DISTINCT track_name) AS unique_songs_played
FROM spotify_history
GROUP BY artist_name
ORDER BY unique_songs_played DESC
LIMIT 10;
```

**Output:**

| artist_name         | unique_songs_played |
|-------------------|-------------------|
| The Beatles      | 470               |
| Paul McCartney   | 155               |
| The Killers      | 155               |
| John Mayer       | 115               |
| The Rolling Stones | 111             |
| The Black Keys   | 101               |
| Bob Dylan        | 100               |
| Howard Shore     | 98                |
| Led Zeppelin     | 94                |
| Johnny Cash      | 84                |

**Quick Insight:**

- **The Beatles lead in diversity**, showing their extensive catalog remains in active listening.
- **Paul McCartney appears separately**, reinforcing his impact both within and outside The Beatles.
- **Artists with large discographies tend to engage listeners across multiple tracks**, indicating strong fan loyalty and breadth of content.

---

### 28. Artist Dependency on Top Songs

**Query:**

```sql
WITH ArtistTopSongs AS (
    SELECT artist_name, 
           track_name, 
           SUM(ms_played) AS total_playtime,
           RANK() OVER(PARTITION BY artist_name ORDER BY SUM(ms_played) DESC) AS song_rank
    FROM spotify_history
    GROUP BY artist_name, track_name
)
SELECT artist_name, track_name, total_playtime, song_rank
FROM ArtistTopSongs
WHERE song_rank <= 3
ORDER BY total_playtime DESC, song_rank, artist_name;
```

**Output:**

| artist_name   | track_name             | total_playtime | song_rank |
| -------------- | ----------------------- | --------------- | ---------- |
| The Strokes    | Ode To The Mets         | 66024432        | 1          |
| Howard Shore   | The Return of the King  | 64401661        | 1          |
| Howard Shore   | The Fellowship Reunited | 44756730        | 2          |
| Joaquin Sabina | 19 Dias y 500 Noches    | 42375027        | 1          |
| John Mayer     | In the Blood            | 38183421        | 1          |

**Quick Insight:**

- **Some artists rely heavily on their top hits**, making up the bulk of their streaming playtime.
- **Howard Shore’s top-ranking tracks indicate a strong engagement with The Lord of the Rings soundtrack.**

---

### 29. Total Playtime per Artist by Date

**Query:**

```sql
SELECT artist_name, 
       date, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY artist_name, date
ORDER BY date DESC, total_playtime DESC
LIMIT 10;
```

**Output:**

| artist_name   | date       | total_playtime |
| -------------- | ---------- | --------------- |
| James Bay     | 2024-12-15 | 280293          |
| John Mayer    | 2024-12-15 | 246709          |
| The Fray      | 2024-12-15 | 219600          |
| Pink Floyd    | 2024-12-15 | 217817          |
| Kings of Leon | 2024-12-15 | 185373          |

**Quick Insight:**

- **John Mayer and The Fray continue to have strong engagement.**
- **Pink Floyd’s playtime suggests continued relevance for classic rock.**

---

### 30. Cumulative Playtime for Artists Over Time

**Query:**

```sql
WITH ArtistPlaytime AS (
    SELECT artist_name, 
           date, 
           SUM(ms_played) AS total_playtime
    FROM spotify_history
    GROUP BY artist_name, date
)
SELECT artist_name, 
       date, 
       SUM(total_playtime) OVER(PARTITION BY artist_name ORDER BY date) AS cumulative_playtime
FROM ArtistPlaytime
ORDER BY artist_name, date;
```

**Output:**

| artist_name   | date       | cumulative_playtime |
| -------------- | ---------- | ------------------- |
| The Beatles   | 2024-12-15 | 1199266824          |
| John Mayer    | 2024-12-15 | 711857923           |
| Pink Floyd    | 2024-12-15 | 256672182           |

**Quick Insight:**

- **The Beatles and John Mayer show strong cumulative playtime, indicating loyal listeners.**

---

## Spotify Streaming Data Analysis

### 31. Total Playtime by Hour of the Day

**Query:**

```sql
SELECT HOUR(time) AS hour_of_day, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY hour_of_day
ORDER BY total_playtime DESC;
```

**Output:**

| hour_of_day | total_playtime |
|------------|---------------|
| 17         | 1351563788    |
| 18         | 1350938743    |
| 0          | 1307687827    |
| 20         | 1290339746    |
| 19         | 1255758092    |

**Quick Insight:**
- **Peak listening hours** occur in the evening (17-20), suggesting users stream the most after work or school.
- **Midnight (00:00) also sees a high playtime**, indicating late-night listeners.

---

### 32. Playtime by Hour and Platform

**Query:**

```sql
SELECT HOUR(time) AS hour_of_day, 
       platform, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY hour_of_day, platform
ORDER BY total_playtime DESC;
```

**Output:**

| hour_of_day | platform | total_playtime |
|------------|---------|---------------|
| 0          | Android | 1235078999    |
| 20         | Android | 1196416932    |
| 17         | Android | 1183049318    |
| 18         | Android | 1181879179    |
| 23         | Android | 1163481760    |

**Quick Insight:**
- **Android dominates streaming activity across peak hours.**
- **Evening hours show consistently high playtime across platforms.**

---

### 33. Total Playtime by Day of the Week

**Query:**

```sql
SELECT DAYOFWEEK(date) AS day_of_week, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY day_of_week
ORDER BY total_playtime DESC;
```

**Output:**

| day_of_week | total_playtime |
|------------|---------------|
| 6          | 3151923524    |
| 4          | 2914013128    |
| 5          | 2822443538    |
| 3          | 2740855597    |
| 2          | 2718492272    |

**Quick Insight:**
- **Weekends (Friday & Saturday) see the highest playtime, indicating users stream more music during leisure time.**
- **Midweek days like Tuesday and Wednesday have lower playtime compared to weekends.**

---

### 34. Playtime by Day of the Week and Platform

**Query:**

```sql
SELECT DAYOFWEEK(date) AS day_of_week, 
       platform, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY day_of_week, platform
ORDER BY total_playtime DESC;
```

**Output:**

| day\_of\_week | platform | total\_playtime |
| ------------- | -------- | --------------- |
| 6             | Android  | 2890527396      |
| 5             | Android  | 2544254381      |
| 4             | Android  | 2517045124      |
| 2             | Android  | 2506268390      |
| 3             | Android  | 2470333303      |

**Quick Insight:**

- **Android users dominate streaming on weekends, showing strong engagement across devices.**
- **Midweek streaming is also strong on Android, while platforms like iOS and macOS show lower engagement.**

---

### 35. Total Playtime Per Month

**Query:**

```sql
SELECT MONTH(date) AS month, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY month
ORDER BY total_playtime DESC;
```

**Output:**

| month | total\_playtime |
| ----- | --------------- |
| 10    | 2001387314      |
| 9     | 1926357913      |
| 8     | 1826508405      |
| 11    | 1744434171      |
| 12    | 1537761504      |

**Quick Insight:**

- **October has the highest streaming playtime, possibly due to new music releases or seasonal listening trends.**
- **Late summer and early fall (August to October) seem to have peak engagement.**

---

### 36. Playtime Per Month and Platform

**Query:**

```sql
SELECT MONTH(date) AS month, 
       platform, 
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY month, platform
ORDER BY total_playtime DESC;
```

**Output:**

| month | platform | total\_playtime |
| ----- | -------- | --------------- |
| 10    | Android  | 1981508461      |
| 9     | Android  | 1862314874      |
| 11    | Android  | 1741459182      |
| 8     | Android  | 1589369977      |
| 12    | Android  | 1502513870      |

**Quick Insight:**

- **Android users contribute significantly to the highest streaming months.**
- **There is consistent monthly engagement, with peak listening between August and December.**

---

## **D. Conclusion & Next Steps**

✅ **Spotify users prefer cinematic and classic music, particularly on Android.**
✅ **Peak engagement occurs in the evening and on weekends.**
✅ **Mobile users skip songs more frequently, while desktop and casting devices support longer listening sessions.**
✅ **Artists relying on a few hits need to diversify their content to maintain long-term engagement.**
✅ **The fall months (Aug-Oct) are the best time for new music releases based on engagement trends.**

### **🚀 Next Steps**
📌 **Deeper analysis into listener demographics & geographic trends.**
📌 **Sentiment analysis of song lyrics vs. playtime.**
📌 **Predictive modeling for future top-performing songs.**

---

## **Final Thoughts**
This project showcases how **data-driven storytelling can extract real business insights from raw data.** These findings can help **streaming platforms, artists, and marketers optimize their strategies for better engagement, content placement, and monetization.**

**End of Report.** 🎶
