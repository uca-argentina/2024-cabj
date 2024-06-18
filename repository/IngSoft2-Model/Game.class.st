Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'turnManager',
		'finishLine',
		'anAmountOfIndex',
		'board',
		'spaceshipsCardHands',
		'aActiveDeck',
		'currentSpaceship',
		'dice',
		'spaceships',
		'cellToEnter'
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

{ #category : #'instance creation' }
Game class >> numberOfSpaceshipsPlayingWithAllCards: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

	^ self new
		  initializeNumberOfSpaceshipsPlayingWithAllCards:
		  anAmountOfSpaceships
		  withBoardCreator: aBoardCreator
		  playWithDice: aCollectionOfDice
]

{ #category : #activation }
Game >> activatePermanentCard: aCard [

	| currentSpaceshipCardHand |
	currentSpaceshipCardHand := spaceshipsCardHands at:
		                            currentSpaceship id.
	(currentSpaceshipCardHand activateCard: aCard) ifFalse: [ ^ self ].
	aCard withEffectOn: self.
	aActiveDeck activate: aCard
]

{ #category : #accessing }
Game >> activeDeck [

	^ aActiveDeck
]

{ #category : #accessing }
Game >> board [

	^ board
]

{ #category : #accessing }
Game >> cardHand: aSpaceshipId [

	^ spaceshipsCardHands at: aSpaceshipId
]

{ #category : #action }
Game >> checkAndHandleFuelDepletion: aSpaceship [

	aSpaceship emptyTank ifFalse: [ ^ self ].
	turnManager lostTurns: 2 by: aSpaceship.
	aSpaceship loadFuel
]

{ #category : #accessing }
Game >> currentSpaceship [

	^ currentSpaceship
]

{ #category : #results }
Game >> finalLapsOfSpaceships [

	^ spaceships lapsOfSpaceships
]

{ #category : #results }
Game >> finalPositionOfSpaceships [

	^ spaceships cellsOfSpaceships
]

{ #category : #results }
Game >> finalResultsOfSpaceships [

	^ spaceships positionsOfSpaceships
]

{ #category : #initialization }
Game >> initializeNumberOfSpaceships: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

	anAmountOfIndex := aBoardCreator cells * aBoardCreator laps.

	aActiveDeck := ActiveDeck startGame.

	finishLine := OrderedCollection
		              with: aBoardCreator cells
		              with: aBoardCreator laps.

	dice := aCollectionOfDice.

	spaceships := CollectionOfSpaceships
		              numberOfSpaceships: anAmountOfSpaceships
		              withAmountOfFuel: dice amountOfFaces * 2
		              indexCalculateWith: aBoardCreator cells.

	spaceshipsCardHands := (1 to: anAmountOfSpaceships) collect: [ :index |
		                       SpaceshipCardHand startGame ].
	SpaceshipCardHand initialize.

	turnManager := TurnManager manage: spaceships.
	currentSpaceship := turnManager nextTurn.

	board := aBoardCreator
		         createBoardFor: self
		         with: turnManager
		         andMaxThrowOf: dice amountOfFaces
]

{ #category : #initialization }
Game >> initializeNumberOfSpaceshipsPlayingWithAllCards: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

	anAmountOfIndex := aBoardCreator cells * aBoardCreator laps.

	aActiveDeck := ActiveDeck startGame.

	finishLine := OrderedCollection
		              with: aBoardCreator cells
		              with: aBoardCreator laps.

	dice := aCollectionOfDice.

	spaceships := CollectionOfSpaceships
		              numberOfSpaceships: anAmountOfSpaceships
		              withAmountOfFuel: dice amountOfFaces * 2
		              indexCalculateWith: aBoardCreator cells.

	spaceshipsCardHands := (1 to: anAmountOfSpaceships) collect: [ :index |
		                       SpaceshipCardHand startGameWithAllCards ].
	SpaceshipCardHand initialize.

	turnManager := TurnManager manage: spaceships.
	currentSpaceship := turnManager nextTurn.


	board := aBoardCreator
		         createBoardFor: self
		         with: turnManager
		         andMaxThrowOf: dice amountOfFaces
]

{ #category : #accessing }
Game >> lastCellEffect [

	^ cellToEnter
]

{ #category : #action }
Game >> moveAllTheSpaceshipsExcept: aSpaceship withValueToMove: aNumberOfMovements [

	| aSpaceshipAux collectionMinusSpaceship |
	collectionMinusSpaceship := spaceships spaceships copy.
	collectionMinusSpaceship remove: aSpaceship.
	1 to: collectionMinusSpaceship size do: [ :index |
		aSpaceshipAux := collectionMinusSpaceship at: index.
		aSpaceshipAux move: aNumberOfMovements ]
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

	cellToEnter := board at: indexOfSpaceship + throwResult.

	cellOfSpaceship := cellToEnter enter.

	currentSpaceship move:
		cellOfSpaceship - currentSpaceship objectPosition cell.

	positionOfSpaceship := currentSpaceship objectPosition position.

	self checkAndHandleFuelDepletion: currentSpaceship.

	positionOfSpaceship = finishLine ifTrue: [
		dice := GameOver new.
		^ self finalResultsOfSpaceships ].

	currentSpaceship := turnManager nextTurn.

	^ positionOfSpaceship
]

{ #category : #results }
Game >> rankingOfSpaceships [

	| sortedSpaceships numberOfSpaceshipsToTake |
	sortedSpaceships := spaceships ranking.
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
	1 to: spaceships size do: [ :index |
		aSpaceship := spaceships spaceships at: index.
		aSpaceship objectPosition resetToOne ]
]

{ #category : #activation }
Game >> spaceshipId: anId activateInstantCard: aCard [

	| spaceshipCardHand |
	spaceshipCardHand := spaceshipsCardHands at: anId.
	(spaceshipCardHand activateCard: aCard) ifTrue: [
		aCard activateEffectOn: self forSpaceship: anId ]
]

{ #category : #accessing }
Game >> spaceships [

	^ spaceships spaceships
]

{ #category : #action }
Game >> throwDice: aSpaceship [

	| throwResult maxThrow randomValue |
	randomValue := Random new next.
	throwResult := dice throw.

	throwResult := aActiveDeck
		               applyEffectOn: throwResult
		               withCurrentSpaceship: currentSpaceship id.

	maxThrow := dice amountOfFaces.
	throwResult = maxThrow ifTrue: [
		randomValue < 0.8
			ifTrue: [ aSpaceship changeCapacity: 1 ]
			ifFalse: [ aSpaceship changeCapacity: -1 ] ].
	^ throwResult
]

{ #category : #results }
Game >> winner [

	^ spaceships ranking at: 1
]
