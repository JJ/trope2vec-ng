Scripts in directory are modifications to original scripts from https://github.com/tmikolov/word2vec
in order to execute any of them you have to install and compile word2vec package


- my-demo-classes.sh : 

  create a file with clusters from corpus file. To generate corpus file file tvtropes.json is needed and
  execute scripts/tvtropes.pl   

- my-demo-word.sh  
  This file is based in demo-word.sh from word2vec Mikolov package and modified to create bin file model
  to create different bin files is needed to change input file, output file and some parameters
  I our case -min-count was added and tested with 1, 3 o 5 value. min-count parameter filter words
  that appear less than min-count value

- questions-phrases.txt  
  this is a copy of original questions-phrases.txt form word2vec mikolov package and are included here
  because we use a part of in paper
