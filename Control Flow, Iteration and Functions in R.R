---
  title: "Control Flow, Iteration and Functions in R"
author: "Tosin"
date: "7/27/2019"
output: html_document
---

# The If statement
major <- "Engineer"

if(major == "Engineer") {print("This person majored in Engineering.")} else {"This person did not major in Engineering"}
view(recent_grads)

if(nrow(recent_grads) > 1000){data_size = "Large"} else{data_size = "Small"}
data_size

#The if_else() function
new_recent_grads <- recent_grads %>% mutate( is_engineering = if_else(Major_category == "Engineering",TRUE,FALSE))
view(new_recent_grads)
new_recent_grads <- recent_grads %>% mutate(median_level = if_else( Median > 50000,"Above Average","Below Average")) %>% mutate(greater_prop_gender = if_else(Women > Men,"Women","Men"))

#Moving Beyond Two Branches
if(color == "Green"){purchase <- T}else if(color == "Yellow"){purchase <- F}else if(color == "Red"){purchase <- F}else{purchase <- F}
color <- "Green"
purchase

wpm <- 70
if(wpm < 58){classification <- "Below Average"}else if(wpm >82){classification <- "Above Average"}else{classification <- "Average"}
classification


#Using Multiple conditions
x <- 7
x>5 && x<10
y <- 7
y>5 || y<10

wpm <- 70
if(between(wpm,68,82)){classification <- "Average"}else{classification <- "Not Average"}
classification
if(wpm >=68 && wpm <= 82){classification <- "Average"}else{classification <- "Not Average"}

a <- 1:3
b <- 4:6

c <- if_else(a > 2 & b >5,T,F)
c


#The case_when()
new_recent_grads <- recent_grads %>% mutate(size_classification = case_when(
  Total < 2000 ~ "Small",
  Total > 20000 ~ "Large",
  T ~ "Medium"
))
view(new_recent_grads)

new_recent_grads <- recent_grads %>% mutate(unemployment_level = case_when(
  Unemployment_rate < 0.05 ~ "Low",
  Unemployment_rate >= 0.1 ~ "High",
  T ~ "Moderate"))

#Comparison Operators
print(recent_grads %>% filter(
  Major == "AEROSPACE ENGINEERING" ||
    Major == "BIOMEDICAL ENGINEERING" ||
    Major == "CHEMICAL ENGINEERING"
))

print(recent_grads %>% filter(
  Major %in% c("AEROSPACE ENGINEERING","BIOMEDICAL ENGINEERING","CHEMICAL ENGINEERING"
)))

print(recent_grads %>% filter(
 !(Major %in% c("AEROSPACE ENGINEERING","BIOMEDICAL ENGINEERING","CHEMICAL ENGINEERING"
  ))))

arts_grads <- recent_grads %>% filter(
  Major_category %in% c("Arts","Humanities & Liberal Arts")
)
 
print(non_engineering_science_grads <- recent_grads %>% filter(
  !(Major_category %in% c("Engineering","Physical Sciences"))))

#Motivation for Iteration
price <- c(10,20,30,40,50)
# Profit = -Price^2 + 60 * Price
profits <- c(-1 *10^2 + 60 * 10,
             -1 *20^2 + 60 * 20,
             -1 *30^2 + 60 * 30,
             -1 *40^2 + 60 * 40,
             -1 *50^2 + 60 * 50)
profits

prices <- c(10,20,30,40,50)
profits <- c()
for (price  in prices){
  cal <- -1*price^2 + 60 *price
  profits <- c(profits,cal)
}
profits

millimeter_measurements <- c(10000,54900,94312,49185,2100)
meter_measurements <- c()
for ( m in millimeter_measurements){
  calc <- m/1000
  meter_measurements <- c(meter_measurements,calc)
}
meter_measurements

profits <- integer(length(prices))
indices <- 1:length(prices)

for (i in indices) {
  calc <- -1 * prices[i]^2 +60 * prices[i]
  profits[i] <- calc
}
profits 


meter_measurements <- integer(length(millimeter_measurements))
indices <- 1:length(millimeter_measurements)

for (i in indices) {
  calc <- millimeter_measurements[i]/1000
  meter_measurements[i] <- calc
}
meter_measurements 


# A while loop example 
nums <- 1:10
is_condition_met <- F
i <- 1

while(!is_condition_met){
  print(paste("The loop has run",i,"time(s)"))
  current_num <- nums[i] #Grab a number using the index
  print(paste("current_num is currently:", current_num))
  is_condition_met <- current_num > 7
  print(paste("is_condition_met is currently:",is_condition_met))
  i = i + 1
  print(paste("The index i has been set to:",i))
}


prices <- c(138.19,82.72,118.97,77.55,62.28,89.71,97.36,91.98,113.45,73.93)
is_below_70 <- F

i <- 1
prices[i]


while(!is_below_70){
  print(paste("The loop has run",i,"time(s)"))
  current_price <- prices[i] #Grab a number using the index
  print(paste("current_price is currently:", current_price))
  is_below_70 <- current_price < 70
  
  print(paste("is_condition_met is currently:",is_below_70))
  i = i + 1
  
  print(paste("The index i has been set to:",i))
}

#Iteration Vs Vectorization
nums <- c(1000,2000,3000,4000,5000)
divided_nums <- c()
for (n in nums){
  cal <- n/1000
  divided_nums <- c(divided_nums,cal)
}

divided_nums <- nums/1000
divided_nums



#Functions
nums <- 1:10
mean_nums <- sum(nums)/length(nums)

# it can also be
 nums <- 1:10
mean_nums <- mean(nums) 


#Components of a Function
example_mean <- function(nums) {
  sum_nums <- sum(nums)
  length_vec <- length(nums)
  return(sum_nums/length_vec)
}
avg <- example_mean(1:10)
avg


find_longer_vector <- function(vec_1,vec_2){
  if(length(vec_1)>length(vec_2)){"First"}
  if(length(vec_2)>length(vec_1)){"Second"}
  else{"Equal Length"}
}
first_vec <- c(1,5,4,2,3,7,6)
second_vec <- c(9,2,1,8,3,4,5,6,10,7,12,11)
third_vec <- c(8,3,5,1,7,1,10)
first_vs_second <- find_longer_vector(first_vec,third_vec)
first_vs_third <- find_longer_vector(first_vec,second_vec)


is_divisible <- function(first_one,second_one){
  if(first_one%%second_one == 0){T}
  else{F}
}
is_divisible(5731,11)


#Default Arguments
remainder2 <- function(divisor,dividend = 2){
  whole <- (divisor/dividend)
  rem <- divisor-(whole * dividend)
  return(rem)
}
remainder2(9, dividend = 3)
remainder2(divisor = 9, dividend = 3)

# Handling Variable Numbers of Arguments
add <- function(x,y){
   return(x+y)
}
new_add <- function(x,y, ...){
  return(list(...))
}
new_add(1,2, z= 3, w= 4)

new_add <- function(x,y, ...){
  current_num = x+y
  for (num in list(...)){
    current_num = current_num + num
  }
  return(current_num)
}

new_add(1,2, z = 3)
new_add(1,2, z= 3, w = 4)


subtract_all <- function(x, ...){
  current_num = x
  for(num in list(...)){
    current_num =  current_num - num
  }
  return(current_num)
}

first_subtraction <- subtract_all(10, y= 1, z= 2, w = 3)
first_subtraction

second_subtraction <- subtract_all(100, w=71,y=22)
second_subtraction
