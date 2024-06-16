Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'collectionOfDice',
		'collectionOfSpaceships',
		'turnManager',
		'finishLine',
		'anAmountOfIndex',
		'board',
		'spaceshipsCardHands',
		'aActiveDeck',
		'currentSpaceship'
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

{ #category : #activation }
Game >> activatePermanentCard: aCard [

	| currentSpaceshipCardHand cardToActivate |
	currentSpaceshipCardHand := spaceshipsCardHands at:
		                            currentSpaceship id.
	cardToActivate := currentSpaceshipCardHand activateCard: aCard.
	aActiveDeck activate: cardToActivate.

]

{ #category : #accessing }
Game >> activeCards [

	^ aActiveDeck activeCards
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

	aActiveDeck := ActiveDeck startGame.

	finishLine := OrderedCollection
		              with: aBoardCreator cells
		              with: aBoardCreator laps.

	collectionOfDice := aCollectionOfDice.

	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: anAmountOfSpaceships
		                          withAmountOfFuel:
		                          collectionOfDice amountOfFaces * 2
		                          indexCalculateWith: aBoardCreator cells.

	spaceshipsCardHands := (1 to: anAmountOfSpaceships) collect: [:index |
		                       SpaceshipCardHand startGame ].
	SpaceshipCardHand initialize.

	turnManager := TurnManager manage: collectionOfSpaceships.
	currentSpaceship := turnManager nextTurn.

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

	| positionOfSpaceship throwResult cellOfSpaceship indexOfSpaceship |
	throwResult := self throwDice: currentSpaceship.

	positionOfSpaceship := currentSpaceship objectPosition.
	indexOfSpaceship := positionOfSpaceship index.

	indexOfSpaceship + throwResult > anAmountOfIndex ifTrue: [
		throwResult := anAmountOfIndex - indexOfSpaceship ].

	((board at: indexOfSpaceship) exit: throwResult) ifFalse: [
		^ positionOfSpaceship position ].

	currentSpaceship move: throwResult.

	cellOfSpaceship := (board at: indexOfSpaceship + throwResult) enter.

	currentSpaceship move:
		cellOfSpaceship - currentSpaceship objectPosition cell.

	positionOfSpaceship := currentSpaceship objectPosition position.

	self checkAndHandleFuelDepletionFor: currentSpaceship.

	positionOfSpaceship = finishLine ifTrue: [
		collectionOfDice := GameOver new.
		^ self finalResultsOfSpaceships ].

	currentSpaceship := turnManager nextTurn.

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

{ #category : #action }
Game >> throwDice: aSpaceship [

	| throwResult maxThrow randomValue |
	randomValue := Random new next.
	throwResult := collectionOfDice throw.
	maxThrow := collectionOfDice amountOfFaces.
	throwResult = maxThrow ifTrue: [
		randomValue < 0.8
			ifTrue: [ aSpaceship changeCapacity: 1 ]
			ifFalse: [ aSpaceship changeCapacity: -1 ] ].
	^ throwResult
]

{ #category : #results }
Game >> winner [

	^ collectionOfSpaceships ranking at: 1
]
