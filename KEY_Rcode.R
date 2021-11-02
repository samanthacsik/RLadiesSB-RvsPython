#..........................load packages.........................

library(tidyverse)

#..........................read in data..........................

sweaters <- read_csv(here::here("holiday_sweaters_2020_clean.csv")) %>% 
  dplyr::filter(hs_tf == "Yes") # filter data for those that actually have a sweater

#.....................wrangle sweater colors.....................
# 1) tidy colors (1 color per row)
# 2) group by sweater ID
# 3) calculate how many colors each sweater has on it
#................................................................

tidy_colors <- sweaters %>% 
  tidyr::separate_rows(colors, sep = c(", ")) %>% 
  tidyr::separate_rows(colors, sep = c(" and ")) %>% 
  group_by(sweater) %>% 
  summarize(num_colors = length(sweater))

#..................wrangle sweater descriptions..................
# 1) tidy colors (1 word per row)
# 2) group by sweater ID
# 3) calculate how many colors each sweater has on it
# ................................................................

tidy_descriptions <- sweaters %>% 
  tidyr::separate_rows(image_desc, sep = c(" ")) %>% 
  group_by(sweater) %>% 
  summarize(num_words = length(sweater))

#........................join data frames.........................

tidy_counts <- full_join(tidy_descriptions, tidy_colors)

#....................create exploratory plot.....................

exploratory_plot <- ggplot(tidy_counts, aes(x = num_colors, y = num_words)) +
  geom_jitter(size = 3, alpha = 0.5) 

exploratory_plot

#.........................remove outlier.........................

tidy_counts2 <- tidy_counts %>% 
  filter(!sweater %in% c("sweater87", "sweater7"))

#........................fit linear model........................

sweater_lm <- lm(data = tidy_counts, num_words ~ num_colors)
summary(sweater_lm)

#......................create finalized plot.....................

finalized_plot <- ggplot(tidy_counts2, aes(x = num_colors, y = num_words)) +
  geom_jitter(size = 3, alpha = 0.5) +
  scale_x_continuous(breaks = seq(from = 2, to = 8, by = 2)) +
  geom_smooth(method = lm, se = TRUE, size = 0.5, color = "black") +
  labs(x = "Number of colors on sweater", 
       y = "Number of words in sweater description",
       title = str_wrap("Relationship between the number of colors and length of description for ugly holiday sweaters", 60)) +
  theme_classic() +
  theme(
    
  )

finalized_plot















# tidy_colors <- sweaters %>% 
#   
#   # 1) filter for people that have holiday sweaters
#   dplyr::filter(hs_tf == "Yes") %>% 
#   
#   # 2) convert all character strings in the 'color' column to lowercase
#   dplyr::mutate(colors = str_to_lower(colors)) %>% 
#   
#   # 3) tidy colors (one color per row)
#   tidyr::separate_rows(colors, sep = c(", ")) %>% 
#   tidyr::separate_rows(colors, sep = c(" and ")) %>% 
#   
#   # 4) clean messy color names
#   dplyr::mutate(colors_clean = colors,
#                 colors_clean = str_replace(colors_clean, "good", "gold"),
#                 colors_clean = str_replace(colors_clean, "terrifyingly bright pink", "pink")) %>% 
#   
#   # 5) group by sweater entry
#   dplry::group_by(sweater)


# ggplot(tidy_colors, aes(x = sweater, y = colors_clean)) +
#   geom_point() +
#   theme_classic() +
#   theme(
#     axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)
#   )



                