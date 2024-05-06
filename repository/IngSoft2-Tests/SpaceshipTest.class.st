Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #move }
SpaceshipTest >> testSpaceshipInitializeInPositionZero [

	| aSpaceship aBoard |
	aSpaceship := SpaceshipWithId launch: 1.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.

	self assert: (aSpaceship move: 1 on: aBoard) equals: 1
]

{ #category : #move }
SpaceshipTest >> testSpaceshipMovesTwiceAndIsInPositionTwo [

	| aSpaceship aBoard |
	aSpaceship := SpaceshipWithId launch: 1.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aSpaceship move: 1 on: aBoard.

	self assert: (aSpaceship move: 1 on: aBoard) equals: 2
]

{ #category : #move }
SpaceshipTest >> testWhenASpaceshipMovesTwiceWithTwoJumps [

	| aSpaceship aBoard |
	aSpaceship := SpaceshipWithId launch: 1.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	self assert: (aSpaceship move: 2 on: aBoard) equals: 2
]

{ #category : #move }
SpaceshipTest >> testWhenSpaceshipMovesTwiceThenPositionIsThree [

	| aSpaceship aBoard |
	aSpaceship := SpaceshipWithId launch: 1.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aSpaceship move: 2 on: aBoard.
	self assert: (aSpaceship move: 1 on: aBoard) equals: 3
]

{ #category : #tests }
SpaceshipTest >> testWhenSpaceshipMovesTwiceThenPositionReturnsTwo [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launch.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aSpaceship move: 1 on: aBoard.
	aSpaceship move: 1 on: aBoard.
	self assert: aSpaceship position equals: 2
]

{ #category : #'tests - initialization' }
SpaceshipTest >> testWhenSpaceshipThenPositionReturnsZero [

| aSpaceship |
aSpaceship:= Spaceship launch .
self assert: aSpaceship position equals: 0.
]
