Data Science Capstone Project
========================================================
author: E. Manton
date: March 18, 2018
autosize: true

Predicting Text using Ngrams and The Katz Backoff Model, 
Sponsored by 
+ Coursera
+ Johns Hopkins Bloomberg School of Public Health
+ Swiftkey

Project Goals
========================================================

The challenge was to develop an application that would predict the next word in a phrase that the user inputs from, for example, a mobile text application.  The requirements were that the project be:

- lightweight, to preserve device resources
- based on principles of Natural Language Processing
- intuitive user interface design

Data
========================================================
The corpora, provided by **Swiftkey**, was publicly available and collected by a web crawler.  Four data sets were available; our application uses the English dataset only.  The data was taken from random **news articles, blog posts, and twitter feeds**.  

For use in this project, it was necessary to clean the data, removing extraneous punctuation, excessive whitespace, profanity, and other non-text elements.  The portion of the data was then **tokenized into ngram tables**.

Algorithm
========================================================

The algorithm used was The **Katz Backoff Model**.  This model will predict the probability of a word being the next one chosen by a user inputting text by comparing what has already been entered against a set of **ngrams - quadgrams, trigrams, and bigrams**.

If a match is not found by comparing a four word phrase to a set of quadgrams, the last three words of user input would then be used against a set of trigrams, and so on, in essence **"backing off"** until an appropriate next word prediction is found.

The entire code base for this project, with details about the algorithm implementation, can be found in my github repository:
https://github.com/eileen98034/Capstone

User Interface
========================================================
The user interface was designed to be easy and intuitive.  The user simply enters a word or phrase in the text box, and suggested next words will appear below it.  Instructions are provided in the left sidebar to ensure a smooth user experience. 


![Next Word Prediction](Capstone.jpg)

Please try it out at: **https://eileen98034.shinyapps.io/ShinyApplication/**
