time ./word2vec -train  new_corpus_v4.txt  -output  new_corpus_v4_1024_classes.txt -cbow 1 -size 200 -window 5 -negative 25 -hs 0 -sample 1e-4 -threads 20 -iter 15 -classes 1024
sort new_corpus_v4_1024_classes.txt -k 2 -n > new_corpus_v4_1024_classes.sorted.txt
echo The word classes were saved to file new_corpus_v4_1024_classes.sorted.txt
