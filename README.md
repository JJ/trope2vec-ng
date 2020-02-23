# tropes2vec


* [Overview](#overview)
* [Folders](#folders)
   * [data](#data)
   * [iccc20](#iccc20)
   * [images](#images)
   * [scripts](#scripts)
   * [output](#output)
   * [som](#som)
   * [word2vec](*#word2vec)

## Overview

   TV Tropes and Word2vec experiments. 
   In order to execute experiments following packages are required:
   * som_pack 3. 1
     Original package from [a link](http://www.cis.hut.fi/research/som-research/nnrc-programs.shtml) 
     To download original package [a link](http://www.cis.hut.fi/research/som_pak/)
     Original package have an error and it not possible to compile directly. You can use
     [a link](https://github.com/jcarpio/som_pak) repository with error 

  * word2vec
    Original package from https://github.com/tmikolov/word2vec
    Used to create bin file from ngrams 

  * gemsim
    Used in Python script to create tropes vectors 
    

## Folders
   See README.md inside folder for more information.

### data
    * bin
      binary files created with word2vec package

    * csv 
      some data files in csv format

    * excel  
      some excel files (pending to convert to csv)
      
    * gephi  
      ghephi files used to created some graphics

    * json  
      files with downloaded tvtropes info and new json files selecting only some films information

    * txt
      files created from json data like ngrams files, films, tropes, etc.

### iccc20
    Latex files needed 

### images
    Images created to use in latex file

### scripts
    Several scripts to generate ngrams, vectors files, etc.
    
### output
    Output files from scripts like ngram files, bin files models created by work2vec.
    Size of this files are too big to include in repo. Yow can see this files downloading
    latest release file. For example:
    [a link](https://github.com/jcarpio/tropes2vec/releases/download/v0.0.1/tropes2vec.tgz)
    
    Check latest releases.

### som
    Scripts to create som graphics

### word2vec
    scripts to generate bin model files from ngrams file and other word2vec adapted scripts
