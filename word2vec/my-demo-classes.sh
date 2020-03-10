time ./word2vec -train ngrams_15_taken_9_add_film_name1.txt  -output ngrams_15_taken_9_add_film_name1_1024_classes.txt -cbow 1 -size 200 -window 5 -negative 25 -hs 0 -sample 1e-4 -threads 20 -iter 15 -classes 1024
sort ngrams_15_taken_9_add_film_name1_1024_classes.txt -k 2 -n > ngrams_15_taken_9_add_film_name1_1024_classes.sorted.txt
echo The word classes were saved to file ngrams_15_taken_9_add_film_name1_1024_classes.sorted.txt
