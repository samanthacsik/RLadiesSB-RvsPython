# Some dplyr vs. base R comparisions: https://cran.r-project.org/web/packages/dplyr/vignettes/base.html

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            ~~
##                        STEP 1: LOAD PACKAGES & DATA                      ----
##                                                                            ~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#..........................load packages.........................

# no packages to load, we're using base R!

#..........................read in data..........................

sweaters <- read.csv("ugly_sweaters.csv")

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            ~~
##                        STEP 2: WRANGLE/PROCESS DATA                      ----
##                                                                            ~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#................filter hs_tf for 'Yes' responses................

sweaters_yes_option1 <- subset(sweaters, hs_tf == "Yes")
sweaters_yes_option2 <- sweaters[which(sweaters$hs_tf == "Yes"), , drop = FALSE]

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                            count sweater colors                          ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#..................tidy colors (1 color per row).................

# separate by ','
sweater_colors_list1 <- strsplit(sweaters_yes_option1$colors, split = c(", "))
sweater_colors1 <- data.frame(sweater = rep(sweaters_yes_option1$sweater, sapply(sweater_colors_list1, length)), colors = unlist(sweater_colors_list1))

# separate by 'and'
sweater_colors_list2 <- strsplit(sweater_colors1$colors, split = c(" and "))
sweater_colors2 <- data.frame(sweater = rep(sweater_colors1$sweater, sapply(sweater_colors_list2, length)), colors = unlist(sweater_colors_list2))

#..............group by sweaterID and count colors...............

color_counts <- aggregate(cbind(count = colors) ~ sweater, 
          data = sweater_colors2, 
          FUN = function(x){NROW(x)})

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                      count sweater description words                     ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#..................tidy descriptions (1 word per row).................

# separate by ','
sweater_words_list <- strsplit(sweaters_yes_option1$image_desc, split = c(" "))
sweater_words <- data.frame(sweater = rep(sweaters_yes_option1$sweater, sapply(sweater_words_list, length)), words = unlist(sweater_words_list))

#..............group by sweaterID and count colors...............

word_counts <- aggregate(cbind(count = words) ~ sweater, 
                          data = sweater_words, 
                          FUN = function(x){NROW(x)})

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                  join dfs                                ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

all_counts <- merge(x = color_counts, y = word_counts, by = "sweater", all = TRUE)
all_counts[is.na(all_counts)] = 0

# convert count.x (color_counts) to numeric
all_counts$count.x <- as.numeric(all_counts$count.x)

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                                                            ~~
##                           STEP 3: VISUALIZE DATA                         ----
##                                                                            ~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#....................create basic scatterplot....................

plot(all_counts$count.y ~ jitter(all_counts$count.x, 1),
     pch = 1, cex = 1.5, col = "gray48")

#..............create slightly fancier scatterplot...............

# calculate standard error
summary(lm(formula = all_counts$count.y ~ all_counts$count.x))

# plot (doesn't include confidence intervals)
plot(all_counts$count.y ~ jitter(all_counts$count.x, 1),
     pch = 1, cex = 1.5, col = "gray48", # change point shape, size, color
     main = "Relationship between the number of colors and length of \ndescription for ugly holiday sweaters", cex.main = 0.8, 
     xlab = "Number of colors on sweater", ylab = "Number of words in sweater description", cex.lab = 0.8) 
abline(lm(formula = all_counts$count.y ~ all_counts$count.x))



