# Shiny Tip

My tips for RShiny applications

### Basics
* if you - like me - create hacky shiny applications[^1] use `options(warn=-1)`
* create an `app.R` with subscripts `ui.R` and `server.R`
* in this `app.R` call in your packages:
```
library(shinyjs)
library(shiny)
library(shinythemes)
library(ggplot2); theme_set(theme_linedraw())
library(tidyr)
```

### More information
* check out a working example[^2] at https://sap218.shinyapps.io/fashun_app/ or [check the code in the repo](https://github.com/sap218/fashun "fashun github repository") 
* don't hesitate to create an `issue` if you have a question, or email me :-) 
* most of my tips come from working with clinical data that can't downloaded locally and so needs a lot of server interaction


[^1]: don't worry the code isn't terrible, it works but i use `df$age` in `ggplot aes()` which shows a lot of warnings
[^2]: or maybe you would like to [read the blod i wrote about it](https://sap218.github.io/fashun/ "my blog of fashun")  
