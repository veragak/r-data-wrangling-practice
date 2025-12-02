
 #################
 ## Assignment 7 ##
 #################
 
 ## Load data (for GitHub: assume ../data/hot100.RData)
 ## For your original submission you probably had load("hot100.RData")
 load("../data/hot100.RData")
 
 ############################################################
 # QUESTION 1
 # Which song was 10th on the chart? By which artist(s)?
 ############################################################
 
 song_10  <- song_title[[10]]
 artists_10 <- artists[[10]]
 
 song_10
 artists_10
 
 ############################################################
 # QUESTION 2
 # Extract both the main and featured artists for "Let Me Go"
 ############################################################
 
 idx_let_me_go <- which(sapply(song_title, function(x) x == "Let Me Go"))
 
 main_let_me_go     <- main_artists[[idx_let_me_go]]
 featured_let_me_go <- featured_artists[[idx_let_me_go]]
 
 main_let_me_go
 featured_let_me_go
 
 ############################################################
 # QUESTION 3
 # Main artists of the top 5 songs (sublist)
 ############################################################
 
 top5_main_artists <- lapply(main_artists[1:5], identity)
 top5_main_artists
 
 ############################################################
 # QUESTION 4
 # Main artists of songs where peak == current position
 ############################################################
 
 matching_idx <- which(peak_position == current_position)
 peak_eq_current_main <- lapply(main_artists[matching_idx], identity)
 
 peak_eq_current_main
 
 ############################################################
 # QUESTION 5
 # Songs that are new this week and their main artists
 ############################################################
 
 new_idx <- which(is.na(previous_week) | previous_week == 0)
 
 new_songs   <- song_title[new_idx]
 new_artists <- lapply(main_artists[new_idx], identity)
 
 new_songs
 new_artists
 
 ############################################################
 # QUESTION 6
 # How many main artists have songs featuring other artists?
 ############################################################
 
 # Songs that have at least one featured artist
 has_featured <- sapply(featured_artists, function(x) length(x) > 0)
 num_songs_with_features <- sum(has_featured)
 
 num_songs_with_features
 
 ############################################################
 # QUESTION 7
 # Main artists with previous top 5 songs, split into first and second
 ############################################################
 
 # Songs that were in top 5 last week (and had a valid previous_week)
 prev_top5_idx <- which(previous_week > 0 & previous_week <= 5)
 
 prev_top5_main <- main_artists[prev_top5_idx]  # list of character vectors
 
 # First main artist for each song
 first_main_artists <- sapply(prev_top5_main, function(x) x[1])
 
 # Second main artist (if exists), otherwise NA
 second_main_artists <- sapply(prev_top5_main, function(x) {
   if (length(x) >= 2) x[2] else NA_character_
 })
 
 first_main_artists
 second_main_artists
