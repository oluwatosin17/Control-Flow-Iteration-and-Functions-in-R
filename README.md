# Control-Flow-Iteration-and-Functions-in-R

## Control Flow in R
An `if` statement can be written like the following:
`if (insert comparison operator here) {
      print("Code to run if the comparison operator is TRUE")
    } else {
      print("Code to run if the comparison operator is FALSE")
    }`

The `if_else()` function vectorizes a simple two-branch decision tree:
`new_recent_grads <- recent_grads %>% 
      mutate(
    is_engineering = if_else(Major_category == "Engineering", TRUE, FALSE)
      )`
To create a multiple comparison in an `if_else()`function, you must use `&`
and `|` instead of `&&` and `||`:
`a <- 1:3 
b <- 4:6 
d <- if_else(a > 2 & b > 5, TRUE, FALSE)
d [1] FALSE FALSE TRUE`

The `case_when()` function vectorizes a more complex, 2+ branch decision tree:
`new_recent_grads <- recent_grads %>% 
      mutate(
        size_classification = case_when(
          Total < 2000 ~ "Small",
          Total > 20000 ~ "Large",
          TRUE ~ "Medium
        ) 
      )`

The `%in%` operator helps us create a comparison operator based on a membership test. If a value is in a given collection, then it will evaluate to
`TRUE` `FALSE`

otherwise.

`recent_grads %>% 
      filter(
        Major %in% c("AEROSPACE ENGINEERING", "BIOMEDICAL ENGINEERING", "CHEMICAL ENGINEERING")
      )`

We can use the ! character to invert logical values and comparison operators. 
` x <- 10
x == 10 [1] TRUE
!(x == 10) [1] FALSE `


## Iterations in R

Use a for loop to loop over the values of a vector:
`prices <- c(10, 20, 30, 40, 50)
profits <- c()
for (price in prices) {
  calc <- -1 * price^2 + 60 * price
  profits <- c(profits, calc)
}`

Use a for loop to loop over the indices to use with a vector or collection of vectors:
`prices <- c(10, 20, 30, 40, 50)
profits <- integer(length(prices))
indices <- 1:length(prices)
for (i in indices) {
  calc <- -1 * prices[i]^2 + 60 * prices[i]
  profits[i] <- calc
}`

`Use a while loop to search for a value that satisfies a condition
> Loop set up

`nums <- 1:10
is_condition_met <- FALSE
i <- 1`

> Loop execution

`while (!is_condition_met) {
  current_num <- nums[i] # Grab a number using the index
  is_condition_met <- current_num > 7 # Recheck the condition
  i = i + 1 # Increase the index
}`

- A for loop should be used when we know the number of items we want to iterate through. A while loop is better for when we don't know this number. We may think of a for loop as a to-do list, whereas a while loop can be thought of as a milestone.

## Functions in R

`function_name <- function(input) {
    Input manipulation goes here
    Create a variable to output
  return(output)
}`
