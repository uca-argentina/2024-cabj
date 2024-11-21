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
		'spaceshipsWithHyperGravity',
		'anAllyTankManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> numberOfSpaceships: anAmount with: aBoardCreator playWith: aCollectionOfDice andGameDeck: anEffectManager [

	^ self new
		  initializeNumberOfSpaceships: anAmount
		  with: aBoardCreator
		  playWith: aCollectionOfDice
		  andGameDeck: anEffectManager
]

{ #category : #activation }
Game >> activateCard: aCard [

	aActiveDeck activate: aCard
]

{ #category : #accessing }
Game >> ally: spaceshipIdOne with: spaceshipIdTwo [
	
	| spaceshipOne spaceshipTwo |
	
	spaceshipOne := spaceships detectSpaceshipWithId: spaceshipIdOne.
	spaceshipTwo := spaceships detectSpaceshipWithId: spaceshipIdTwo.
	anAllyTankManager ally: spaceshipOne with: spaceshipTwo
]

{ #category : #action }
Game >> applyHyperGravityOn: aSpaceship withValue: value [
	
	spaceshipsWithHyperGravity at: aSpaceship put: value

	
	
]

{ #category : #action }
Game >> checkAndHandleFuelDepletion: aSpaceship [

	| spaceshipsWithoutFuel |
	spaceshipsWithoutFuel := anAllyTankManager spaceshipsWithEmptyFuelTank:
		              aSpaceship.
	spaceshipsWithoutFuel do: [ :spaceship |
		turnManager lostTurns: 2 by: spaceship id.
		spaceship resetToOne.
		spaceship loadFuel ]
]

{ #category : #checking }
Game >> checkMoveIsPossible: throwResult for: aSpaceship [

	| positionOfSpaceship aNumberOfMovements |
	aNumberOfMovements := throwResult.
	positionOfSpaceship := aSpaceship position.

	(spaceshipsWithHyperGravity includesKey: aSpaceship) ifTrue: [
		throwResult < (spaceshipsWithHyperGravity at: aSpaceship)
			ifTrue: [
				aNumberOfMovements := 0.
				^ aNumberOfMovements ]
			ifFalse: [ spaceshipsWithHyperGravity removeKey: aSpaceship ] ].

	aNumberOfMovements := positionOfSpaceship
		                      adjustMovementFor: aNumberOfMovements
		                      withLimits: finishLine.

	^ aNumberOfMovements
]

{ #category : #results }
Game >> finishLine [

	^ finishLine
]

{ #category : #action }
Game >> giveOneCardTo: aSpaceship [

	(spaceshipsCardHands at: aSpaceship id) gainACard
]

{ #category : #initialization }
Game >> initializeNumberOfSpaceships: anAmount with: aBoardCreator playWith: aCollectionOfDice andGameDeck: anEffectManager [

	aActiveDeck := ActiveDeck startGame.

	finishLine := Position
		              startGameWithCell: aBoardCreator cells
		              andLap: aBoardCreator laps.

	dice := aCollectionOfDice.

	spaceships := CollectionOfSpaceships
		              numberOfSpaceships: anAmount
		              withAmountOfFuel: dice amountOfFaces * 2.

	anAllyTankManager := AllyTankManager manage: spaceships.

	spaceshipsCardHands := (1 to: anAmount) collect: [ :index |
		                       SpaceshipCardHand startGameWith:
			                       anEffectManager ].

	turnManager := TurnManager manage: spaceships.
	currentSpaceship := turnManager nextTurn.

	spaceshipsWithHyperGravity := Dictionary new.

	board := aBoardCreator createBoard
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
Game >> move: spaceship a: numberOfMovements [

	| positionOfSpaceship aNumberOfMovements |
	aNumberOfMovements := self
		                      checkMoveIsPossible: numberOfMovements
		                      for: spaceship.

	positionOfSpaceship := spaceship position.

	anAllyTankManager
		spaceship: spaceship
		wantsToUse: aNumberOfMovements.

	spaceship move: aNumberOfMovements.

	positionOfSpaceship adjustPositionWith: finishLine.

	self checkAndHandleFuelDepletion: spaceship
]

{ #category : #action }
Game >> moveAllTheSpaceshipsExcept: aSpaceship withValueToMove: aNumberOfMovements [

	spaceships
		each: [ :spaceship | self move: spaceship a: aNumberOfMovements ]
		but: aSpaceship
]

{ #category : #action }
Game >> moveSpaceship [

	| positionOfSpaceship throwResult |
	throwResult := self throwDiceAndCheckEffects.
	positionOfSpaceship := currentSpaceship position.

	self move: currentSpaceship a: throwResult.

	cellToEnter := board at: positionOfSpaceship cell.
	cellToEnter applyEffectTo: currentSpaceship on: self.

	positionOfSpaceship = finishLine ifTrue: [
		dice := GameOver new.
		^ self spaceships positionsOfSpaceships ].

	currentSpaceship := turnManager nextTurn
]

{ #category : #action }
Game >> reloadSpaceship [

	currentSpaceship loadFuel.
	currentSpaceship := turnManager nextTurn
]

{ #category : #removing }
Game >> removeTheCard: aCardToCancel andSaveTheLastInstantCardPlayed: aCancellationCard [

	aActiveDeck activate: aCancellationCard .
	aActiveDeck removeACard: aCardToCancel
]

{ #category : #initialization }
Game >> resetSpaceshipsToCellOne [

	spaceships each: [ :spaceship | spaceship resetToOne ]
]

{ #category : #activation }
Game >> spaceshipId: anId useInstantCard: aCard toDoEffectFor: anObject [

	| spaceshipCardHand cardInitialized |
	cardInitialized := aCard toDoEffectFor: anObject.
	spaceshipCardHand := spaceshipsCardHands at: anId.
	(spaceshipCardHand use: aCard) ifTrue: [
		cardInitialized activateEffectOn: self forSpaceship: anId ]
]

{ #category : #accessing }
Game >> spaceships [

	^ spaceships 
]

{ #category : #accessing }
Game >> stopAlly: aSpaceshipId [

	| spaceshipOne |
	spaceshipOne := spaceships detectSpaceshipWithId: aSpaceshipId.
	anAllyTankManager stopAlly: spaceshipOne
]

{ #category : #action }
Game >> throwDiceAndCheckEffects [

	| throwResult maxThrow randomValue |
	randomValue := Random new next.
	throwResult := dice throw.

	throwResult := aActiveDeck
		               applyEffectOn: throwResult
		               withCurrentSpaceship: currentSpaceship id.

	maxThrow := dice amountOfFaces.
	throwResult = maxThrow ifTrue: [
		randomValue < 0.8
			ifTrue: [ currentSpaceship changeCapacity: 1 ]
			ifFalse: [ currentSpaceship changeCapacity: -1 ] ].
	^ throwResult
]

{ #category : #activation }
Game >> usePermanentCard: aCard toDoEffectFor: anId [

	| currentSpaceshipCardHand cardInitialized |
	cardInitialized := aCard toDoEffectFor: anId.
	currentSpaceshipCardHand := spaceshipsCardHands at:
		                            currentSpaceship id.
	(currentSpaceshipCardHand use: aCard) ifFalse: [ ^ self ].
	cardInitialized
		activateEffectOn: self
		forSpaceship: currentSpaceship id
]

{ #category : #results }
Game >> winner [

	^ (spaceships ranking at: 1) id
]
