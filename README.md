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
This was our inital concept and visualization of what we wanted to mimic:
![Alt text]("https://github.com/oplS16projects/Racket-Weather/blob/master/Example.png" "Concept Image")

This is example output of our final program:
![Alt text]("https://github.com/oplS16projects/Racket-Weather/blob/master/Program_Output.png" "Concept Image")

##Concepts Demonstrated
* **File I/O** was used to store the weather data in JSON format. It is also used in both JT and Huy's viz programs.
* **Recursion** was used to grab the min and max of values from the JSON file

##External Technology and Libraries
Racket Libraries that we used include the following:

1. [net/url](https://docs.racket-lang.org/net/url.html)
2. [json](https://docs.racket-lang.org/json/)
3. [plot](https://docs.racket-lang.org/plot/)
4. [2htdp/batch-io](https://docs.racket-lang.org/teachpack/2htdpbatch-io.html)
5. [2htdp/image](https://docs.racket-lang.org/teachpack/2htdpimage.html)

We also used one external API, the [OpenWeatherMap API](http://openweathermap.org/api),
to retrieve real weather data for several US cities.

##Favorite Scheme Expressions
####Jason Downing
This code is from a recursive function which goes through and grabs weather data
for five cities. The code is pretty cool because I use [net/url](https://docs.racket-lang.org/net/url.html)
to grab the data off of the [OpenWeatherMap API](http://openweathermap.org/api), and I also
use [2htdp/batch-io](https://docs.racket-lang.org/teachpack/2htdpbatch-io.html) to store the JSON
data into multiple files with the cities name as the file name. This small chunk of code basically
makes our entire project possible because without the JSON files that this code generates Huy and JT would have no data
to use in their visualizations.

```scheme
      ;; False case, get JSON data
      (begin
        (set! weather_data (string->url (car _api-strings)))
        (set! get_data (get-pure-port weather_data))
        (set! weather_response (port->string get_data))
        (close-input-port get_data)

        ;; Write to file in folder "JSON", with name as "CITY_NAME_HERE.json"
        (write-file (string-append "JSON/" (car _cities)  ".json") weather_response)

        ;; Recursive call
        (get_weather (cdr _cities) (cdr _api-strings))
      )
```

####Huy Huynh
This is basically using the plot library and the "plot" procedure. What is interesting about this was that this plot is actually just a list and it uses a mixture of the "lines" and the "points" procedures. Having the plot as a list allowed me to overlap the "lines" and "points" procedures into one display or graph. Each of the these procedure takes in two seperate lists where it has the x and y coordinates needed to plot the diagram. From there the "plot", "lines" and "points" procedure had specific traits that I was able to change such as the label name, color , the x and y labels, the dimenstions of the graph, and its title. This was my favorite because I found it interesting that the procedures in the plot library were not only procedures but also their own objects within those procedures, which were those specific traits that I was able to change. The code itself looks simple but it was interesting to see that there were so much background work that was done. For example for changing the title I was able to use another procedure called string-append and pass it a list and a string I wanted to append. I was able to do all of this inside the "plot" procedure's specific object that it has.

```scheme
      (plot (list (lines (map vector  city-x-coord list_max)
                           #:color 'red
                           #:label "High"
                           )
                    (points (map vector  city-x-coord  list_max)
                            #:color 'red
                            ))
              #:x-label "Days"
              #:y-label "Temperature in Fahrenheit"
              #:width 1250
              #:height 300
              #:title (string-append name-of-city " 10-Day Forecast Graph"))
```

###JT Shepple
Magic Viz Expression

```
;; PUT CODE HERE
```

##Additional Remarks
This project is pretty cool and you should try it out! ツ

#How to Download and Run
Download the zip, or git clone the repository from the following link:
[Racket Weather](https://github.com/oplS16projects/Racket-Weather)

To run, open "racket_weather.rkt" in DrRacket. It can be found the in the "Source"
sub directory of the Git Repository. Once the file is open, click "Run" and the
file will run "get_weather.rkt", "JT_viz.rkt", and "Huy_viz.rkt" files. The REPL
will show the Visualations that are created based on the JSON data found in the
JSON sub directory of the Source directory.
