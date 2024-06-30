Class {
	#name : #UserInterface,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'aGame'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
UserInterface class >> numberOfSpaceships: anAmount with: aBoardCreator playWith: aCollectionOfDice andGameDeck: anEffectManager [

	^ self new
		  initializeNumberOfSpaceships: anAmount
		  with: aBoardCreator
		  playWith: aCollectionOfDice
		  andGameDeck: anEffectManager
]

{ #category : #'instance creation' }
UserInterface class >> numberOfSpaceshipsPlayingWithAllCards: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

	^ self new
		  initializeNumberOfSpaceshipsPlayingWithAllCards:
		  anAmountOfSpaceships
		  withBoardCreator: aBoardCreator
		  playWithDice: aCollectionOfDice
]

{ #category : #activation }
UserInterface >> activatePermanentCard: aCard [

	aGame activatePermanentCard: aCard
]

{ #category : #results }
UserInterface >> finalLapsOfSpaceships [

	^ spaceships lapsOfSpaceships
]

{ #category : #results }
UserInterface >> finalPositionOfSpaceships [

	^ spaceships cellsOfSpaceships
]

{ #category : #results }
UserInterface >> finalResultsOfSpaceships [

	^ spaceships positionsOfSpaceships
]

{ #category : #initialization }
UserInterface >> initializeNumberOfSpaceships: anAmount with: aBoardCreator playWith: aCollectionOfDice andGameDeck: anEffectManager [

	aGame := Game
		         numberOfSpaceships: anAmount
		         with: aBoardCreator
		         playWith: aCollectionOfDice
		         andGameDeck: anEffectManager.

	spaceships := aGame spaceships
]

{ #category : #initialization }
UserInterface >> initializeNumberOfSpaceshipsPlayingWithAllCards: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

	aGame := Game
		         numberOfSpaceshipsPlayingWithAllCards: anAmountOfSpaceships
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	spaceships := aGame spaceships
]

{ #category : #action }
UserInterface >> moveSpaceship [

	^aGame moveSpaceship
]

{ #category : #results }
UserInterface >> rankingOfSpaceships [

	| sortedSpaceships numberOfSpaceshipsToTake |
	sortedSpaceships := spaceships ranking.
	numberOfSpaceshipsToTake := sortedSpaceships size min: 3.

	^ sortedSpaceships first: numberOfSpaceshipsToTake
]

{ #category : #action }
UserInterface >> reloadSpaceship [

	aGame reloadSpaceship
]

{ #category : #activation }
UserInterface >> spaceshipId: anId activateInstantCard: aCard [

	aGame spaceshipId: anId activateInstantCard: aCard
]

{ #category : #results }
UserInterface >> winner [

	^ aGame winner
]
