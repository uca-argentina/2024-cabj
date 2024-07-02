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
Game >> ally: spaceshipOne with: spaceshipTwo [

	anAllyTankManager ally: spaceshipOne with: spaceshipTwo
]

{ #category : #action }
Game >> applyHyperGravityOn: aSpaceship withValue: value [
	
	spaceshipsWithHyperGravity at: aSpaceship put: value

	
	
]

{ #category : #action }
Game >> checkAndHandleFuelDepletion: aSpaceship [

	| sharingId spaceshipSharing |
	sharingId := anAllyTankManager allyOf: aSpaceship id.
	sharingId = aSpaceship ifTrue: [
		aSpaceship objectFuelTank isEmpty ifFalse: [ ^ self ].
		turnManager lostTurns: 2 by: (aSpaceship id).
		aSpaceship resetToOne.
		aSpaceship loadFuel.
		^ self ].

	spaceshipSharing := spaceships detectSpaceshipWithId: sharingId.
	(aSpaceship objectFuelTank isEmpty and:
		 spaceshipSharing objectFuelTank isEmpty) ifFalse: [ ^ self ].
	turnManager lostTurns: 2 by: (aSpaceship id).
	turnManager lostTurns: 2 by: (spaceshipSharing id).
	aSpaceship resetToOne.
	aSpaceship loadFuel.
	spaceshipSharing resetToOne.
	spaceshipSharing loadFuel.
	^ self
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
Game >> initializeNumberOfSpaceships: anAmount with: aBoardCreator playWith: aCollectionOfDice andGameDeck: anEffectManager [

	aActiveDeck := ActiveDeck startGame.

	finishLine := OrderedCollection
		              with: aBoardCreator cells
		              with: aBoardCreator laps.

	dice := aCollectionOfDice.

	spaceships := CollectionOfSpaceships
		              numberOfSpaceships: anAmount
		              withAmountOfFuel: dice amountOfFaces * 2.

	anAllyTankManager := AllyTankManager manage: spaceships.

	spaceshipsCardHands := (1 to: anAmount) collect: [ :index |
		                       SpaceshipCardHand startGameWith: anEffectManager ].

	turnManager := TurnManager manage: spaceships.
	currentSpaceship := spaceships detectSpaceshipWithId:
		                    turnManager nextTurn.

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
	throwResult := self throwDiceAndCheckEffects.
	throwResult := self
		               checkMoveIsPossible: throwResult
		               for: currentSpaceship.

	positionOfSpaceship := currentSpaceship objectPosition.

	anAllyTankManager
		spaceship: currentSpaceship id
		wantsToUse: throwResult.

	currentSpaceship move: throwResult.

	self checkAndHandleFuelDepletion: currentSpaceship.

	cellToEnter := board at: positionOfSpaceship cell.
	cellToEnter applyEffectTo: currentSpaceship on: self.

	positionOfSpaceship := currentSpaceship objectPosition position.
	positionOfSpaceship = finishLine ifTrue: [
		dice := GameOver new.
		^ self spaceships positionsOfSpaceships ].

	currentSpaceship := spaceships detectSpaceshipWithId:
		                    turnManager nextTurn
]

{ #category : #action }
Game >> reloadSpaceship [

	currentSpaceship loadFuel.
	currentSpaceship := spaceships detectSpaceshipWithId:
		                    turnManager nextTurn
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
Game >> spaceshipId: anId useInstantCard: aCard [

	| spaceshipCardHand |
	spaceshipCardHand := spaceshipsCardHands at: anId.
	(spaceshipCardHand use: aCard) ifTrue: [
		aCard activateEffectOn: self forSpaceship: anId ]
]

{ #category : #accessing }
Game >> spaceships [

	^ spaceships 
]

{ #category : #accessing }
Game >> stopAlly: aSpaceshipId [

	anAllyTankManager stopAlly: aSpaceshipId
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
			ifTrue: [ currentSpaceship  changeCapacity: 1 ]
			ifFalse: [ currentSpaceship  changeCapacity: -1 ] ].
	^ throwResult
]

{ #category : #activation }
Game >> usePermanentCard: aCard [

	| currentSpaceshipCardHand |
	currentSpaceshipCardHand := spaceshipsCardHands at:
		                            currentSpaceship id.
	(currentSpaceshipCardHand use: aCard) ifFalse: [ ^ self ].
	aCard activateEffectOn: self forSpaceship: currentSpaceship id
]

{ #category : #results }
Game >> winner [

	^ (spaceships ranking at: 1) id
]
