library(ggplot2)
library(patchwork)
abalone = read.csv('https://datahub.io/machine-learning/abalone/r/abalone.csv')

x <- ggplot(abalone, aes(x=Whole_weight)) +
  geom_histogram()

y <- ggplot(abalone, aes(x=Diameter, y=Height, color=Whole_weight)) +
  geom_point(size=2, shape=23)

z <- x/y

ggsave('outfile.png', z)
