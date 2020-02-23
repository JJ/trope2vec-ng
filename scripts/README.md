- tvtropes.pl 
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


- word2vec-words.pl
  execute word2vec algorithm 
  word2vec-word.pl <max_tropes> <ngram_size> <inc_film_name>
  launch word2vec for a certain ngram file with max_tropes ngram_size and inc_film_name 
  created previously with with tvtropes.pl
