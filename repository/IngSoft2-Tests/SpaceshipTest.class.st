Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #move }
SpaceshipTest >> test001SpaceshipInitializeInPositionZero [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launch.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.

	self assert: (aSpaceship move: 1 on: aBoard) equals: 1
]

{ #category : #move }
SpaceshipTest >> test002SpaceshipMovesTwiceAndIsInPositionTwo [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launch.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aSpaceship move: 1 on: aBoard.

	self assert: (aSpaceship move: 1 on: aBoard) equals: 2
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test003WhenSpaceshipThenPositionReturnsZero [

| aSpaceship |
aSpaceship:= Spaceship launch .
self assert: aSpaceship position equals: 0.
]

{ #category : #tests }
SpaceshipTest >> test004WhenSpaceshipMovesTwiceThenPositionReturnsTwo [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launch.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aSpaceship move: 1 on: aBoard.
	aSpaceship move: 1 on: aBoard.
	self assert: aSpaceship position equals: 2
]

{ #category : #move }
SpaceshipTest >> test005WhenASpaceshipMovesTwiceWithTwoJumps [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launch.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	self assert: (aSpaceship move: 2 on: aBoard) equals: 2
]

{ #category : #move }
SpaceshipTest >> test006WhenSpaceshipMovesTwiceThenPositionIsThree [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launch.
	aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aSpaceship move: 2 on: aBoard.
	self assert: (aSpaceship move: 1 on: aBoard) equals: 3
]
