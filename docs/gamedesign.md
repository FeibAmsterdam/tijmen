Game Design
===========
Draft

Basics
------
This game, the title is yet to be announced, will be a topdown shooter.

The goal of the game is to complete each level and reach some form of end (like
a boss?).

The two uniq sellings points:

* __The Grapple Hook__, a way to move around quicker then just walking.
* __Portal Gun__, a gun that shoots two types of portals to solve puzzles.

These two will be described below.


Grapple Hook
------------
The idea: you shoot a hook in the direction of your crosshair and when it
collides with a wall (or something else) the player will be pulled towards
the collision point.

When the object that the hook collides with is static the player will only move,
when it's non-static the player and the target object will move towards
each-other based on their mass.


Portal Gun
----------
A weapon that shoots two instances of a 'portal' that are linked to eachother.
When an object moves through one portal it'll exit out of the other.
These objects will maintain their velocity (although orientation might change if
the portals are unaligned). When one of the portals types is shot the current
will disappear (so you can't make portals through portals).

