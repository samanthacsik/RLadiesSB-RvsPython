# R-Ladies SB x Central Coast Python - Data Science with R & Python

Mark you calendars for a first-of-its-kind R-Ladies SB x [Central Coast Python](https://www.meetup.com/central-coast-python/ble) Meetup on December 15th!

## Meetup Details

- **Event Description:** Python can be a powerful alternative/complementary language to R, and while we here at R-Ladies are certainly partial to the latter, adding another language to our data science toolkit is something we are always excited for. We have collaborated with Central Coast Python to bring you an R to Python (and vice versa) translation workshop, where we will learn to wrangle and visualize the same dataset using both languages. You may choose to follow along on our screens or download the required software and packages to code along on your own machines. If you do not already have R and Python installed, please be sure to do so before the event on December 15th (see **[Software Installation Instructions](https://github.com/samanthacsik/RLadiesSB-RvsPython/blob/main/README.md#software-installation-instructions)** below). 

   *This event is open to R and/or Python enthusiasts of all skill-levels!*

- **RSVP & Event Details:** [R-Ladies SB Meetup Event](link here) (Python allies can RSVP at [Central Coast Python Meetup Event](link here))

- **Other Materials:** Find our Google Slides presented during the Meetup [here](https://docs.google.com/presentation/d/1jXb8wbcP2f7flSfLMoX2gui70G67XRjftJRMLselOlE/edit?usp=sharing) 

## Software Installation & Setup Instructions

Please complete the following steps to install all necessary software and packages prior to our meetup on 12/15.

### Install R & RStudio and the `tidyverse` (expected install/test time: ~10-15 minutes)
1) If you have not yet installed R and/or RStudio (you will need both), follow the steps outlined [here](https://docs.google.com/document/d/1KLYC_GcDLYeczSjJmZ5h4y525XILJbbL6r2-MxGCdtw/edit?usp=sharing)
2) We will be using the [{tidyverse}](https://www.tidyverse.org/) (a collection of packages designed for data science, particularly useful for data wrangling and visualization). If you do not yet have the {tidyverse} installed, run the following line of code in your RStudio Console: `install.packages("tidyverse")`
3) We encourage you to test that your installations are working as expected. Follow [these instructions](https://docs.google.com/document/d/1ItQy91G6QfKaX1-26lracpSbJ52JUie1HZb54LCa9sM/edit?usp=sharing) to ensure a smooth workshop ahead!

### Install Python & Anaconda (expected install/test time: ~10-15 minutes)
1. Install Conda following [these instructions](https://docs.conda.io/projects/conda/en/latest/user-guide/install/macos.html). If you aren't sure whether to choose Miniconda or Anaconda, we would reccommend Miniconda.
2. Using the command line, run `jupyter notebook` to open up a browser window and start coding.

### Install git/GitHub (expected install time: ~5 minutes)  
1) If you are not already using git/GitHub for version control, we recommend you get set up by following the steps outlined [here](https://docs.google.com/document/d/1AQ4zAYxPHOObq-snnnRtEdwCC8TwIJsTHwpaKyvEyoA/edit?usp=sharing). Doing so will allow you to clone (i.e. copy to your computer) the GitHub repositories containing all the data and scripts that you need to follow along with us (steps for cloning a GitHub repository can be found [below](https://github.com/samanthacsik/RLadiesSB-RvsPython#fork--clone-workshop-repositories-to-your-computer)).

### Fork & Clone workshop repositories to your computer

If you would like to follow along with us during the workhshop, you will need to fork and clone **two** repositories:

1) This repo, which contains all R code for the workshop: https://github.com/samanthacsik/RLadiesSB-RvsPython
2) The Central Coast Python repo, which contains all Python code for the workshop: https://github.com/seanhelvey/IntroToPythonForRUsers

You can find detailed instructions on how to fork and clone repositories [here](https://docs.google.com/document/d/16aM5B4B3WRc1YbcYrFlk_IOX1YV5ITnMWxNpCQFb8Qk/edit?usp=sharing).

## Data

We will be using ugly holiday sweater data crowdsourced from R-Ladies (and friends) in November/December 2020. If you would like to contribute your own ugly holiday sweater info to this dataset, please fill out this [Google Form](https://docs.google.com/forms/d/e/1FAIpQLSd37uWHUgp-Gd5833ECGXdszKLBV6kpdpigT-yIMTXkCwyKXg/viewform)! See a summary of the data attributes here:

* `sweater`: entry number
* `hs_tf`: Do you have a holiday sweater? (Yes/No/NA)
* `sparkly`: is it sparkly? (Yes/No/NA)
* `noise`: does it make noise? (Yes/No/NA)
* `lights`: does it light up? (Yes/No/NA)
* `objects`: does it have anything attached to it? (Yes/No/NA)
* `colors`: What colors does it have? 
* `image_tf`: Does it have an image on it? (Yes/No/NA)
* `image_desc`: User-provided image description

## Objective

We will use both R's [tidyverse](https://www.tidyverse.org/) packages and Python's [Pandas](https://pandas.pydata.org/) library to demonstrate how you might wrangle the [ulgy sweater data](https://github.com/samanthacsik/RLadiesSB-RvsPython/blob/main/holiday_sweaters_2020_clean.csv) and create this plot: 

![Rplot](https://user-images.githubusercontent.com/43836046/139956835-7af0e1c4-ea85-4266-9821-9dca101b053f.png)

