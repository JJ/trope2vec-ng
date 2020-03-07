# Following instructions from this website
# https://machinelearningmastery.com/develop-word-embeddings-python-gensim/ 

from sklearn.decomposition import PCA
from matplotlib import pyplot
import gensim.models.keyedvectors as word2vec
model = word2vec.KeyedVectors.load_word2vec_format('new_corpus_v3.bin', binary=True)

# define training data
sentences = [['this', 'is', 'the', 'first', 'sentence', 'for', 'word2vec'],
			['this', 'is', 'the', 'second', 'sentence'],
			['yet', 'another', 'sentence'],
			['one', 'more', 'sentence'],
			['and', 'the', 'final', 'sentence']]
# train model
# model = Word2Vec(sentences, min_count=1)
# fit a 2d PCA model to the vectors
X = model[model.wv.vocab]
pca = PCA(n_components=2)
result = pca.fit_transform(X)
# create a scatter plot of the projection
pyplot.scatter(result[:, 0], result[:, 1])
# words = list(model.wv.vocab)

words_c1024_0 = ['shrinkingviolet_deadpoetssociety',
         'visualpun_batmanreturns',
         'visualpun_brucealmighty', 
         'visualpun_crocodiledundee',
         'visualpun_deadpoetssociety',
         'visualpun_diamondsareforever',
         'visualpun_herbieridesagain',
         'visualpun_ironman3',
         'visualpun_lethalweapon2',
         'visualpun_marypoppins',
         'visualpun_nationaltreasure',
         'visualpun_octopussy',
         'visualpun_pulpfiction',
         'visualpun_silentmovie',
         'visualpun_skyfall',
         'visualpun_teenagemutantninjaturtles',
         'visualpun_thedarkknightrises',
         'visualpun_thefifthelement',
         'visualpun_thelovebug',
         'visualpun_themask',
         'visualpun_themuppetmovie',
         'visualpun_tradingplaces', 
         'visualpun_whoframedrogerrabbit',
         'visualpun_youngfrankenstein']

words_c1024_36 = ['ambiguouslybrown',
         'archenemy',
         'callforward',
         'creativeclosingcredits',
         'ihaveyounowmypretty',
         'ironman3',
         'redeyestakewarning',
         'shipperondeck',
         'startofdarkness',
         'superpowermeltdown',
         'supersoldier']

for i, word in enumerate(words_c1024_36):
	pyplot.annotate(word, xy=(result[i, 0], result[i, 1]))
pyplot.show()
