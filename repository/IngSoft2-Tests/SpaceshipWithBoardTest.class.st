Class {
	#name : #SpaceshipWithBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipWithBoardTest >> testMoveSpaceshipThenPlayWithToIlegalPositionReturnsFinishLine [

| aBoard aSpaceship |
aBoard := Board of: 15 withWormholeBeginning: 6 andEnding: 8.
aSpaceship := Spaceship launch.
aSpaceship move: 8.

self assert: (aSpaceship playWith: (LoadedDie of: 10) on: aBoard ) equals: 15.
]

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
