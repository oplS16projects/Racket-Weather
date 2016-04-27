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
* **Data abstraction** is used to provide access to the elements of the RSS feed.
* The objects in the OpenGL world are represented with **recursive data structures.**
* **Symbolic language processing techniques** are used in the parser.
*
 **Basic Recursion** was used to grab the min and max of values from the JSON file

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
####Mark (a team member)
Each team member should identify a favorite expression or procedure, written by them, and explain what it does. Why is it your favorite? What OPL philosophy does it embody?
Remember code looks something like this:
```scheme
(map (lambda (x) (foldr compose functions)) data)
```
####Lillian (another team member)
This expression reads in a regular expression and elegantly matches it against a pre-existing hashmap....
```scheme
(let* ((expr (convert-to-regexp (read-line my-in-port)))
             (matches (flatten
                       (hash-map *words*
                                 (lambda (key value)
                                   (if (regexp-match expr key) key '()))))))
  matches)
```

##Additional Remarks
Anything else you want to say in your report. Can rename or remove this section.

#How to Download and Run
You may want to link to your latest release for easy downloading by people (such as Mark).

Include what file to run, what to do with that file, how to interact with the app when its running, etc.
