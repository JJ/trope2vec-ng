## scripts

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
