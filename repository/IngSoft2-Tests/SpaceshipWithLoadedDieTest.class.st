Class {
	#name : #SpaceshipWithLoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipWithLoadedDieTest >> test003 [

| aSpaceship aLoadedDie |
aSpaceship := Spaceship launch. 
aSpaceship move: 1.
aLoadedDie := LoadedDie of: 4.

self assert: (aSpaceship playWith: aLoadedDie) equals: 5.
]

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testASpaceshipPlaysWithALoadedDieThenReturnsThree [

| aSpaceship aLoadedDie aBoard |
aSpaceship := Spaceship launch. 
aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
aLoadedDie := LoadedDie of: 3.

self assert: (aSpaceship playWith: aLoadedDie on: aBoard) equals: 3.
]

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testWhenSpaceshipInPositionOnePlaysWithLoadedDieOfFourThenThePositionIsFive [

| aSpaceship aLoadedDie aBoard |
aSpaceship := Spaceship launch. 
aSpaceship move: 1.
aLoadedDie := LoadedDie of: 4.
aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.

self assert: (aSpaceship playWith: aLoadedDie on: aBoard) equals: 5.
]

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testWhenSpaceshipPlaysWithALoadedDieThenReturnsTheAmountOfFaces [

| aSpaceship aLoadedDie aBoard |
aSpaceship := Spaceship launch. 
aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
aLoadedDie := LoadedDie of: 4.

self assert: (aSpaceship playWith: aLoadedDie  on: aBoard) equals: 4.
]
