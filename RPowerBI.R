#Linguagem R no PowerBI

#Parte I - Graficos no R

#Diretório
setwd("seu diretório")

#Plot I (Simples)
plot(Temp~Wind,data=dataset)
     
#Plot II (Velocidade do Vento x Temperatura)
plot(Temp~Wind,data=dataset,pch=19,
     main="Temperatura x Velocidade do Vento",
     xlab="Velocidade do Vento",
     ylab="Temperatura")

#Plot III (Package ggplot)
#Instalação
install.packages("ggplot2")
library("ggplot2")

ggplot(airquality,aes(Temp)) +
  geom_bar()+
  ggtitle("Temperatura - Airquality")+
  labs(x="Temperatura",y="Quantidade")+
  scale_y_continuous(breaks = seq(1:10))+
  theme_bw()
  

#Parte II - Manipulaçao de Tabelas

#Atribuição a Variavel datataset
dataset <- airquality

#Pacotes
install.packages("dplyr")
library("dplyr")
install.packages("tidyr")
library("tidyr")

#Preparo
air_data <- dataset %>% 
              dplyr::select(Ozone,Solar.R,Month,Temp) %>%
              tidyr::gather(Variavel,Valor,-Solar.R,-Month,-Temp) %>%
              dplyr::arrange(Solar.R)

#Plot IV (Variaçao Temperatura)
ggplot(air_data,aes(Temp))+
        geom_density()+
        theme_bw()+
        facet_grid(~Month)+
        ggtitle("Variação de Temperatura por Mês") +
        labs(xlab="Temperatura",y="Variação")
