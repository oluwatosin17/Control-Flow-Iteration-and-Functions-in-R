---
  title: 'Guided Project: Creating An Efficient Data Analysis WorkFlow'
author: "Tosin"
date: "7/28/2019"
output: html_document
---
  #In this project we will acting as a data analyst that sells books for learning programming
  
print(a)
library(readr)
library(dplyr)
book_reviews <- read.csv("book_reviews.csv")
View(book_reviews) 


input_vector <- c("first","second","third")
for (input in input_vector){
  print(input)
}
condition_met <- T
if(condition_met){
  print("This branch runs because the conditional operator was true")}else{
  print("This branch runs because the conditional operator was false")
}

vector_with_duplicates <- c(1,1,1,2,2,3,3,3,3)
unique(vector_with_duplicates)

dim(book_reviews)
# We check how many rows and columns
#2000 rows and 4 columns

colnames(book_reviews)

for(b in colnames(book_reviews)){
  print(typeof(book_reviews[[b]]))
}
# What are the types of the column

for(b in colnames((book_reviews))){
  print(unique(book_reviews[[b]]))
}

#What the unique values present in each of the columns

#Handling Missing Data

example_dataset <- tibble(
  x = c(1,2,3,4,5),
  y = c(6,7,8,NA,10)
)
filtered_example <- example_dataset %>% filter(!(is.na(y)))
filtered_example

null <- for(b in colnames(book_reviews)){
  print(sum(is.na(book_reviews[[b]])))
}

reviews <- book_reviews %>% filter(!(is.na(book_reviews[["review"]])))
View(reviews)

null <- for(b in colnames(reviews)){
  print(sum(is.na(reviews[[b]])))
}
dim(reviews)
dim(book_reviews)
# We removed 206 rows containing null data I don't think it would have that much effect on our findings 

#Dealing with Inconsistent Labels
unique(reviews["state"])
reviews <- reviews %>% mutate(consistent_state = case_when(
  state == "TX" ~ "Texas",
  state == "NY" ~ "New York",
  state == "FL" ~ "Florida",
  state == "CA" ~ "California",
  state == "Texas" ~ "Texas",
  state == "New York" ~ "New York",
  state == "Florida" ~ "Florida",
  state == "California" ~ "California"
  
))
View(reviews)
unique(reviews["consistent_state"])
typeof(reviews[["consistent_state"]])

c <- reviews
c$state <- as.character(c$state)
c$state[c$state == "CA"]<- "California"
c$state[c$state == "TX"]<- "Texas"
c$state[c$state == "NY"]<- "New York"
c$state[c$state == "FL"]<- "Florida"
View(c)

unique(c$state)


#Transforming The Review Data
reviews <- reviews %>% mutate(reviews_num = case_when(
  review == "Poor" ~ 1,
  review == "Fair" ~ 2,
  review == "Good" ~ 3,
  review == "Great" ~ 4,
  review == "Excellent" ~ 5,
))
 
View(reviews)

reviews <- reviews %>% mutate(is_high_review = if_else(reviews$reviews_num >= 4,T,F))

#Analyzing the Data
reviews %>% group_by(book) %>% summarise(purchased = n())%>% arrange(-purchased)
# the summary function used was n() to find the count for each group
# The most purchased book is "Fundamentals of R For Beginners " hence the most profitable book

                  