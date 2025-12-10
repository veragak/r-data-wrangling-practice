# Assignment 07 — Billboard Hot 100 List Manipulation

This assignment works with the Billboard Hot 100 chart data stored in 
`hot100.RData`. The data are provided as several aligned vectors and lists 
(e.g. song titles, artists, chart positions, and separate main/featured artist 
lists). Each position in these objects corresponds to one song on the chart.

The goal is to practice **base R list and vector operations** such as indexing, 
subsetting, `which()`, `lapply()`, and simple logical conditions.

All task descriptions below are rewritten for this repository and do not contain 
original course material.

---

## Tasks Covered

### **1. Identify the song and artist at position 10**

- Retrieve the 10th song in the chart.
- Retrieve all artists associated with that song.

---

### **2. Main vs. featured artists for a specific song**

- Locate the song `"Let Me Go"`.
- Extract its main artists and featured artists from the corresponding lists.

---

### **3. Main artists of the top 5 songs**

- Create a sublist containing only the **main artists** of the **top 5** songs 
  on the chart.

---

### **4. Main artists whose peak equals current position**

- Find songs for which the **peak position equals the current position**.
- Create a sublist with the main artists of these songs.

---

### **5. New entries on the chart**

- Identify songs that are **new** on the chart this week (no valid previous 
  position).
- Extract both the song titles and their main artists for these new entries.

---

### **6. How many songs feature other artists?**

- Count how many songs have **featured artists** in addition to main artists
  (based on the list structures provided in the data).

---

### **7. Main artists with previous top 5 songs**

- Among the songs that were in the **top 5 in the previous week**, extract 
  the main artists.
- Separate them into two vectors:
  - **first_main_artist** (always present)
  - **second_main_artist** (if a second main artist exists, otherwise `NA`)

This is done using the `main_artists` list instead of splitting strings, so that
artists like `"Artist A & Artist B Featuring C"` are correctly treated as 
two separate main artists (A and B), not as a single combined name.

---

## Files

- `Assignment7.R` — original script name required for submission  
- `assignment07_hot100.R` — cleaned script for this repository  
- The dataset used in this project cannot be shared due to course policies
- `README.md` — this documentation  

---

## How to Run

1. Place `hot100.RData` inside a shared `data/` folder in the repository root.  
2. In `assignment07_hot100.R`, the dataset is loaded with:

   ```r
   load("../data/hot100.RData")
   ```
3. Run the script in R or RStudio.
4. The answers to each question are printed to the console.

---

## Packages

This assignment uses only base R, as required: 
- No external packages are needed.
