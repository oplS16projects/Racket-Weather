# Project Title: Racket Weather

### Statement
Our project's goal is to take weather data from  [OpenWeatherMap](http://openweathermap.org/) and create two different visualizations using this data.

### Analysis
We will use the various APIs and Racket libraries that we explored in FP1 and FP2. The weather API is called  [OpenWeatherMap](http://openweathermap.org/). 

The various Racket libraries are as follows:
1. [net/url](https://docs.racket-lang.org/net/url.html)
2. [json](https://docs.racket-lang.org/json/)
3. [racket turtle](https://docs.racket-lang.org/racket_turtle/index.html)
4. [racket/draw](https://docs.racket-lang.org/draw/index.html)
5. [racket graph](https://stchang.github.io/graph/graph.html)

### Data set or other source materials
We will be using Weather data from [OpenWeatherMap](http://openweathermap.org/). This data will be downloaded using HTTP GET requests using the net/url library, and stored in Racket as JSON data. This portion was already explored in [Jason's](https://github.com/JasonD94) [FP1](https://github.com/JasonD94/FP1).

### Deliverable and Demonstration
There will be some sort of visualization (Map, Graph, Chart etc) in two separate programs that Huy and JT will create. These programs will utilize Jason's Racket program which will gather the data.
We were planning for vizualizations to create a plotted graph that will have information of the highs and lows of each day or every few days. In addition, mimic a live map of Massachusetts and have five cities of our choosing plotted with temperatures for each one. We then plan to have the user be able to click on one of the five cities and bring up a 7 day weather forecast of the selected city with the plotted graph below displaying the weather conditions. Basically here is an example of what we are planning on doing for the forecast page. [!Alt Text](https://github.com/oplS16projects/Racket-Weather/blob/master/Example.PNG)

### Evaluation of Results
If a we can get JSON data, and plot it on a map, we're happy.

## Architecture Diagram
TODO at some point.

## Schedule

### First Milestone (Fri Apr 15)
Something

### Second Milestone (Fri Apr 22)
More of Something

### Final Presentation (last week of semester)
It will work.

## Group Responsibilities

**Additional instructions for teams of three:** 
Yep, we have permission as seen in this [FP3 pull request.](https://github.com/oplS16projects/FP3/pull/12)

### JT Shepple @JohnShep
I will handle creating an interface to display a map with points at a few specific locations. This will be used to show the places we have data for and we will be able to click on a location to see the 7 day forcast. For the 7 day forcast I will be working along with Huy to make the forcast along with a line graph of the data.

### Huy Huynh @HuyH0114
I will be tasked with creating the plotted line graphs of the weather temperatures and also work with JT Shepple on the 7 day weather forecast page. The forecast page will show the highs, lows, and precipitation % for the selected city, and beneath the forecast will be the plotted line graphs that I will make for each city and their 7 day weather forecasts. 

### Jason Downing @JasonD94
Jason is team lead. Additionally, Jason will work on the weather data program. Also, he knows Git so he'll deal with git stuff.
