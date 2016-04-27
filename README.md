#RACKET WEATHER V1.0

##Authors
Jason Downing
Huy Huynh
JT Shepple

##Overview
The general idea for our project is to mimic a 10-day weather forcast, where our program displays two type of visualizations.
One of the visualiazation shows highs and lows with an image of the condition.
The other viz is a line graph plotting the highs, lows, and average temperature of certain cities.
The project is split into several parts. The first part retrieves real weather data into several JSON files and
the second part creates two different visualizations from the retrieved data.

##Screenshot
This was our inital concept and visualization of what we wanted to mimic
<p align="center">
	<img src="https://github.com/oplS16projects/Racket-Weather/blob/master/Example.png">
<p>

This is what we actually have outputted
<p align="center">
	<img src="https://github.com/HuyH0114/Racket-Weather/blob/master/Racket_Weather_Output_Diagram.PNG">
<p>


##Concepts Demonstrated
* **
* **Recursion** was used to grab the min and max of values from the JSON file

##External Technology and Libraries
Racket Libraries that we used include the following:

1. [net/url](https://docs.racket-lang.org/net/url.html)
2. [json](https://docs.racket-lang.org/json/)
3. [plot](https://docs.racket-lang.org/plot/)
4. [2htdp/batch-io](https://docs.racket-lang.org/teachpack/2htdpbatch-io.html)
5. [2htdp/image](https://docs.racket-lang.org/teachpack/2htdpimage.html)

We also used one external API, [the OpenWeatherMap API](http://openweathermap.org/api),
to retrieve real weather data for several US cities.

##Favorite Scheme Expressions
####Jason Downing
Weather Expression
```
;; Stuff
```
####Huy Huynh
Magic Viz Expression
```
;; PUT CODE HERE
```

###JT Shepple
Magic Viz Expression
```
;; PUT CODE HERE
```

##Additional Remarks
This project is cool.

#How to Download and Run
Download the zip, or git clone the repository from the following link:
[Racket Weather](https://github.com/oplS16projects/Racket-Weather)

To run, open "racket_weather.rkt" in DrRacket. It can be found the in the "Source"
sub directory of the Git Repository. Once the file is open, click "Run" and the
file will run "get_weather.rkt", "JT_viz.rkt", and "Huy_viz.rkt" files. The REPL
will show the Visualations that are created based on the JSON data found in the
JSON sub directory of the Source directory.
