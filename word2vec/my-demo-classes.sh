time ./word2vec -train ngrams_15_taken_9_add_film_name0.txt  -output classes.txt -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -iter 15 -classes 64 -min-count 1
sort classes.txt -k 2 -n > classes_sorted_ngrams_15_taken_9_add_film_name0_min-count_1_num-clusters_64.txt
echo The word classes were saved to file classes_sorted_ngrams_15_taken_9_add_film_name0_min-count_1_num-clusters_64.txt

time ./word2vec -train ngrams_15_taken_9_add_film_name0.txt  -output classes.txt -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -iter 15 -classes 32 -min-count 1
sort classes.txt -k 2 -n > classes_sorted_ngrams_15_taken_9_add_film_name0_min-count_1_num-clusters_32.txt
echo The word classes were saved to file classes_sorted_ngrams_15_taken_9_add_film_name0_min-count_1_num-clusters_32.txt

time ./word2vec -train ngrams_15_taken_9_add_film_name0.txt  -output classes.txt -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -iter 15 -classes 16 -min-count 1
sort classes.txt -k 2 -n > classes_sorted_ngrams_15_taken_9_add_film_name0_min-count_1_num-clusters_16.txt
echo The word classes were saved to file classes_sorted_ngrams_15_taken_9_add_film_name0_min-count_1_num-clusters_16.txt

time ./word2vec -train ngrams_15_taken_9_add_film_name0.txt  -output classes.txt -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e-4 -threads 20 -iter 15 -classes 8 -min-count 1
sort classes.txt -k 2 -n > classes_sorted_ngrams_15_taken_9_add_film_name0_min-count_1_num-clusters_8.txt
echo The word classes were saved to file classes_sorted_ngrams_15_taken_9_add_film_name0_min-count_1_num-clusters_8.txt
