getwd()
setwd("C:\\Users\\Ankit\\Desktop")
getwd()

library(visNetwork)
library(bnlearn)
library(ggplot2)


df <- read.csv("C:\\Users\\Ankit\\Desktop\\recent_features.csv")


df <- as.numeric(df)

df[1:35] <- lapply(df[1:35], as.numeric)
df[36] <- lapply(df[36], as.factor)
res <- hc(df)
str(df)

plot.network <- function(structure, ht = "400px"){
  
  nodes.uniq <- unique(c(structure$arcs[,1], structure$arcs[,2]))
  
  nodes <- data.frame(id = nodes.uniq,
                      
                      label = nodes.uniq,
                      
                      color = "darkturquoise",
                      
                      shadow = TRUE)
  
  
  
  edges <- data.frame(from = structure$arcs[,1],
                      
                      to = structure$arcs[,2],
                      
                      arrows = "to",
                      
                      smooth = TRUE,
                      
                      shadow = TRUE,
                      
                      color = "black")
  
  
  
  return(visNetwork(nodes, edges, height = ht, width = "100%"))
  
}




plot.network(res)
#df$
plot(res)






plot.network <- function(structure, ht = "400px"){
  nodes.uniq <- unique(c(structure$arcs[,1], structure$arcs[,2]))
  nodes <- data.frame(id = nodes.uniq,
                      label = nodes.uniq,
                      color = "darkturquoise",
                      shadow = TRUE)
  edges <- data.frame(from = structure$arcs[,1],
                      to = structure$arcs[,2],
                      arrows = "to",
                      smooth = TRUE,
                      shadow = TRUE,
                      color = "black")
  return(visNetwork(nodes, edges, height = ht, width = "100%"))
}