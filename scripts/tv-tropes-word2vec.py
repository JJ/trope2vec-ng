import sys
from gensim.test.utils import common_texts, get_tmpfile
from gensim.models import Word2Vec, KeyedVectors

# examples: https://rare-technologies.com/word2vec-tutorial/

model =  KeyedVectors.load_word2vec_format('ngrams_15_taken_9_vectors.bin', binary= True)

# vector = model.wv['ElegantClassicalMusician']

# print(vector)

path = './output/tropes_set_15_taken_9.txt'
tropes_file = open(path,'r')

for trope_line in tropes_file:
   if trope_line.rstrip() in model.vocab:
      vector = model.wv[trope_line.rstrip()]
      if len(vector) == 200:
         # print(len(vector))  # vector length 200
         print(*vector)
         print(trope_line.rstrip())
#   else:
      # print("not in vocab " + trope_line.rstrip())  
