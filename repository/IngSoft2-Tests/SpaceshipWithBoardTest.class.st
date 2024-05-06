Class {
	#name : #SpaceshipWithBoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #playWithOn }
SpaceshipWithBoardTest >> testMoveSpaceshipThenPlayWithToIlegalPositionReturnsFinishLine [

	| aBoard aSpaceship |
	aBoard := Board of: 15 withWormholeBeginning: 6 andEnding: 8.
	aSpaceship := Spaceship launch.
	aSpaceship move: 8 on: aBoard.

	self
		assert: (aSpaceship
				 playWith: (OrderedCollection with: (LoadedDie of: 10))
				 on: aBoard)
		equals: 15
]

{ #category : #wormhole }
SpaceshipWithBoardTest >> testSpaceshipPlaysWithBoardFallsOnWormholeFromEndToStart [

| aBoard aSpaceship |
aBoard := Board of: 15 withWormholeBeginning: 3 andEnding: 6.
aSpaceship := Spaceship launch.

self assert: (aSpaceship playWith: (OrderedCollection with:(LoadedDie of: 6)) on: aBoard ) equals: 3.
]

{ #category : #wormhole }
SpaceshipWithBoardTest >> testSpaceshipPlaysWithBoardFallsOnWormholeFromStartToEnd [

| aBoard aSpaceship |
aBoard := Board of: 15 withWormholeBeginning: 6 andEnding: 8.
aSpaceship := Spaceship launch.

self assert: (aSpaceship playWith: (OrderedCollection with:(LoadedDie of: 6)) on: aBoard ) equals: 8.
]
