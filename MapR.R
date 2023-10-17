
library(raster)
library(ggplot2)
RF_map<- raster("C:\\Users\\SONY\\Desktop\\Ayoub Paper\\yellow\\proj_current_RF\\proj_current_RF_yellow.grd")
GLM_map<- raster("C:\\Users\\SONY\\Desktop\\Ayoub Paper\\yellow\\proj_current_GLM\\proj_current_GLM_yellow.grd")
GBM_map<- raster("C:\\Users\\SONY\\Desktop\\Ayoub Paper\\yellow\\proj_current_GBM\\proj_current_GBM_yellow.grd")
ANN_map<- raster("C:\\Users\\SONY\\Desktop\\Ayoub Paper\\yellow\\proj_current_ANN\\proj_current_ANN_yellow.grd")
Ensemble<- raster("C:\\Users\\SONY\\Desktop\\Ayoub Paper\\yellow\\proj_All\\proj_All_yellow_ensemble.grd")

plot(RF_map)
plot(GLM_map)
plot(GBM_map)
plot(ANN_map)
plot(Ensemble)


library(tidyr)
library(ggplot2)
rasdf <- as.data.frame(RF_map,xy=TRUE)%>%drop_na()
head(rasdf)

RF <- ggplot() +
  geom_raster(aes(x = x, y = y, fill = yellow_PA1_RUN1_RF), data = rasdf) +
  scale_fill_gradient(
    name = 'Suitability',
    low = 'blue',  # Replace 'blue' with your desired starting color
    high = 'red'   # Replace 'red' with your desired ending color
  ) +
  coord_sf(expand = c(0, 0)) +
  labs(x = 'Longitude', y = 'Latitude', title = "RF") +
  cowplot::theme_cowplot() +
  theme(
    panel.grid.major = element_line(color = gray(.5), linetype = 'dashed', size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = NA, color = 'black')
  )


RF



rasdf <- as.data.frame(GLM_map,xy=TRUE)%>%drop_na()
head(rasdf)

GLM<-ggplot()+
  geom_raster(aes(x=x,y=y,fill=yellow_PA1_RUN1_GLM),data=rasdf)+
  scale_fill_gradient(
    name = 'Suitability',
    low = 'blue',  # Replace 'blue' with your desired starting color
    high = 'red'   # Replace 'red' with your desired ending color
  ) +
  coord_sf(expand = c(0, 0)) +
  labs(x = 'Longitude', y = 'Latitude', title = "GLM") +
  cowplot::theme_cowplot() +
  theme(
    panel.grid.major = element_line(color = gray(.5), linetype = 'dashed', size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = NA, color = 'black')
  )

GLM


rasdf <- as.data.frame(GBM_map,xy=TRUE)%>%drop_na()
head(rasdf)

GBM<-ggplot()+
  geom_raster(aes(x=x,y=y,fill=yellow_PA1_RUN1_GBM),data=rasdf)+
  scale_fill_gradient(
    name = 'Suitability',
    low = 'blue',  # Replace 'blue' with your desired starting color
    high = 'red'   # Replace 'red' with your desired ending color
  ) +
  coord_sf(expand = c(0, 0)) +
  labs(x = 'Longitude', y = 'Latitude', title = "GBM") +
  cowplot::theme_cowplot() +
  theme(
    panel.grid.major = element_line(color = gray(.5), linetype = 'dashed', size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = NA, color = 'black')
  )
GBM


rasdf <- as.data.frame(ANN_map,xy=TRUE)%>%drop_na()
head(rasdf)

ANN<-ggplot()+
  geom_raster(aes(x=x,y=y,fill=yellow_PA1_RUN1_ANN),data=rasdf)+
  scale_fill_gradient(
    name = 'Suitability',
    low = 'blue',  # Replace 'blue' with your desired starting color
    high = 'red'   # Replace 'red' with your desired ending color
  ) +
  coord_sf(expand = c(0, 0)) +
  labs(x = 'Longitude', y = 'Latitude', title = "ANN") +
  cowplot::theme_cowplot() +
  theme(
    panel.grid.major = element_line(color = gray(.5), linetype = 'dashed', size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = NA, color = 'black')
  )
