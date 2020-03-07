# Files related to artificial corpus created based on tropes and films relationships and reinforcement based on film votes from IMDB blocbusters films and tropes ranking based on frequently used trope.
  Division factors used to create this corpus $film_div_factor = 100000 and $trope_div_factor = 100
  Script to generate corpus with arguments
  ./create-corpus-top.pl tvtropes.json films-836-imdb-filtered-with-top-tropes.txt 836-imdb-blockbuster-films-with-votes all-tropes-ranking.csv



## -rw-rw-r-- 1 enkire enkire     6646 Mar  7 09:47 836-imdb-blockbuster-films-with-votes-filtered.txt
    list of 836 blockbuster films from IMDB filtered with films that appear in films section from tvtropes.org and with same name 

## -rw-rw-r-- 1 enkire enkire    19400 Mar  7 09:48 836-imdb-blockbuster-films-with-votes.txt
    list of 836 blockbuster films from IMDB

## -rw-rw-r-- 1 enkire enkire   489253 Mar  7 09:47 all-tropes-ranking.csv
    all tropes with sort by number of times the trope has been used in a film

## -rw-rw-r-- 1 enkire enkire     9266 Mar  7 09:44 films-836-imdb-filtered-with-top-tropes.txt
   836 blockbuster films and its most popular trope include in tvtropes.org    

## -rw-rw-r-- 1 enkire enkire   444493 Mar  7 09:50 new-corpus-accuracy-check-list-10000.txt
   10000 lines accuracy check list created using films-836-imdb-filtered-with-top-tropes.txt where each film is linked with its top trope  

## -rw-rw-r-- 1 enkire enkire   129292 Mar  7 09:50 new-corpus-accuracy-check-list-3000.txt
   3000 lines accuracy check list created using films-836-imdb-filtered-with-top-tropes.txt where each film is linked with its top trope
   
## -rw-rw-r-- 1 enkire enkire 48242739 Mar  7 09:31 new_corpus_v3.bin
   binary files with embedding vectors

## -rw-rw-r-- 1 enkire enkire 24487024 Mar  7 09:31 new_corpus_v3.txt
   artifically created corpus in plain text

## -rw-rw-r-- 1 enkire enkire   856403 Mar  7 09:31 new_corpus_v3_1024_classes.sorted.txt
   entities sorted grouped in 1024 clusters and sç
  
## -rw-rw-r-- 1 enkire enkire   856403 Mar  7 09:31 new_corpus_v3_1024_classes.txt
   entities grouped in 1024 clusters

## -rw-rw-r-- 1 enkire enkire   831209 Mar  7 09:31 new_corpus_v3_128_classes.sorted.txt
   entities grouped in 128 clusters   

## -rw-rw-r-- 1 enkire enkire   831209 Mar  7 09:31 new_corpus_v3_128_classes.txt
    entities grouped in 128 clusters

## -rw-rw-r-- 1 enkire enkire   844827 Mar  7 09:31 new_corpus_v3_256_classes.sorted.txt
    entities grouped in 256 clusters

## -rw-rw-r-- 1 enkire enkire   844827 Mar  7 09:31 new_corpus_v3_256_classes.txt
    entities grouped in 256 clusters

## -rw-rw-r-- 1 enkire enkire   852524 Mar  7 09:31 new_corpus_v3_512_classes.sorted.txt
    entities grouped in 512 clusters

## -rw-rw-r-- 1 enkire enkire   852524 Mar  7 09:31 new_corpus_v3_512_classes.txt
    entities grouped in 512 clusters

## -rw-rw-r-- 1 enkire enkire   823185 Mar  7 09:31 new_corpus_v3_64_classes.sorted.txt
    entities grouped in 64 clusters

## -rw-rw-r-- 1 enkire enkire   823185 Mar  7 09:31 new_corpus_v3_64_classes.txt
    entities grouped in 63 clusters

## -rw-rw-r-- 1 enkire enkire     2036 Mar  7 09:31 new_corpus_v3_classes_execution_time.txt
    execution time 
 
## -rw-rw-r-- 1 enkire enkire      209 Mar  7 09:31 new_corpus_v3_execution_time.txt
    execution time
