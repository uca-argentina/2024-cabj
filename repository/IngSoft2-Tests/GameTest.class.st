Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'aLoadedDie',
		'aWormholeCreator',
		'collectionOfCells',
		'aBoardCreator',
		'dice',
		'aCollectionOfDice',
		'gameDeck'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
GameTest >> setUp [
	
	super setUp.
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.

	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).

	aCollectionOfDice := Dice of: dice.

	gameDeck := EffectManager
		            manage: (OrderedCollection
				             with: AccelerationCard new
				             with: AllyCard new
				             with: OverloadCard new
				             with: RedoCard new
				             with: RepeatCard new
				             with: CancellationCard new)
		            withProbabilitiesDistribution: #( 16 16 17 17 17 17 )
]

{ #category : #asserting }
GameTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #testsGame002 }
GameTest >> testGameCreatedWithDieMovesSpaceshipInBetweenOneAndTheAmountOfFaces [

	| aGame aDie |
	aDie := Die of: 5.
	50 timesRepeat: [ collectionOfCells add: Cell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.

	self assert:
		((aGame spaceships cellsOfSpaceships values at: 1) between: 2 and: 6)
]

{ #category : #tests }
GameTest >> testResetToCellOneThenEverySpaceshipIsOnCellOne [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 9 7 4 ).
	50 timesRepeat: [ collectionOfCells add: Cell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.
	result at: 3 put: 1.

	aGame resetSpaceshipsToCellOne.
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameTest >> testResetToCellOneThenLapRemainsTheSame [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 9 26 43 ).
	collectionOfCells := OrderedCollection new.
	20 timesRepeat: [ collectionOfCells add: Cell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 3
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 2.
	result at: 3 put: 3.

	aGame resetSpaceshipsToCellOne.
	self assert: aGame spaceships lapsOfSpaceships equals: result
]

{ #category : #tests }
GameTest >> testSpaceshipOnesWinThenSpaceshipsTwoPlaysAndGameOver [

	| aGame |
	collectionOfCells := OrderedCollection new.
	4 timesRepeat: [ collectionOfCells add: Cell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aCollectionOfDice
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	self
		should: [ aGame moveSpaceship ]
		raise: Error
		withMessage: 'The Game is Over'
]

{ #category : #tests }
GameTest >> testTwoSpaceshipsFirstOneMovesTwiceWithDieOfSixThenMinTwoMaxTwelvePosition [

	| aGame aDie |
	aDie := Die of: 6.
	50 timesRepeat: [ collectionOfCells add: Cell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	self assert:
		((aGame spaceships cellsOfSpaceships values at: 1)
			 between: 1
			 and: 13)
]

{ #category : #tests }
GameTest >> testWhenSpaceshipWinsThenReturnsItsPosition [

	| aGame resultOfGame |
	4 timesRepeat: [ collectionOfCells add: Cell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 4 with: 1).
	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aCollectionOfDice
		         andGameDeck: gameDeck.

	self assert: aGame moveSpaceship equals: resultOfGame
]
