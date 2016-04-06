# Project Title: Racket Weather

### Statement
Our project's goal is to take weather data from [OpenWeatherMap](http://openweathermap.org/) and create two visualizations using this data.

### Analysis
We will use the various APIs and Racket libraries that we explored in FP1 and FP2. The weather API is called [OpenWeatherMap](http://openweathermap.org/).

The various Racket libraries are as follows:

1. [net/url](https://docs.racket-lang.org/net/url.html)
2. [json](https://docs.racket-lang.org/json/)
3. [racket turtle](https://docs.racket-lang.org/racket_turtle/index.html)
4. [racket/draw](https://docs.racket-lang.org/draw/index.html)
5. [racket graph](https://stchang.github.io/graph/graph.html)

### Data set or other source materials
We will be using Weather data from [OpenWeatherMap](http://openweathermap.org/). This data will be downloaded using HTTP GET requests using the net/url library, and stored in Racket as JSON data. This portion was already explored in [Jason's](https://github.com/JasonD94) [FP1](https://github.com/JasonD94/FP1), and should be manageable.

### Deliverable and Demonstration
Huy and JT will create two separate visualizations that will use the data that Jason's weather program generates. We are planning for the visualizations to create a plotted graph that will have the highs and lows of each day for the last 7 days. In addition, we will create a map of Massachusetts and have five cities of our choosing plotted with temperatures for each one. We then plan to have the user be able to click on one of the five cities and bring up a 7 day weather forecast of the selected city with the plotted graph below displaying the weather conditions.

Here is an example of what we are planning on doing for the forecast page: ![Alt Text](https://github.com/oplS16projects/Racket-Weather/blob/master/Example.PNG)

The program will be interactive, as you will be able to select on of the five cities that we gather data for. Also, it will update the data whenever the user clicks on a city, so the data will always be updated.

### Evaluation of Results
If a we can get JSON data, and plot it on a graph, we're happy. ツ

## Architecture Diagram
![Alt Text](https://github.com/oplS16projects/Racket-Weather/blob/master/Diagram.PNG)

This diagram shows all the pieces to our project. At the top, you have Jason's weather data program which will generate JSON data. JT's map program will generate a map listing the five cities that have weather visualizations. Clicking on any of the five cities will launch both JT's and Huy's visualization programs, which will pull in the JSON data that Jason generated in his program.

## Schedule

### First Milestone (Fri Apr 15)
We plan on having data pulled from the Open Weather Map and potentially the map with one or two city plots completed. In addition, two of the seven 7-day forecast line graphs should be ready and finished.

### Second Milestone (Fri Apr 22)
More line graphs and city plots for the map and forecast page should be finished. 5/7 line plot graphs should be finished and 3/5 the city plots should be finished by this point for the map as well. JT and Huy should begin on working on the forecast page/visualization at this point.

### Final Presentation (last week of semester)
It will work. ✔

## Group Responsibilities

**Additional instructions for teams of three:**
We have permission for a team of three as seen in this [FP3 pull request.](https://github.com/oplS16projects/FP3/pull/12)

### JT Shepple @JohnShep
I will handle creating an interface to display a map with points at a few specific locations. This will be used to show the places we have data for and we will be able to click on a location to see the 7 day forecast. For the 7 day forecast I will be working along with Huy to make the forecast along with a line graph of the data.

### Huy Huynh @HuyH0114
I will be tasked with creating the plotted line graphs of the weather temperatures and also work with JT Shepple on the 7 day weather forecast page. The forecast page will show the highs, lows, and precipitation % for the selected city, and beneath the forecast will be the plotted line graphs that I will make for each city and their 7 day weather forecasts.

### Jason Downing @JasonD94
Jason is the team lead. Additionally, Jason will work on the weather data program, which will gather weather data from the OpenWeatherMap API and create JSON data that Huy and JT can use in their programs. Also, he knows Git so he'll deal with git related issues such as merging code and making sure it doesn't disappear.