ANN


rasdf <- as.data.frame(Ensemble,xy=TRUE)%>%drop_na()
head(rasdf)

Ensemble<-ggplot()+
  geom_raster(aes(x=x,y=y,fill=yellow_EMmeanByTSS_mergedAlgo_RUN1_PA1),data=rasdf)+
  scale_fill_gradient(
    name = 'Suitability',
    low = 'blue',  # Replace 'blue' with your desired starting color
    high = 'red'   # Replace 'red' with your desired ending color
  ) +
  coord_sf(expand = c(0, 0)) +
  labs(x = 'Longitude', y = 'Latitude', title = "Ensemble") +
  cowplot::theme_cowplot() +
  theme(
    panel.grid.major = element_line(color = gray(.5), linetype = 'dashed', size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = NA, color = 'black')
  )

Ensemble

library(ggpubr)

Yrust <- ggarrange(RF, GBM, GLM,ANN,
                   labels = c(""),
                   ncol = 2, nrow = 2)

Yrust

ggsave(file="Yrust.png", dpi=1000)

ggsave(file="Ensemble.png", dpi=1000)


RCP2.6_2050<- raster("C:\\Users\\SONY\\Desktop\\Ayoub Paper\\yellow\\proj_RCP2.6_2050\\proj_RCP2.6_2050_yellow_ensemble.grd")

rasdf <- as.data.frame(RCP2.6_2050,xy=TRUE)%>%drop_na()
head(rasdf)

RCP2.6_2050<-ggplot()+
  geom_raster(aes(x=x,y=y,fill=yellow_EMmeanByTSS_mergedAlgo_RUN1_PA1),data=rasdf)+
  scale_fill_gradient(
    name = 'Suitability',
    low = 'blue',  # Replace 'blue' with your desired starting color
    high = 'red'   # Replace 'red' with your desired ending color
  ) +
  coord_sf(expand = c(0, 0)) +
  labs(x = 'Longitude', y = 'Latitude', title = "RCP2.6_2050") +
  cowplot::theme_cowplot() +
  theme(
    panel.grid.major = element_line(color = gray(.5), linetype = 'dashed', size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = NA, color = 'black')
  )


RCP2.6_2050



ggsave(file="RCP2.6_2050.png", dpi=1000)



RCP8.5_2050<- raster("C:\\Users\\SONY\\Desktop\\Ayoub Paper\\yellow\\proj_RCP8.5_2050\\proj_RCP8.5_2050_yellow_ensemble.grd")

rasdf <- as.data.frame(RCP8.5_2050,xy=TRUE)%>%drop_na()
head(rasdf)

RCP8.5_2050<-ggplot()+
  geom_raster(aes(x=x,y=y,fill=yellow_EMmeanByTSS_mergedAlgo_RUN1_PA1),data=rasdf)+
  scale_fill_gradient(
    name = 'Suitability',
    low = 'blue',  # Replace 'blue' with your desired starting color
    high = 'red'   # Replace 'red' with your desired ending color
  ) +
  coord_sf(expand = c(0, 0)) +
  labs(x = 'Longitude', y = 'Latitude', title = "RCP8.5_2050") +
  cowplot::theme_cowplot() +
  theme(
    panel.grid.major = element_line(color = gray(.5), linetype = 'dashed', size = 0.5),
    panel.grid.minor = element_blank(),
    panel.background = element_rect(fill = NA, color = 'black')
  )


RCP8.5_2050



ggsave(file="RCP8.5_2050.png", dpi=1000)



Future <- ggarrange(RCP2.6_2050,RCP8.5_2050,
                    labels = c(""),
                    ncol = 2, nrow = 1)

Future



