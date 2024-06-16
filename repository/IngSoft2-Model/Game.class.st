Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'collectionOfDice',
		'amountOfFuel',
		'collectionOfSpaceships',
		'turnManager',
		'finishLine',
		'anAmountOfIndex',
		'board'
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

	^ board
]

{ #category : #action }
Game >> checkAndHandleFuelDepletionFor: nextSpaceship [

	nextSpaceship amountOfFuel = 0 ifTrue: [
		turnManager lostTurns: 2 by: nextSpaceship.
		nextSpaceship loadFuel ]
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

	anAmountOfIndex := aBoardCreator cells * aBoardCreator laps.

	finishLine := OrderedCollection
		              with: aBoardCreator cells
		              with: aBoardCreator laps.

	collectionOfDice := aCollectionOfDice.
	amountOfFuel := collectionOfDice amountOfFaces * 2.

	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: anAmountOfSpaceships
		                          withAmountOfFuel: amountOfFuel
		                          indexCalculateWith: aBoardCreator cells.

	turnManager := TurnManager manage: collectionOfSpaceships.

	board := aBoardCreator
		         createBoardFor: self
		         with: turnManager
		         andMaxThrowOf: collectionOfDice amountOfFaces
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

	| positionOfSpaceship nextSpaceship throwResult cellOfSpaceship indexOfSpaceship |
	nextSpaceship := turnManager nextTurn.

	throwResult := self throwDice: nextSpaceship.

	positionOfSpaceship := nextSpaceship objectPosition.
	indexOfSpaceship := positionOfSpaceship index.

	indexOfSpaceship + throwResult > anAmountOfIndex ifTrue: [
		throwResult := anAmountOfIndex - indexOfSpaceship ].

	((board at: indexOfSpaceship) exit: throwResult) ifFalse: [
		^ positionOfSpaceship position ].
	
	nextSpaceship move: throwResult.
	
	cellOfSpaceship := (board at: indexOfSpaceship + throwResult)
		                       enter.
		
	nextSpaceship move:
		cellOfSpaceship - nextSpaceship objectPosition cell.
		
	positionOfSpaceship := nextSpaceship objectPosition position.

	self checkAndHandleFuelDepletionFor: nextSpaceship.

	positionOfSpaceship = finishLine ifTrue: [
		turnManager := GameOver new.
		^ self finalResultsOfSpaceships ].

	^ positionOfSpaceship
]

{ #category : #results }
Game >> rankingOfSpaceships [

	| sortedSpaceships numberOfSpaceshipsToTake |
	sortedSpaceships := collectionOfSpaceships ranking.
	numberOfSpaceshipsToTake := sortedSpaceships size min: 3.

	^ sortedSpaceships first: numberOfSpaceshipsToTake
]

{ #category : #action }
Game >> reloadSpaceship [

	| nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	nextSpaceship loadFuel
]

{ #category : #initialization }
Game >> resetSpaceshipsToCellOne [
	| aSpaceship |
	1 to: collectionOfSpaceships spaceships size do: [ :index |
		aSpaceship := collectionOfSpaceships  spaceships at: index.
		aSpaceship objectPosition resetToOne ]
]

{ #category : #'as yet unclassified' }
Game >> throwDice: aSpaceship [

	| throwResult maxThrow |
	maxThrow := collectionOfDice amountOfFaces.
	throwResult := collectionOfDice throw.
	throwResult = maxThrow ifTrue: [ aSpaceship changeCapacity: 1 ].
	^ throwResult
]

{ #category : #results }
Game >> winner [

	^ collectionOfSpaceships ranking at: 1
]
