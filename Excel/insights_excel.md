# 🎵 Spotify Listening Analysis (Excel Insights)

## **1️⃣ Most Played Songs**
✅ **Question:** Which songs have the highest total playtime?

### **📌 Method**
- **Tool Used:** Excel Pivot Table
- **Steps Taken:**
  - Created a Pivot Table:
    - **Rows:** `track_name`
    - **Values:** `Sum of ms_played`
  - Sorted `ms_played` in **descending order**.
  - Filtered **Top 10 Songs**.
  - Created a **Bar Chart** for visualization.

### **📊 Top 10 Most Played Songs**
| Rank | Song Name | Total Playtime (ms) |
|------|----------|---------------------|
| 1 | Ode To The Mets | 67,431,580 |
| 2 | The Return of the King (feat. Sir James Galway, Viggo Mortensen and Renée Fleming) | 64,401,661 |
| 3 | The Fellowship Reunited (feat. Sir James Galway, Viggo Mortensen and Renée Fleming) | 44,756,730 |
| 4 | 19 Dias y 500 Noches - En Directo | 42,914,042 |
| 5 | In The Blood | 38,427,087 |
| 6 | Claudia’s Theme - Version Eight | 37,120,900 |
| 7 | Dying Breed | 36,182,653 |
| 8 | The Breaking of the Fellowship (feat. "In Dreams") | 35,990,898 |
| 9 | All These Things That I’ve Done | 35,759,415 |
| 10 | Caution | 35,619,945 |

### **📈 Visualization**
![Most Played Songs](images/most_played_songs.png)

### **🔍 Observations**
- "Ode To The Mets" is the **most played song**, with **67M milliseconds** of total playtime.
- Movie soundtracks (e.g., *Lord of the Rings* tracks) dominate the **top spots**.
- Rock & alternative songs (*The Killers, The Strokes*) have high engagement.

## **2️⃣ Most Played Artists**
✅ **Question:** Which artists have the highest total playtime?

### **📌 Method**
- **Tool Used:** Excel Pivot Table
- **Steps Taken:**
  - Created a Pivot Table:
    - **Rows:** `artist_name`
    - **Values:** `Sum of ms_played`
  - Sorted `ms_played` in **descending order**.
  - Filtered **Top 10 Artists**.
  - Created a **Bar Chart** for visualization.

### **📊 Top 10 Most Played Artists**
| Rank | Artist Name | Total Playtime (ms) |
|------|------------|---------------------|
| 1 | The Beatles | 1,210,184,552 |
| 2 | The Killers | 1,059,556,516 |
| 3 | John Mayer | 725,219,443 |
| 4 | Bob Dylan | 569,456,936 |
| 5 | Paul McCartney | 357,354,370 |
| 6 | Howard Shore | 348,930,675 |
| 7 | The Strokes | 317,508,419 |
| 8 | The Rolling Stones | 307,917,009 |
| 9 | Pink Floyd | 260,531,842 |
| 10 | Led Zeppelin | 248,338,279 |

### **📈 Visualization**
![Most Played Artists](images/most_played_artists.png)

### **🔍 Observations**
- **The Beatles** have the highest total playtime, making them the most popular artist in this dataset.
- **The Killers & John Mayer** follow closely behind.
- **Howard Shore’s presence** suggests a strong interest in soundtracks (*Lord of the Rings*).
- Rock and alternative bands dominate the **top 10**.


## **3️⃣ Top 10 Most Skipped Songs**
✅ **Question:** Which songs get skipped the most?

### **📌 Method**
- **Tool Used:** Excel Pivot Table
- **Steps Taken:**
  - Created a Pivot Table:
    - **Rows:** `track_name`
    - **Values:** `Count of skipped_boolean`
  - Sorted `skipped_boolean` in **descending order**.
  - Filtered **Top 10 Skipped Songs**.
  - Created a **Bar Chart** for visualization.

### **📊 Top 10 Most Skipped Songs**
| Rank | Song Name                                     | Skip Count |
|------|-----------------------------------------------|------------|
| 1    | The Boxer                                     | 135        |
| 2    | Come Together - Remastered 2009              | 137        |
| 3    | Concerning Hobbits                           | 142        |
| 4    | All These Things That I've Done               | 142        |
| 5    | For What It's Worth                           | 146        |
| 6    | 19 Dias y 500 Noches - En Directo             | 148        |
| 7    | Caution                                       | 164        |
| 8    | Dying Breed                                   | 166        |
| 9    | In the Blood                                  | 181        |
| 10   | Ode To The Mets                               | 207        |

### **📈 Visualization**
![Most Skipped Songs](images/most_skipped_songs.png)

### **🔍 Observations**
- **"Ode To The Mets"** is the **most skipped song**, but it still ranks as one of the most played songs.
- Several songs with **high skips** still remain popular in terms of playtime, suggesting listeners might not finish them.
- **"Caution"** and **"The Boxer"** are among the more frequently skipped tracks.

