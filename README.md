# lem_in
Project in collaboration with @skpn

## Introduction

Lem-in is an ant-colony optimization project.
It consists in finding the optimal combination of paths in an anthill to move x ants from the 'start' room to the 'end' room.
Each room can contain only one ant at a time, which prevents from paths combinations which have common rooms.
At each turn, each ant can move from one room to another if both are directly connected.
The goal is to minimize the number of turns required to move all ants from start to end.

The whole subject is available in the repository in both French and English.

## The map

Below is the valid format of a map:

`##start`<br/>
`1 23 3`<br/>
`2 16 7`<br/>
`#comment`<br/>
`3 16 3`<br/>
`4 16 5`<br/>
`5 9 3`<br/>
`6 1 5`<br/>
`7 4 8`<br/>
`##end`<br/>
`0 9 5`<br/>
`0-4`<br/>
`0-6`<br/>
`1-3`<br/>
`4-3`<br/>
`5-2`<br/>
`3-5`<br/>
`#comment`<br/>
`4-2`<br/>
`2-1`<br/>
`7-6`<br/>
`7-2`<br/>
`7-4`<br/>
`6-5`<br/>

which graphically translates in

           _______________
          /               |<br/>
  ______[5]----[3]----[1] |<br/>
 /              |    /    |<br/>
[6]-----[0]----[4]  /     |<br/>
 \    _________/ | /      |<br/>
  \  /         [2]/_______|<br/>
  [7]___________|          <br/> 
  
  
## Algorithm
  
We decided not to implement a well-known algorithm (such as Edmonds Karp) to draw a custom-made algorithm. Nevertheless, we achieve excellent performances on average on the most difficult maps. 
  
## Installation
  
To clone the repository, type `gcl https://github.com/hehlinge42/lem_in.git` on a UNIX terminal.
The repository contains the following folders:
- libft: contains the custom 42 library to perform basic string and list operations
- srcs: the sources of the program
- includes: the corresponding headers
- maps: some maps provided as examples

it also features the executable `generator`, that enables to generate random maps.

## Run

To compile the project, type `make` at the root of the repository

Usage: `./lem_in < input_map`
Ex: `./lem_in < maps/basic`
To generate a map, type `./generator` followed by a valid option (to print usage, type `./generator --help`)
The most difficult maps are generated by `./generator --big-superposition` as these maps have thousands of rooms with overlapping paths.
