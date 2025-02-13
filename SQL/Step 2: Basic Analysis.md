## Spotify Streaming Data Analysis

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

