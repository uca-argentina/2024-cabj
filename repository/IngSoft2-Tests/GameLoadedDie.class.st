Class {
	#name : #GameLoadedDie,
	#superclass : #Object,
	#instVars : [
		'aSpaceship',
		'aBoard',
		'collectionOfDice',
		'collectionOfSpaceships',
		'turnManager'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
GameLoadedDie class >> numberOfSpaceships: anAmountOfSpaceships boardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: aCollectionOfDice [
	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships 
		  boardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd
		  playWithDice: aCollectionOfDice .
]

{ #category : #action }
GameLoadedDie >> endOfGame [

	| collectionPositions |
	turnManager := GameOver new.
	collectionPositions := collectionOfSpaceships collect: [ :spaceship |
		                       spaceship position ].
	^ collectionPositions
]

{ #category : #initialization }
GameLoadedDie >> initializeNumberOfSpaceships: anAmountOfSpaceships boardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: aCollectionOfDice [
	
	aBoard := Board
		          of: anAmountOfBoxes
		          withWormholeBeginning: (beginningAndEnd at: 1)
		          andEnding: (beginningAndEnd at: 2).
	
	collectionOfSpaceships:= OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [ collectionOfSpaceships add: Spaceship launch ].
	turnManager:= TurnManager manage: collectionOfSpaceships .
	
	collectionOfDice :=aCollectionOfDice .
	
]

{ #category : #action }
GameLoadedDie >> moveSpaceship [

	| positionOfSpaceship nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	positionOfSpaceship := nextSpaceship
		                       playWith: collectionOfDice
		                       on: aBoard.

	positionOfSpaceship = aBoard finishLine ifTrue: [^self endOfGame].

	^ positionOfSpaceship
]
