#tidy bat data


readr::read_csv("./data/bat_dat.csv")
#read_csv is converted to a tibble which is console print friendly.  Prints it
#in a compact format.  Gives a preview.  
#Shows first 10 rows and then lists the rest
#int is an integer, dbl is  double.
#pay attention to the dimensions.  We have 188 rows with 83 obs
#rows value left, column value right
#skip argument eg skip = 18, will skip over a number of lines


#converting data to a factor as per below
iris<- read_csv("./data/iris.csv", comment = "#", 
         col_types = cols(
           Sepal.Length = col_double(),
           Sepal.Width = col_double(),
           Petal.Length = col_double(),
           Petal.Width = col_double(),
           Species = col_factor(c("setosa", "versicolor", "virginica"))
         ))


# can do one of two things
dplyr (iris)
view (iris)
#error here, these two won't run.  need to go thru text on dplyr in module 5 to see what I
#have done wrong

#back to the bat data
dplyr::filter(.data = bat_dat, Season == 1)
bat_dat<- read_csv("./data/bat_dat.csv")
dplyr::filter(.data=bat_dat, Season ==1)
# or say we wanted only those with 100 of a particular sp
dplyr::filter(.data=bat_dat, Season ==1, Chgouldii>100)

#will give unique rows
distinct (bat_dat, Site)

#slice will subset by position
slice (bat_dat, c(1:5,11))
#I have an error in here

#work through the module to get all the options


#multiple functions
filter(select(bat_dat, 1:5), Chgouldii > 50, Chmorio > 50)
#subset by column, then subset by row, for ehc of these conditions


select(bat_dat, 1:5) %>%
  filter(Chgouldii > 50, Chmorio > 50)
#this takes the outpu on the LHS and takes it to the RHS of the pipe
#if you have 5 or 6 operations you want to perform on the same object, useful
#using pipes tens to reflect your train of thoughts
# its also easier to read


# 'group by' function is useful
# eg
bat_dat %>%
  select(1:4) %>%
  group_by(Season) %>%
  summarise(mean_Cg = mean(Chgouldii))
#succinct way to deal with a complex operation

