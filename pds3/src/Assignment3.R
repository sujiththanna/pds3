install.packages("tidytext")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("wordcloud")
install.packages("tm")
install.packages("SnowballC")
install.packages("stopwords")


library(tidytext)
library(dplyr)
library(ggplot2)
library(wordcloud)
library(tm)
library(SnowballC)
library(stopwords)
library(readr)
Corona_NLP_test <- read_csv("Corona_NLP_test.csv")
View(Corona_NLP_test)

tokens <- Corona_NLP_test %>% 
  unnest_tokens(word, OriginalTweet) 

tokens_sw_removed <- tokens %>%
  anti_join(stop_words)


word_freq <- tokens_sw_removed %>%
  count(word, sort = TRUE)

set.seed(1000)
wordcloud(words = word_freq$word, freq = word_freq$n, max.words = 500, random.order =FALSE, colors = brewer.pal(8, "BrBG"))
