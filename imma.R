library(leaflet)

data <- data.frame(long=c(119.449521, 119.450739, 119.449419,119.447934),
                   lat=c(-5.098641, -5.100104, 	-5.101071, 	-5.098983),
                   nama=c("Titik 1", "Titik 2", "Titik 3", "Titik 4"))
data

# Show first 20 rows from the `quakes` dataset
leaflet(data = data) %>% addTiles() %>%
  addMarkers(~long[1:2], ~lat[1:2], popup = ~as.character(nama[1:2]), label = ~as.character(nama[1:2]),
             labelOptions = labelOptions(noHide = T, textsize = "15px", direction = "right")) %>%
  addMarkers(~long[3:4], ~lat[3:4], popup = ~as.character(nama[3:4]), label = ~as.character(nama[3:4]),
             labelOptions = labelOptions(noHide = T, textsize = "15px", direction = "left"))
