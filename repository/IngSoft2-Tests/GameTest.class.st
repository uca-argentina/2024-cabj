Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#instVars : [
		'aLoadedDie',
		'aWormholeCreator',
		'collectionOfCells',
		'aBoardCreator',
		'dice',
		'aCollectionOfDice'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
GameTest >> setUp [

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.
	
	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	
	aCollectionOfDice := Dice of: dice.
]

{ #category : #asserting }
GameTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
GameTest >> test07GameHasBoardOfOnlyCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| aGame aCollectionOfDice |
		
	4 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aCollectionOfDice := Dice of: dice.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: Cell)
]

{ #category : #tests }
GameTest >> test08GameHasBoardOnlyBlackHoleThenBoardHasBlackHolesWhereThereIsntAWormHole [

	| aGame |
	
	4 timesRepeat: [ collectionOfCells add: BlackHoleCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: BlackHoleCell)
]

{ #category : #tests }
GameTest >> test09GameHasBoardOnlyHyperGravityThenBoardHasHyperGravityWhereThereIsntAWormHole [

	| aGame |
	4 timesRepeat: [ collectionOfCells add: HyperGravityCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: HyperGravityCell)
]

{ #category : #tests }
GameTest >> test10GameHasBoardOnlyMoonWalkThenBoardHasMoonWalkWhereThereIsntAWormHole [

	| aGame |
	4 timesRepeat: [ collectionOfCells add: MoonWalkCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: MoonWalkCell)
]

{ #category : #tests }
GameTest >> test11GameHasBoardOnlyHyperJumpThenBoardHasHyperJumpWhereThereIsntAWormHole [

	| aGame |
	4 timesRepeat: [ collectionOfCells add: HyperJumpCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: HyperJumpCell)
]

{ #category : #tests }
GameTest >> test12GameHasBoardOnlyAtomicBombThenBoardHasAtomicBombWhereThereIsntAWormHole [

	| aGame |
	4 timesRepeat: [ collectionOfCells add: AtomicBombCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: AtomicBombCell)
]

{ #category : #tests }
GameTest >> test13GameHasBoardOnlyCardDispenserThenBoardHasCardDispenserWhereThereIsntAWormHole [

	| aGame |
	4 timesRepeat: [ collectionOfCells add: CardDispenserCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: CardDispenserCell)
]

{ #category : #testsGame002 }
GameTest >> testGameCreatedWithDieMovesSpaceshipInBetweenOneAndTheAmountOfFaces [

	| aGame aDie |
	aDie := Die of: 5.
	50 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aDie.
	aGame moveSpaceship.

	self assert: ((aGame spaceships cellsOfSpaceships values at:1) between: 2 and: 6)
]

{ #category : #tests }
GameTest >> testResetToCellOneThenEverySpaceshipIsOnCellOne [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 9 7 4 ).
	50 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

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
	20 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 3
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

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

	4 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.
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
	50 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship .
	self assert: ((aGame spaceships cellsOfSpaceships values at: 1) between: 1 and: 13)
]

{ #category : #tests }
GameTest >> testWhenSpaceshipWinsThenReturnsItsPosition [

	| aGame resultOfGame |
	4 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 4 with: 1).
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: aGame moveSpaceship equals: resultOfGame
]
