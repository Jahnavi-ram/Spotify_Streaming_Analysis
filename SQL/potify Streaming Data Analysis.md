# **Spotify Streaming Data Analysis: Business Insights & SQL Implementation**

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

### **1. Most Played Songs**

#### **SQL Query:**
```sql
SELECT track_name,
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY track_name
ORDER BY total_playtime DESC
LIMIT 10;
```

#### **Quick Insights:**
- **"Ode To The Mets"** has the highest total playtime, indicating strong listener retention.
- **Cinematic & storytelling-driven songs** dominate top charts, suggesting long-duration plays.

---

### **2. Skip Rate per Platform**

#### **SQL Query:**
```sql
SELECT platform,
       SUM(ms_played) AS total_playtime,
       SUM(skipped) AS total_skips,
       ROUND((SUM(skipped) / COUNT(*)) * 100, 2) AS skip_rate
FROM spotify_history
GROUP BY platform
ORDER BY total_playtime DESC;
```

#### **Quick Insights:**
- **Android users have the highest total playtime but also skip the most.**
- **Windows users have the highest skip rate (14.07%),** indicating possible dissatisfaction with platform experience.

---

### **3. Peak Streaming Hours**

#### **SQL Query:**
```sql
SELECT HOUR(time) AS hour_of_day,
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY hour_of_day
ORDER BY total_playtime DESC;
```

#### **Quick Insights:**
- **Evening hours (5 PM - 8 PM) see the highest engagement.**
- **A secondary peak is observed at midnight, likely due to late-night passive listening.**

---

### **4. Total Playtime Per Month**

#### **SQL Query:**
```sql
SELECT MONTH(date) AS month,
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY month
ORDER BY total_playtime DESC;
```

#### **Quick Insights:**
- **October sees the highest playtime, likely due to seasonal music trends and major releases.**
- **Engagement remains high from August to December, aligning with holiday playlists.**

---

## **D. Conclusion & Final Thoughts**

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

# **End of Report.** 🎶

