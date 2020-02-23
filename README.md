# tropes2vec


* [Overview](#overview)
* [Folders](#folders)
   * [data](#data)
   * [iccc20](#iccc20)
   * [images](#images)
   * [scripts](#scripts)
   * [som](#som)
   * [word2vec](*#word2vec)

## Overview

   TV Tropes and Word2vec experiments. 
   In order to execute experiments following packages are required:
   * som_pack 3. 1
     Original package from http://www.cis.hut.fi/research/som-research/nnrc-programs.shtml 
     To download original package http://www.cis.hut.fi/research/som_pak/
     Original package have an error and it not possible to compile directly. You can use
     https://github.com/jcarpio/som_pak repository with error 

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

### som
    Scripts to create som graphics

### word2vec
    scripts to generate bin model files from ngrams file and other word2vec adapted scripts
