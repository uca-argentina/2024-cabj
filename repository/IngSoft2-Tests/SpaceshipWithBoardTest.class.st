Class {
	#name : #SpaceshipWithBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipWithBoardTest >> testSpaceshipPlaysWithBoardFallsOnWormholeFromEndToStart [

| aBoard aSpaceship |
aBoard := Board of: 15 withWormholeBeginning: 3 andEnding: 6.
aSpaceship := Spaceship launch.

self assert: (aSpaceship playWith: (LoadedDie of: 6) on: aBoard ) equals: 3.
]

{ #category : #tests }
SpaceshipWithBoardTest >> testSpaceshipPlaysWithBoardFallsOnWormholeFromStartToEnd [

| aBoard aSpaceship |
aBoard := Board of: 15 withWormholeBeginning: 6 andEnding: 8.
aSpaceship := Spaceship launch.

self assert: (aSpaceship playWith: (LoadedDie of: 6) on: aBoard ) equals: 8.
]
