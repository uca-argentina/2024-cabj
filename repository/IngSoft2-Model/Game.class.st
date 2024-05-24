Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'collectionOfSpaceships',
		'turnManager',
		'dictionaryOfPositions',
		'numberOfLaps',
		'amountOfFuel'
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

{ #category : #action }
Game >> checkIf: nextSpaceship hasRunOutOfFuelAt: positionOfSpaceship [

	positionOfSpaceship = 1 ifTrue: [
		turnManager lostTurns: 2 by: nextSpaceship.
		nextSpaceship loadFuel: amountOfFuel ]
]

{ #category : #initialization }
Game >> collectSpaceships: anAmountOfSpaceships [

	collectionOfSpaceships := OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [
		collectionOfSpaceships add: (Spaceship launchWithFuel: amountOfFuel ) ].

	Spaceship initialize
]

{ #category : #action }
Game >> finalPositionOfSpaceships [

	dictionaryOfPositions := Dictionary new.
	collectionOfSpaceships do: [ :spaceship |
		dictionaryOfPositions at: spaceship getId put: (spaceship position at: 1) ].

	^ dictionaryOfPositions
]

{ #category : #accessing }
Game >> getWinner [

	| maxPosition |
	 maxPosition := (dictionaryOfPositions values max).
	^ dictionaryOfPositions keys detect: [ :key |
		  (dictionaryOfPositions at: key) = maxPosition ]
]

{ #category : #initialization }
Game >> initializeNumberOfSpaceships: anAmountOfSpaceships boardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: aCollectionOfDice [

	aBoard := Board
		          ofCells: anAmountOfBoxes
					 numberOfLaps: 1
		          withWormholeBeginning: (beginningAndEnd at: 1)
		          andEnding: (beginningAndEnd at: 2).
	
	collectionOfDice:= aCollectionOfDice  .
	
	amountOfFuel:= collectionOfDice amountOfFaces *2.
	
	self collectSpaceships: anAmountOfSpaceships.
	
	turnManager := TurnManager manage: collectionOfSpaceships.
]

{ #category : #action }
Game >> moveSpaceship [

	| positionOfSpaceship nextSpaceship throwResult |
	nextSpaceship := turnManager nextTurn.

	throwResult := aBoard
		               adjustMovementWithinBoundsFrom:
		               (nextSpaceship position at: 1)
		               by: collectionOfDice throw.

	positionOfSpaceship := nextSpaceship move: throwResult on: aBoard.
	
	self checkIf: nextSpaceship hasRunOutOfFuelAt: positionOfSpaceship.

	positionOfSpaceship = aBoard finishLine ifTrue: [
		turnManager := GameOver new.
		^ self finalPositionOfSpaceships ].

	^ positionOfSpaceship
]

{ #category : #action }
Game >> reloadSpaceship [
	| nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	nextSpaceship loadFuel: amountOfFuel.


]
