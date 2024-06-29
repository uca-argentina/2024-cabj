Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'turnManager',
		'finishLine',
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
Game >> activateCard: aCard [

	aActiveDeck activate: aCard
]

{ #category : #activation }
Game >> activatePermanentCard: aCard [

	| currentSpaceshipCardHand |
	currentSpaceshipCardHand := spaceshipsCardHands at:
		                            currentSpaceship id.
	(currentSpaceshipCardHand use: aCard) ifFalse: [ ^ self ].
	aCard activateEffectOn: self forSpaceship: currentSpaceship id
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

	| positionOfSpaceship aNumberOfMovements |
	aNumberOfMovements := throwResult.
	positionOfSpaceship := aSpaceship objectPosition.

	(spaceshipsWithHyperGravity includesKey: aSpaceship) ifTrue: [
		throwResult < (spaceshipsWithHyperGravity at: aSpaceship)
			ifTrue: [
				aNumberOfMovements := 0.
				^ aNumberOfMovements ]
			ifFalse: [ spaceshipsWithHyperGravity removeKey: aSpaceship ] ].

	aNumberOfMovements := positionOfSpaceship
		                      adjustPositionFor: aNumberOfMovements
		                      with: finishLine.

	^ aNumberOfMovements
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
Game >> lastCardPlayed [

	^ aActiveDeck lastCardPlayed
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
				(self checkMoveIsPossible: aNumberOfMovements for: spaceship).
			self checkAndHandleFuelDepletion: spaceship ]
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

	aActiveDeck activate: aCancellationCard .
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
	(spaceshipCardHand use: aCard) ifTrue: [
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
