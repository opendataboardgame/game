# Open Data Board Game

The Open Data Board Game is a board game built around the creation of tools using data.

This repo will contain all the things that are needed to create the game. It is a work in progress as we move from prototype to production.

Some elements of the game are difficult to print as presented (namely the data tiles, see below).

Besides these things you will need:

* cones or counters for 4-5 players, each in a different colour (approximately 15 cones or counters per player)
* three black counters for the world board

## How to create the cards

Assuming you already have rvm installed:

```
$ rvm use 2.2
$ bundle install
$ bundle exec rake
```

Look in the `_output` folder for the generated cards.

## How to create the hexagon tiles

The graphics for the hexagon tiles are in [components/DataTiles](https://github.com/opendataboardgame/game/tree/master/components/DataTiles). These are generated to be printed by Gamecrafter as [small hex tiles on Gamecrafter](https://www.thegamecrafter.com/publish/product/SmallHexTile). You should be able to use the templates linked from those pages (eg the [proofing overlay](https://www.thegamecrafter.com/overlays/smallhextile.png)) to cut out a template to size the tiles, which you then use to cut out the tiles themselves.
