#wczytanie bibliotek
library("spatstat")
library("rgdal")
library("dbscan")
library("ggplot2")
library("broom")

#import danych
osiedla = readOGR(dsn = "pliki", layer = "osiedla", verbose = FALSE)
point = readOGR(dsn = "pliki", layer = "punkty", verbose = FALSE)

#przygotowanie brzegowych wartosci wykresu
minmax=data.frame(osiedla@bbox)
x_cor = minmax[1,]
y_cor = minmax[2,]

# przygotowanie danych punktowych do analizy
point_xy = point@coords

# DBSCAN
db = dbscan(point@coords, eps = 300, minPts = 10)

# wyswietlenie klastra miejsc przestepst na mapie krakowa
plot(osiedla)
par(new=TRUE)
hullplot(point_xy, db,
         ylim = c(y_cor$min, y_cor$max),
         xlim = c(x_cor$min, x_cor$max),
         xlab = "x [meters]", ylab = "y[meters]",
         asp = 1, main = "DBSCAN")

#HDBSCAN
hdb = hdbscan(x = point_xy, minPts = 16)

#wyswietlenie klastra miejsc przestepst na mapie krakowa
plot(osiedla)
par(new = TRUE)
hullplot(point_xy, hdb,
         ylim = c(y_cor$min, y_cor$max),
         xlim = c(x_cor$min, x_cor$max),
         xlab = "x [meters]", ylab = "y[meters]",
         asp = 1, main = "HDBSCAN")

#OPTICS
opt = optics(x=point_xy, eps = 500, minPts = 20)

#Prog do identyfikacji klastrow
db_opt = extractDBSCAN(opt, eps_cl = .1) 

#Prog stromosci do hierarchicznej identyfikacji klastrow przy uzyciu metody Xi.
db_opt = extractXi(opt, xi = 0.01)

# wyswietlenie klastra miejsc przestepst na mapie krakowa
plot(osiedla)
par(new = TRUE)
hullplot(point_xy, db_opt,
         ylim = c(y_cor$min, y_cor$max),
         xlim = c(x_cor$min, x_cor$max),
         xlab = "x [meters]", ylab = "y[meters]",
         asp = 1, main = "OPTICS 3")
