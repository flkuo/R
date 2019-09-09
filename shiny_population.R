

#1 population map by region

library(highcharter)
library(forecast)
require(dplyr)
mapdata <- get_data_from_map(download_map_data("countries/tw/tw-all"))
glimpse(mapdata)
set.seed(1234)
data_fake <- mapdata %>% 
  select(code = `postal-code`) %>% 
  mutate(value = 1e5 * abs(rt(nrow(.), df = 10)))


glimpse(data_fake)

hcmap("countries/tw/tw-all", data = data, value = "older65",
      joinBy = c("postal-code", "code"), name = "Older population",
      dataLabels = list(enabled = TRUE, format = '{point.name}'),
      borderColor = "#6abd77", borderWidth = 0.1,
      tooltip = list(valueDecimals = 0, valuePrefix = " ", valueSuffix = " people")) 


-------------------------------
#2 population forecast
  
hcmap("countries/tw/tw-all")
hcmap("countries/tw/tw-all", showInLegend = FALSE) %>%
  hc_title(text = "Taiwan")



hcmap("countries/tw/tw-all", data = data,
      name = "postal-code", value = "older65", joinBy = c("postal-code", "name"),
      borderColor = "transparent") %>%
  hc_colorAxis(dataClasses = color_classes(c(seq(0, 10, by = 2), 50))) %>% 
  hc_legend(layout = "vertical", align = "right",
            floating = TRUE, valueDecimals = 0, valueSuffix = "%") 



----------------------------------------------------------------------------------
  library(highcharter)
library(forecast)

data <-
  ts(
    data = data$age65,
    start = 1992,
    end = 2018,
    frequency = 1
  )

forecast(ets(data),
         h = 48 / 12,
         level = 95) %>%
  hchart %>%
  hc_tooltip(
    valuePrefix = "There were ",
    valueSuffix = " older people",
    valueDecimals = 0
  ) %>%
  hc_title(text = "Older Population Forecast for Taiwan")