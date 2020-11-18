# Spam Ham Message Detector

## Aim:
From given SMS spam collection data identifying which messages are spam or ham 

## Techniques:
- Naïve Bayes classifier
- NLTK

## Procedure:
First, we tokenised all the messages, removed the stop words from them. Then we stemmed each word and removed words that were less than or equal to two characters long. 
Later we implemented it by creating the bag-of-words model from scratch in Python. 
Finally, we used to Naïve Bayes classifier to build the spam detector on top of the bag-of-words model.

## Output:
Model which identifies messages as spam or ham
![](https://github.com/Vishal1478/Data_Science_Portfolio/blob/master/NLP/Spam_ham_Detection/Result.PNG)
