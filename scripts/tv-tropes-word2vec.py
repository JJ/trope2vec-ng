##
# Script to generate pairs of trope_name and 200_dim_associated_vector 
#

import sys
from gensim.test.utils import common_texts, get_tmpfile
from gensim.models import Word2Vec, KeyedVectors

# examples: https://rare-technologies.com/word2vec-tutorial/

model =  KeyedVectors.load_word2vec_format('ngrams_15_taken_9_vectors_add_film_name0_min-count_5.bin', binary= True)

# vector = model.wv['ElegantClassicalMusician']

# print(vector)

# path to file with trope sub-set 
path = 'tropes_set_15_taken_9.txt'
tropes_file = open(path,'r')
f= open("errors_tropes_set_15_taken_9_min-count_5.txt","w+")

for trope_line in tropes_file:
   trope_line = trope_line.lower()
   if trope_line.rstrip() in model.vocab:
      vector = model.wv[trope_line.rstrip()]
      if len(vector) == 200:
         # print(len(vector))  # vector length 200
         print(trope_line.rstrip(), end = ' ')
         print(*vector)
   else:
      f.write("not in vocab %s\n" % trope_line.rstrip())  

f.close()
tropes_file.close()
