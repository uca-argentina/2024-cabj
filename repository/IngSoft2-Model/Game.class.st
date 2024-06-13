Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'amountOfFuel',
		'collectionOfSpaceships',
		'turnManager',
		'finishLine',
		'boardCreator'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> numberOfSpaceships: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships
		  withBoardCreator: aBoardCreator
		  playWithDice: aCollectionOfDice
]

{ #category : #'as yet unclassified' }
Game >> board [

	^ aBoard
]

{ #category : #action }
Game >> checkIf: nextSpaceship hasRunOutOfFuelAt: positionOfSpaceship [

	nextSpaceship amountOfFuel = 0 ifTrue: [
		turnManager lostTurns: 2 by: nextSpaceship.
		nextSpaceship loadFuel: amountOfFuel ]
]

{ #category : #results }
Game >> finalLapsOfSpaceships [

	^ collectionOfSpaceships lapsOfSpaceships
]

{ #category : #results }
Game >> finalPositionOfSpaceships [

	^ collectionOfSpaceships cellsOfSpaceships
]

{ #category : #results }
Game >> finalResultsOfSpaceships [

	^ collectionOfSpaceships positionsOfSpaceships
]

{ #category : #results }
Game >> getRankingOfSpaceships [

	^ collectionOfSpaceships getRanking first: 3
]

{ #category : #results }
Game >> getWinner [

	^ collectionOfSpaceships getRanking at: 1
]

{ #category : #initialization }
Game >> initializeNumberOfSpaceships: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [
	
	boardCreator := aBoardCreator .

	finishLine := OrderedCollection
		              with: boardCreator getCells
		              with: boardCreator getLaps.

	collectionOfDice := aCollectionOfDice.
	amountOfFuel := collectionOfDice amountOfFaces * 2.

	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: anAmountOfSpaceships
		                          withAmountOfFuel: amountOfFuel
		                          indexCalculateWith: boardCreator getCells.

	turnManager := TurnManager manage: collectionOfSpaceships.

	aBoard := boardCreator createBoardFor: collectionOfSpaceships with: turnManager andMaxThrowOf: (collectionOfDice amountOfFaces) on:self.

]

{ #category : #action }
Game >> moveSpaceship [

	| positionOfSpaceship nextSpaceship throwResult positionOfNextSpaceship currentPosition anAmountOfIndex |
	anAmountOfIndex := boardCreator getCells * boardCreator getLaps.
	nextSpaceship := turnManager nextTurn.

	throwResult := collectionOfDice throw.

	positionOfNextSpaceship := nextSpaceship objectPosition.
	currentPosition := positionOfNextSpaceship getIndex.

	currentPosition + throwResult > anAmountOfIndex ifTrue: [
		throwResult := anAmountOfIndex - currentPosition ].

	((aBoard at: currentPosition) exit: throwResult) ifFalse: [
		^ positionOfNextSpaceship getPosition ].

	positionOfSpaceship := (aBoard at: currentPosition + throwResult)
		                       enter.
	nextSpaceship move: throwResult.
	nextSpaceship move: positionOfSpaceship - nextSpaceship objectPosition cell .
	positionOfSpaceship := nextSpaceship objectPosition getPosition.

	self
		checkIf: nextSpaceship
		hasRunOutOfFuelAt: (positionOfSpaceship at: 1).

	positionOfSpaceship = finishLine ifTrue: [
		turnManager := GameOver new.
		^ self finalResultsOfSpaceships ].

	^ positionOfSpaceship
]

{ #category : #action }
Game >> reloadSpaceship [
	| nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	nextSpaceship loadFuel: amountOfFuel.


]

{ #category : #initialization }
Game >> resetSpaceshipsToCellOne [
	| aSpaceship |
	1 to: collectionOfSpaceships spaceships size do: [ :index |
		aSpaceship := collectionOfSpaceships  spaceships at: index.
		aSpaceship objectPosition resetToOne ]
]
