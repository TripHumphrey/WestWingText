library(rvest)

a <- read_html("http://www.westwingtranscripts.com/search.php?flag=getTranscript&id=1") %>%
  html_nodes("pre") %>%
  html_text()
