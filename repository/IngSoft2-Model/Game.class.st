Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'collectionOfSpaceships',
		'turnManager'
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
		collectionOfSpaceships add: Spaceship launch ]
]

{ #category : #action }
Game >> endOfGame [ 

| collectionPositions |
	turnManager := GameOver new.
	collectionPositions := collectionOfSpaceships collect: [ :spaceship |
		                       spaceship position ].
	^ collectionPositions
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
	| positionOfSpaceship nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	positionOfSpaceship := nextSpaceship
		                       playWith: collectionOfDice 
		                       on: aBoard.

	positionOfSpaceship = aBoard finishLine ifTrue: [^self endOfGame].

	^ positionOfSpaceship
]
