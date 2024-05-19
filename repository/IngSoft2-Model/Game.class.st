Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'collectionOfSpaceships',
		'turnManager',
		'dictionaryOfPositions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> numberOfSpaceships: anAmountOfSpaceships boardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: aCollectionOfDice [
	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships 
		  boardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd
		  playWithDice: aCollectionOfDice.
]

{ #category : #initialization }
Game >> collectSpaceships: anAmountOfSpaceships [

	collectionOfSpaceships := OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [
		collectionOfSpaceships add: Spaceship launch ].

	Spaceship resetCounter
]

{ #category : #action }
Game >> finalPositionOfSpaceships [

	dictionaryOfPositions := Dictionary new.
	collectionOfSpaceships do: [ :spaceship |
		dictionaryOfPositions at: spaceship getId put: spaceship position ].

	^ dictionaryOfPositions
]

{ #category : #'as yet unclassified' }
Game >> getWinner [
	^1.
]

{ #category : #initialization }
Game >> initializeNumberOfSpaceships: anAmountOfSpaceships boardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: aCollectionOfDice [

	aBoard := Board
		          of: anAmountOfBoxes
		          withWormholeBeginning: (beginningAndEnd at: 1)
		          andEnding: (beginningAndEnd at: 2).
	
	self collectSpaceships: anAmountOfSpaceships.
	
	turnManager := TurnManager manage: collectionOfSpaceships.
	
	collectionOfDice:= aCollectionOfDice  .
]

{ #category : #action }
Game >> moveSpaceship [

	| positionOfSpaceship nextSpaceship throwResult |
	nextSpaceship := turnManager nextTurn.

	throwResult := aBoard
		               adjustMovementWithinBoundsFrom:
		               nextSpaceship position
		               by: collectionOfDice throw.

	positionOfSpaceship := nextSpaceship move: throwResult on: aBoard.

	positionOfSpaceship = aBoard finishLine ifTrue: [
		turnManager := GameOver new.
		^ self finalPositionOfSpaceships ].

	^ positionOfSpaceship
]
