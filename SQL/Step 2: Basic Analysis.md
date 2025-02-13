## 1. Most Played Songs

### Query:
```sql
SELECT track_name,
       SUM(ms_played) AS total_playtime
FROM spotify_history
GROUP BY track_name
ORDER BY total_playtime DESC
LIMIT 10;
```

### Output:
| track_name                                    | total_playtime |
|----------------------------------------------|---------------|
| Ode To The Mets                              | 66,024,432    |
| The Return of the King (feat. Sir James Galway) | 64,401,661    |
| The Fellowship Reunited (feat. Sir James Galway) | 44,756,730    |
| 19 Dias y 500 Noches - En Directo            | 42,375,027    |
| In the Blood                                 | 38,183,421    |
| Claudia's Theme - Version Eight              | 37,120,900    |
| Dying Breed                                  | 36,182,653    |
| The Breaking of the Fellowship (feat. "In Dreams") | 35,990,898    |
| The Road Goes Ever On..., Pt. 1              | 35,236,377    |
| All These Things That I've Done              | 34,247,045    |

---

This query retrieves the top 10 most played songs based on total playtime (sum of milliseconds played). The results indicate the most engaged tracks among users.

---

 

