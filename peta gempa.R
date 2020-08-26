library(leaflet)

peta<-read.csv("~/Documents/Kerabat Data/peta gempa.csv")
str(peta)
leaflet(peta) %>%
  addTiles()

###2
leaflet(peta) %>%
  addTiles() %>%
  addAwesomeMarkers (lng = ~Lon,
                     lat = ~Lat)

##3

labels <- sprintf(
  "Kedalaman: %g (KM) <br/> Magnitudo: %g",
  peta$Dep, peta$M
) %>% 
  lapply(htmltools::HTML)
new <- c("red","orange")[peta$Magnitude]

icons <- awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion',
  markerColor = new)


pal <- colorFactor(c("red","orange"),
  domain = peta$Magnitude
)

leaflet(peta) %>%
  addTiles() %>%
  addAwesomeMarkers (lng = ~Lon,
                     lat = ~Lat,
                     label = labels,icon = icons) %>%
  addLegend("bottomright", pal = pal, values = ~peta$Magnitude,
            title = "Kekuatan Gempa",
            opacity = 1)
