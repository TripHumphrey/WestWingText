library(rvest)

# Using a for loop (for now) to cycle through the west wing transcripts and load them 
df <- data.frame("ep_no" = 1:148) %>%
  mutate(episode_url =paste0("http://www.westwingtranscripts.com/search.php?flag=getTranscript&id=",ep_no))

for (i in df$episode_url) {
df$episode_txt[i] <- read_html(df$episode_url[i]) %>%
  html_nodes("pre") %>%
  html_text()
} 

test <- df$episode_url %>% map(read_html)

maybe <- list()
for (i in 1:148) {
maybe[i] <- html_nodes(test[[i]], "pre") %>%
    html_text()
}
