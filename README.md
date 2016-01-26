# Open Data Board Game

The Open Data Board Game is a board game built around the creation of tools using data.

This repo will contain all the things that are needed to create the game. It is a work in progress as we move from prototype to production.

Some elements of the game are difficult to print as presented (namely the data tiles).

Besides these things you will need:

* cones or counters for 4-5 players, each in a different colour (approximately 15 cones or counters per player)
* three black counters for the world board
* a black marker, to add **private data** dots or stripes to 2x data tiles in each colour.

## How to create the cards

Assuming you already have rvm installed:

```
$ rvm use 2.2
$ bundle install
$ rake
```

Look in the `_output` folder for the generated cards.
