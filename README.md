Game of life sinatra
=========

I chose to implement my backend version of game of life using ruby and Sinatra.  I only had time to get so far.  I implemented the model, which mostly works, except it runs into the same bug I ran into in javascript in that there is no built-in feature to make a deep copy of the grid.  I would need to implement that or use a gem.  Otherwise the functional logic is the same.  Most of the code is ported to ruby from my javascript implementation.

I wrote a server file that handles for the home route.  It uses my board object to populate a grid in an ERB template in the views folder.  It's an MVC framework with models/Board.rb as the Model, views/home.erb as the view and server.rb as the controller.  I got far enough to implement a post route that handles for the step function and a button on the main page that submits the value "step".  Each submission triggers a page refresh.  I pre-populated some clicked on grid cells that would be jiggling back and forth on each step if I fixed the deep copy bug.  Currently they move twice then become a stable square.  

Implementing clickable cells to turn them on and off would be a bit more of a pain.  I was considering just making each one a submit button, but I didn't get very far testing that. I also just used a global variable as persistence for the duration of a session, which wouldn't scale very well.  I would save and update the grid data to a file or database given more time.

To run
=======

```
git clone https://github.com/Nate-weeks/game-of-life-sinatra.git
bundle install
ruby server.rb
```
