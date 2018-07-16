library(tidyverse)
library(CortyKit)

tourneys <- read_csv(file = 'csv/1_tournaments/tournaments_1877-2017_UNINDEXED.csv',
                     col_names = read_lines(file = 'csv/1_tournaments/tournaments_column_titles.txt'))

tourneys
tourneys %>% glimpse()
tourneys$tourney_order %>% table()
tourneys$tourney_name %>% table() %>% sort()
tourneys$tourney_slug %>% table() %>% sort()
tourneys$tourney_fin_commit %>% table()

tourneys %>% 
    filter(tourney_year >= 1968) %>% 
    into(oe_tourneys)



read_csv(file = 'csv/2_match_scores/match_scores_1968-1990_UNINDEXED.csv',
         col_names = read_lines(file = 'csv/2_match_scores/match_scores_column_titles.txt')) %>% 
    glimpse() %>% 
    into(match_scores_68_90)

read_csv(file = 'csv/2_match_scores/match_scores_1991-2016_UNINDEXED.csv',
         col_names = read_lines(file = 'csv/2_match_scores/match_scores_column_titles.txt')) %>% 
    glimpse() %>% 
    into(match_scores_91_16)


bind_rows(match_scores_68_90, match_scores_91_16) %>% 
    glimpse() %>% 
    into(match_scores)


read_csv(file = 'csv/3_match_stats/match_stats_1991-2016_UNINDEXED.csv',
         col_names = read_lines('csv/3_match_stats/match_stats_column_titles.txt'))%>% 
    glimpse() %>% 
    into(match_stats)

read_rankings_year <- function(year) {
    read_csv(file = paste0('csv/4_rankings/rankings_', year, '.csv'),
             col_names = read_lines(file = 'csv/4_rankings/rankings_column_titles.txt'),
             col_types = 'ciiiciiciiiccc')
}
lapply(X = 1991:2016, FUN = read_rankings_year) %>% 
    bind_rows() %>% 
    glimpse() %>% 
    # filter(ranking_points < 2000) %>% 
    into(rankings)

rankings$ranking_points %>% hist

rankings %>% 
    arrange(desc(ranking_points)) %>% 
    select(week_year, ranking_points, player_slug) %>% 
<<<<<<< HEAD
    print(n = 40)
=======
    print(n = 70)
>>>>>>> 6e3acae9d48317fb0b0eac27e25413bd876c08fe

read_csv(file = 'csv/5_players/player_overviews_UNINDEXED.csv',
         col_names = read_lines(file = 'csv/5_players/player_overviews_column_titles.txt')) %>% 
    glimpse() %>% 
    into(players)
<<<<<<< HEAD



match_scores %>% glimpse()
=======
>>>>>>> 6e3acae9d48317fb0b0eac27e25413bd876c08fe
