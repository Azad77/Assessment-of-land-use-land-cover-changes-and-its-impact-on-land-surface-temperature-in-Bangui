# Load libraries
library(ggplot2)
library("ggpubr")
library(cowplot)
library(egg)
##################
# Load data
da <- read.csv("D:\\Central African Republic Research\\Minor Revision\\Final_data.csv")
da
lst86 <- da[,1]
lst90 <- da[,2]
lst17 <- da[,3]
###
loessMod10 <- loess(lst86 ~ ndvi86, data=da, span=0.10) # 10% smoothing span
###
ndbi86 <- da[,4]
ndbi90 <- da[,5]
ndbi17 <- da[,6]
###
ndli86 <- da[,7]
ndli90 <- da[,8]
ndli17 <- da[,9]
###
ndvi86 <- da[,10]
ndvi90 <- da[,11]
ndvi17 <- da[,12]
################## Figure 1
# Fit polynomial regression line and add labels
#formula <- y ~ poly(x, 2, raw = TRUE)
formula <- y ~ x
p1 <- ggplot(da, aes(ndvi86,lst86)) +
  geom_point()+
  theme_bw()+
  labs(title="(a)")+
  ylab("LST 1986")+
  xlab("NDVI 1986")+
  stat_smooth( method = "loess", formula = formula, span = 0.5)
p1  
################## Figure 2
# Fit polynomial regression line and add labels
formula <- y ~ x
p2 <- ggplot(da, aes(ndvi90,lst90)) +
  geom_point()+
  theme_bw()+
  labs(title="(b)")+
  ylab("LST 1990")+
  xlab("NDVI 1990")+
  stat_smooth( method = "loess", formula = formula, span = 0.5)
p2  
############### Figure 3
# Fit polynomial regression line and add labels
formula <- y ~ x
p3 <- ggplot(da, aes(ndvi17,lst17)) +
  geom_point()+
  theme_bw()+
  labs(title="(c)")+
  ylab("LST 2017")+
  xlab("NDVI 2017")+
  #stat_smooth( method = "lm", formula = formula)
  stat_smooth( method = "loess", formula = formula, span = 0.5)
p3
###############
################## Figure 1
# Fit polynomial regression line and add labels
#formula <- y ~ poly(x, 2, raw = TRUE)
formula <- y ~ x
p4 <- ggplot(da, aes(ndli86,lst86)) +
  geom_point()+
  theme_bw()+
  labs(title="(d)")+
  ylab("LST 1986")+
  xlab("NDLI 1986")+
  #stat_smooth( method = "lm", formula = formula)
  stat_smooth( method = "loess", formula = formula, span = 0.5)
p4  
################## Figure 2
# Fit polynomial regression line and add labels
formula <- y ~ x
p5 <- ggplot(da, aes(ndli90,lst90)) +
  geom_point()+
  theme_bw()+
  labs(title="(e)")+
  #ylab(expression(paste("PALSAR HH ",sigma,"0 (dB)")))+
  ylab("LST 1990")+
  xlab("NDLI 1990")+
  #stat_smooth( method = "lm", formula = formula)
  stat_smooth( method = "loess", formula = formula, span = 0.5)
p5 
############### Figure 3
# Fit polynomial regression line and add labels
formula <- y ~ x
p6 <- ggplot(da, aes(ndli17,lst17)) +
  geom_point()+
  theme_bw()+
  labs(title="(f)")+
  ylab("LST 2017")+
  xlab("NDLI 2017")+
  #stat_smooth( method = "lm", formula = formula)
  stat_smooth( method = "loess", formula = formula, span = 0.5)
p6
###############
################## Figure 7
# Fit polynomial regression line and add labels
#formula <- y ~ poly(x, 2, raw = TRUE)
formula <- y ~ x
p7 <- ggplot(da, aes(ndbi86,lst86)) +
  geom_point()+
  theme_bw()+
  labs(title="(g)")+
  ylab("LST 1986")+
  xlab("NDBI 1986")+
  #stat_smooth( method = "lm", formula = formula)
  stat_smooth( method = "loess", formula = formula, span = 0.5)
p7  
################## Figure 8
# Fit polynomial regression line and add labels
formula <- y ~ x
p8 <- ggplot(da, aes(ndbi90,lst90)) +
  geom_point()+
  theme_bw()+
  labs(title="(h)")+
  ylab("LST 1990")+
  xlab("NDBI 1990")+
  #stat_smooth( method = "lm", formula = formula)
  stat_smooth( method = "loess", formula = formula, span = 0.5)
p8 
############### Figure 9
# Fit polynomial regression line and add labels
formula <- y ~ x
p9 <- ggplot(da, aes(ndbi17,lst17)) +
  geom_point()+
  theme_bw()+
  labs(title="(i)")+
  ylab("LST 2017")+
  xlab("NDBI 2017")+
  #stat_smooth( method = "lm", formula = formula)
  stat_smooth( method = "loess", formula = formula, span = 0.5)
p9
###############

# Multiple plots in ggplot2
png("Figure5_Central_Africa_Paper.png", width = 10, height = 10, units = 'in', res = 300)
ggarrange(p1, p2,p3, p4, p5, p6,p7,p8,p9, ncol=3, nrow=3)
dev.off()
