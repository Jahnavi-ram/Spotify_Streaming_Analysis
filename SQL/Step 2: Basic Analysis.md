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


