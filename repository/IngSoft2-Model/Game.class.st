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
		'cellToEnter',
		'spaceshipsWithHyperGravity'
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

{ #category : #action }
Game >> applyHyperGravityOn: aSpaceship withValue: value [
	
	spaceshipsWithHyperGravity at: aSpaceship put: value

	
	
]

{ #category : #accessing }
Game >> cardHand: aSpaceshipId [

	^ spaceshipsCardHands at: aSpaceshipId
]

{ #category : #action }
Game >> checkAndHandleFuelDepletion: aSpaceship [

	aSpaceship objectFuelTank areBothEmpty ifFalse: [ ^ self ].
	turnManager lostTurns: 2 by: aSpaceship.
	aSpaceship loadFuel
]

{ #category : #checking }
Game >> checkMoveIsPossible: throwResult for: aSpaceship [

	| positionOfSpaceship cellXLapsOfSpaceship cellXLapsOfFinishLine aux amountOfCells completedLaps nextCell |
	aux := throwResult.
	positionOfSpaceship := aSpaceship objectPosition.
	cellXLapsOfSpaceship := positionOfSpaceship cell
	                        * positionOfSpaceship lap.
	cellXLapsOfFinishLine := (finishLine at: 1) * (finishLine at: 2).
	amountOfCells := finishLine at: 1.

	(spaceshipsWithHyperGravity includesKey: aSpaceship) ifTrue: [
		throwResult < (spaceshipsWithHyperGravity at: aSpaceship)
			ifTrue: [ aux := 0 ]
			ifFalse: [ spaceshipsWithHyperGravity removeKey: aSpaceship ] ].

	cellXLapsOfSpaceship + throwResult > cellXLapsOfFinishLine ifTrue: [
		aux := cellXLapsOfFinishLine - cellXLapsOfSpaceship.
		positionOfSpaceship updateLap:
			(finishLine at: 2) - positionOfSpaceship lap ].

	positionOfSpaceship cell + aux > amountOfCells ifTrue: [
		completedLaps := positionOfSpaceship cell + throwResult - 1
		                 // amountOfCells + 1 - 1.
		positionOfSpaceship updateLap: completedLaps.
		nextCell := positionOfSpaceship cell + throwResult
		            - (completedLaps * amountOfCells).
		aux := nextCell - positionOfSpaceship cell ].

	cellXLapsOfSpaceship + aux < 1 ifTrue: [
		aux := 1 - positionOfSpaceship cell ].

	^ aux
]

{ #category : #accessing }
Game >> currentSpaceship [

	^ currentSpaceship
]

{ #category : #action }
Game >> giveOneCardTo: aSpaceship [

	(spaceshipsCardHands at: aSpaceship id) gainACard
]

{ #category : #initialization }
Game >> initializeNumberOfSpaceships: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

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
	
	spaceshipsWithHyperGravity := Dictionary new.

	board := aBoardCreator
		         createBoardFor: self
		         with: turnManager
		         andMaxThrowOf: dice amountOfFaces
]

{ #category : #initialization }
Game >> initializeNumberOfSpaceshipsPlayingWithAllCards: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

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
	
	spaceshipsWithHyperGravity := Dictionary new.

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

	spaceships
		each: [ :spaceship |
			spaceship move:
				(self checkMoveIsPossible: aNumberOfMovements for: spaceship) ]
		but: aSpaceship
]

{ #category : #action }
Game >> moveSpaceship [

	| positionOfSpaceship throwResult |
	throwResult := self throwDiceAndCheckReward.
	throwResult := self checkMoveIsPossible: throwResult for: currentSpaceship.

	positionOfSpaceship := currentSpaceship objectPosition.

	currentSpaceship move: throwResult.

	cellToEnter := board at: positionOfSpaceship cell.
	cellToEnter applyEffectTo: currentSpaceship on: self.

	self checkAndHandleFuelDepletion: currentSpaceship.

	positionOfSpaceship := currentSpaceship objectPosition position.
	positionOfSpaceship = finishLine ifTrue: [
		dice := GameOver new.
		^ self spaceships positionsOfSpaceships ].

	currentSpaceship := turnManager nextTurn
]

{ #category : #action }
Game >> reloadSpaceship [

	| nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	nextSpaceship loadFuel
]

{ #category : #removing }
Game >> removeTheCard: aCardToCancel andSaveTheLastInstantCardPlayed: aCancellationCard [

	aActiveDeck instantCardPlayed: aCancellationCard .
	aActiveDeck removeACard: aCardToCancel
]

{ #category : #initialization }
Game >> resetSpaceshipsToCellOne [

	| aSpaceship |
	1 to: spaceships size do: [ :index |
		aSpaceship := spaceships at: index.
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

	^ spaceships 
]

{ #category : #action }
Game >> throwDiceAndCheckReward [

	| throwResult maxThrow randomValue |
	randomValue := Random new next.
	throwResult := dice throw.

	throwResult := aActiveDeck
		               applyEffectOn: throwResult
		               withCurrentSpaceship: currentSpaceship id.

	maxThrow := dice amountOfFaces.
	throwResult = maxThrow ifTrue: [
		randomValue < 0.8
			ifTrue: [ currentSpaceship  changeCapacity: 1 ]
			ifFalse: [ currentSpaceship  changeCapacity: -1 ] ].
	^ throwResult
]

{ #category : #results }
Game >> winner [

	^ (spaceships ranking at: 1) id
]
