## scripts

## -rwxrwxr-x 1 enkire enkire      212 Feb 20 19:51 convert_tropes_file.pl

## -rwxrwxr-x 1 enkire enkire     3492 Mar  7 10:04 create-corpus-top.pl
   script to create corpus based on tropes ranking, most popular trope for each film and film votes from IMDB blockbuster films
   
## -rwxrwxr-x 1 enkire enkire     1291 Mar  6 15:21 create-list-accuracy.pl
   Usage: create-list-accuracy.pl <json_file> <top_films> <tropes_ranking_file>
   This script create a file with all pairs <film_name> <trope_name> included in input file tvtropes.json

## -rwxrwxr-x 1 enkire enkire     1120 Mar  2 20:39 create-subset-15-ranking.pl
   Usage: create-subset-15-ranking.pl <all-films-ranking> <15-subset-sort>
   Create a list of pairs trope and rankig value from a subset of tropes
   
## -rwxrwxr-x 1 enkire enkire      507 Mar  4 09:02 filter-films-imdb-with-votes.pl
    script that check if film have an equivalent in section film from tvtropes.org
ç
## -rwxrwxr-x 1 enkire enkire     1273 Mar  6 15:41 get-accuracy-check-list.pl
   Usage: get-accuracy-check-list.pl <top-rank-films-with-tropes>

   Create checking list with following format:
  <film1> <top_trope_film1> <film2> <top_trope_film2>
  <film1> <top_trope_film1> <film3> <top_trope_film3>
  <film1> <top_trope_film1> <film4> <top_trope_film4>
  <film2> <top_trope_film2> <film1> <top_trope_film1>
  <film2> <top_trope_film2> <film3> <top_trope_film3>
  <film2> <top_trope_film4> <film1> <top_trope_film4>
  <film3> <top_trope_film3> <film1> <top_trope_film1>

## -rwxrwxr-x 1 enkire enkire     3612 Mar  6 15:56 get-list-most-popular-tropes-by-film.pl
  Usage: get-list-most-popular-tropes-by-film.pl <json_file> <tropes_ranking_file> <top-rank-films>
  create a list with film name and its associated top trope from tvtropes.org

## -rwxrwxr-x 1 enkire enkire     1005 Feb 23 19:36 tv-tropes-word2vec.py
    Script to generate pairs of trope_name and 200_dim_associated_vector
    
## -rwxrwxr-x 1 enkire enkire     3820 Feb 23 19:18 tvtropes.pl

  take downloaded json file from tvtropes and generate this files:
  - films.txt
    all films names with trope number for each film

  - films_<max_tropes>_taken_<ngram_size>.txt
    films with nummber of tropes between max_tropes and 2 tropes

  - less_than_<max_tropes>_taken_<ngram_size>.json
    new json only with films with trope number between max_tropes and 2 tropes

  - ngrams_15_taken_9_add_film_name0.txt
    corupus with string composed by combinations of tropes from films with
    <max_tropes> tropes
    taken form <ngram_size> to <ngram_size> and tropes from films with less than
    <ngram_size> tropes and greather than 1

   - tropes_set_<max_tropes>_taken_<ngram_size>.txt
    tropes from films with number of tropes between <max_tropes> and 2

## -rwxrwxr-x 1 enkire enkire     1193 Feb 26 10:19 tvtropes_pairs_tropes_films.pl
   This script create a file with all pairs <film_name> <trope_name> included in input file tvtropes.json
  the result don't filter repeated pairs.

## -rwxrwxr-x 1 enkire enkire     1179 Feb 22 22:45 word2vec-words.pl
   This script create a file with all pairs <film_name> <trope_name> included in input file tvtropes.json
  the result don't filter repeated pairs.

# tv-tropes-word2vec.py  
  Script to generate pairs of trope_name and 200_dim_associated_vector  
  This script use two files: bin model file and sub set tropes file
  
  The script create an error file with tropes that are not in vocabulary
  In standart output print trope name followed by space separate components of 200 dim vector

# convert_tropes_file.pl  

# create-subset-15-ranking.pl
  The script take two files, first one files with all tropes with ranking and a second file with a subset of tropes without ranking.
  The subset of tropes are in ranking order because was created in excel with and advanced filter selecting only sub set tropes from
  all tropes ranked list. The output is a file with a subset of tropes and the ranking taked from all tropes ranking.

# filter-films-imdb-with-votes.pl
  Script that take a copy from IMDB blockbuster films list with votes and filter name and votes 
  usage
  cat 1-to-844-films-imdb-with-votes.txt | perl -d ./filter-films-imdb-with-votes.pl > imdb-blockbuster-films-with-votes.txt

# tv-tropes-word2vec.py
  Script to generate pairs of trope_name and 200_dim_associated_vector

# tvtropes.pl
  take downloaded json file from tvtropes and generate this files:
  - films.txt
    all films names with trope number for each film

  - films_<max_tropes>_taken_<ngram_size>.txt
    films with nummber of tropes between max_tropes and 2 tropes

  - less_than_<max_tropes>_taken_<ngram_size>.json
    new json only with films with trope number between max_tropes and 2 tropes

  - ngrams_15_taken_9_add_film_name0.txt
    corupus with string composed by combinations of tropes from films with
    <max_tropes> tropes
    taken form <ngram_size> to <ngram_size> and tropes from films with less than
    <ngram_size> tropes and greather than 1

   - tropes_set_<max_tropes>_taken_<ngram_size>.txt
    tropes from films with number of tropes between <max_tropes> and 2

# tvtropes_pairs_tropes_films.pl  
  This script create a file with all pairs <film_name> <trope_name> included in input file tvtropes.json
  the result don't filter repeated pairs. 

# word2vec-words.pl
  execute word2vec algorithm
  word2vec-word.pl <max_tropes> <ngram_size> <inc_film_name>
  launch word2vec for a certain ngram file with max_tropes ngram_size and inc_film_name
  created previously with with tvtropes.pl
