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

{ #category : #accessing }
Game >> board [

	^ aBoard
]

{ #category : #action }
Game >> checkAndHandleFuelDepletionFor: nextSpaceship at: positionOfSpaceship [

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

{ #category : #initialization }
Game >> initializeNumberOfSpaceships: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [
	
	boardCreator := aBoardCreator .

	finishLine := OrderedCollection
		              with: boardCreator cells
		              with: boardCreator laps.

	collectionOfDice := aCollectionOfDice.
	amountOfFuel := collectionOfDice amountOfFaces * 2.

	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: anAmountOfSpaceships
		                          withAmountOfFuel: amountOfFuel
		                          indexCalculateWith: boardCreator cells.

	turnManager := TurnManager manage: collectionOfSpaceships.

	aBoard := boardCreator createBoardFor: collectionOfSpaceships with: turnManager andMaxThrowOf: (collectionOfDice amountOfFaces) on:self.

]

{ #category : #action }
Game >> moveAllTheSpaceshipsThatAreNotPlayingWith: anAmountOfMovements [ 

	| aSpaceshipAux collectionMinusSpaceship aSpaceship |
	aSpaceship:= turnManager spaceshipPlaying .
	collectionMinusSpaceship :=( collectionOfSpaceships spaceships) copy.
	collectionMinusSpaceship remove: aSpaceship.
	1 to: collectionMinusSpaceship size do: [ :index |
		aSpaceshipAux := (collectionMinusSpaceship at: index).
		aSpaceshipAux move: anAmountOfMovements. ]
]

{ #category : #action }
Game >> moveSpaceship [

	| positionOfSpaceship nextSpaceship throwResult positionOfNextSpaceship currentPosition anAmountOfIndex |
	anAmountOfIndex := boardCreator cells * boardCreator laps.
	nextSpaceship := turnManager nextTurn.

	throwResult := collectionOfDice throw.

	positionOfNextSpaceship := nextSpaceship objectPosition.
	currentPosition := positionOfNextSpaceship index.

	currentPosition + throwResult > anAmountOfIndex ifTrue: [
		throwResult := anAmountOfIndex - currentPosition ].

	((aBoard at: currentPosition) exit: throwResult) ifFalse: [
		^ positionOfNextSpaceship position ].

	positionOfSpaceship := (aBoard at: currentPosition + throwResult)
		                       enter.
	nextSpaceship move: throwResult.
	nextSpaceship move: positionOfSpaceship - nextSpaceship objectPosition cell .
	positionOfSpaceship := nextSpaceship objectPosition position.

	self
		checkAndHandleFuelDepletionFor: nextSpaceship
		at: (positionOfSpaceship at: 1).

	positionOfSpaceship = finishLine ifTrue: [
		turnManager := GameOver new.
		^ self finalResultsOfSpaceships ].

	^ positionOfSpaceship
]

{ #category : #results }
Game >> rankingOfSpaceships [

	^ collectionOfSpaceships ranking first: 3
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

{ #category : #results }
Game >> winner [

	^ collectionOfSpaceships ranking at: 1
]
