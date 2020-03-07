# Following instructions from this website
# https://machinelearningmastery.com/develop-word-embeddings-python-gensim/ 

# from gensim.models import Word2Vec

from sklearn.decomposition import PCA

import gensim.models.keyedvectors as word2vec
model = word2vec.KeyedVectors.load_word2vec_format('new_corpus_v3.bin', binary=True)

# model = Word2Vec.load('new_corpus_v3.bin', binary=True)

X = model[model.wv.vocab]

pca = PCA(n_components=2)
result = pca.fit_transform(X)


pyplot.scatter(result[:, 0], result[:, 1])


