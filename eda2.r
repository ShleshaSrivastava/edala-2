---
title: "EDA Learning Activity-2"
output:
  html_document:
    df_print: paged
  pdf_document: default
---
Submitted by :- SHLESHA (1NT21IS153)


INTRODUCTION

Introducing a comprehensive flight delay prediction dataset, designed to revolutionize air travel planning. This dataset amalgamates real-time and historical flight information, encompassing factors such as weather conditions, airport congestion, and past performance. With meticulously curated data, this resource empowers researchers and data scientists to develop robust models for forecasting flight delays. Unlocking insights that enhance the accuracy of predictions, this dataset aims to mitigate inconveniences associated with air travel by offering a valuable tool for proactive decision-making. Elevate your understanding of flight delays with this cutting-edge dataset.
```{r}
#reading the dataset and storing in into the dataframe df
df <- read.csv("~/Desktop/archive (1)/Jan_2019_ontime.csv")
```

CREATING A HISTOGRAM

With the ggplot2 library, we can create a histogram using geom_histogram() function.

```{r}
#creating a histogram for the DISTANCE column of our dataset
library(ggplot2)
ggplot(df, aes(x=DISTANCE)) +
  geom_histogram(colour="red")
```

CREATING A BAR GRAPH

With the ggplot2 library, we can create a bar graph using geom_col() function.

```{r}
#Creating a bar graph for DAY_OF_MONTH and DAY_OF_WEEK columns of our dataset
ggplot(df, aes(x=DAY_OF_MONTH, y=DAY_OF_WEEK)) +
  geom_col()
```

CREATING A LINE GRAPH

With the ggplot2 library, we can create a line graph using geom_line() function.

```{r}
#Creating a line graph for DAY_OF_MONTH and DEST_AIRPORT_ID columns of our dataset
ggplot(df, aes(x=DAY_OF_MONTH, y=DEST_AIRPORT_ID)) +
  geom_line(colour="blue")
```

CREATING A SCATTER PLOT

With the ggplot2 library, we can create a scatter plot using geom_point() function.

```{r}
#Creating a scatter plot for OP_CARRIER_NUM and DISTANCE columns of our dataset
ggplot(df, aes(x=OP_CARRIER_FL_NUM, y=DISTANCE)) +
  geom_point()
```

CREATING A BOX PLOT

With the ggplot2 library, we can create a box plot using geom_boxplott() function.

```{r}
#Creating a box plot for DAY_OF_MONTH and DAY_OF_WEEK columns of our dataset
ggplot(df, aes(x=DAY_OF_MONTH, y=DAY_OF_WEEK)) +
  geom_boxplot(colour="yellow")
```

CREATING A DENSITY CURVE

With the ggplot2 library, we can create a density curve using geom_line() function.

```{r}
#Creating a density curve for DISTANCE column of our dataset
ggplot(df, aes(x=DISTANCE)) +
  geom_line(stat="density", colour="brown") +
  expand_limits(y=0)
```

CREATING A DENSITY CURVE OVERLAYED ON A HISTOGRAM

```{r}
#Creating a density curve overlayed on a histogram our dataset
ggplot(df, aes(x=DISTANCE, y=after_stat(density))) +
  geom_histogram(fill="cornsilk", colour="grey60", linewidth=.2) +
  geom_density() +
  xlim(500, 1050)

```

CREATING A FREQUENCY POLYGON 

With the ggplot2 library, we can create a frequency polygon using geom_freqpoly() function.

```{r}
#Creating a frequency polygon for OP_CARRIER_FL_NUM column of our dataset
ggplot(df, aes(x=OP_CARRIER_FL_NUM)) +
  geom_freqpoly() 
```

CREATING A VIOLIN GRAPH

With the ggplot2 library, we can create a violin plot using geom_violin() function.

```{r}
#Creating a violin graph for DAY_OF_MONTH and DISTANCE column of our dataset
#We are making our violin graph smooth using adjust
library(gcookbook)
df_p <- ggplot(df, aes(x= DAY_OF_MONTH, y=DISTANCE)) 
df_p + geom_violin(adjust=2, colour="pink3")
```

CREATING A CORRELATION PLOT

With the corrplot library, we can create a correlation plot.

```{r}
#Creating a Correlation Plot for our dataset
library(corrplot)
dfcorr <- data.frame(df$DAY_OF_MONTH, df$DISTANCE, df$DAY_OF_WEEK)
dfcorr <- cor(dfcorr)
corrplot(dfcorr, method="square", shade.col= NA, tl.col="black", tl.srt=45)
```

PLOTTING A FUNCTION

With the ggplot2 library, we can plot a function using stat_function() function.

```{r}
#Plotting a function
p <- ggplot(data.frame(x=c(-3,3)), aes(x=x))
p + stat_function(fun=dnorm)
```

CREATING A NETWORK GRAPH

With the ggplot2 library, we can create a network graph using plot(graph) function.

```{r}
#Creating a network graph
library(igraph)
gd <- graph(c(1,2,2,3,2,4,1,4,5,5,3,6))
plot(gd)
```

CREATING A HEAT MAP

With the ggplot2 library, we can create a heat map using geom_tile() function.

```{r}
#Creating a Heat Map for the DAY_OF_MONTH and DAY_OF_WEEK columns of our dataset
p <- ggplot(df, aes(x=DAY_OF_MONTH, y=DAY_OF_WEEK))
p + geom_tile()
```

CREATING A 2D DENSITY CURVE

```{r}
#Creating a 2D Density Curve for the DAY_OF_MONTH AND DAY_OF_WEEK Columns of our dataset
ggplot(df, aes(x = DAY_OF_MONTH, y = DAY_OF_WEEK)) +
  geom_density_2d() +
  labs(x = "DAY_OF_MONTH", y = "DAY_OF_WEEk") +
  theme_minimal()
```
