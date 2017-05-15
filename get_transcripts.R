# Load necessary libraries
library(rvest)
library(tidyverse)

# Using a for loop (for now) to cycle through the west wing transcripts and load them 
df <- data.frame("ep_no" = 1:148) %>%
  mutate(episode_url =paste0("http://www.westwingtranscripts.com/search.php?flag=getTranscript&id=",ep_no))

for (i in 1:148) {
  df$episode_txt[i] <- read_html(df$episode_url[i]) %>%
    html_nodes("pre") %>%
    html_text()
} 
