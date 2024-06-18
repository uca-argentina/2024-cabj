Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

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

	| aGame aCollectionOfDice aBoardCreator aWormholeCreator dice |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
		
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).


	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	aCollectionOfDice := Dice of: dice.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: Cell)
]

{ #category : #tests }
GameTest >> test08GameHasBoardOnlyBlackHoleThenBoardHasBlackHolesWhereThereIsntAWormHole [

	| aGame aCollectionOfDice aBoardCreator aWormholeCreator dice |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
		
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 100 0 0 0 0 ).


	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	aCollectionOfDice := Dice of: dice.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: BlackHoleCell)
]

{ #category : #tests }
GameTest >> test09GameHasBoardOnlyHyperGravityThenBoardHasHyperGravityWhereThereIsntAWormHole [

	| aGame aCollectionOfDice aBoardCreator aWormholeCreator dice |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
		
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 100 0 0 0 ).


	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	aCollectionOfDice := Dice of: dice.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: HyperGravityCell)
]

{ #category : #tests }
GameTest >> test10GameHasBoardOnlyMoonWalkThenBoardHasMoonWalkWhereThereIsntAWormHole [

	| aGame aCollectionOfDice aBoardCreator aWormholeCreator dice |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
		
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 100 0 0 ).


	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	aCollectionOfDice := Dice of: dice.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: MoonWalkCell)
]

{ #category : #tests }
GameTest >> test11GameHasBoardOnlyHyperJumpThenBoardHasHyperJumpWhereThereIsntAWormHole [

	| aGame aCollectionOfDice aBoardCreator aWormholeCreator dice |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
		
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 100 0 ).


	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	aCollectionOfDice := Dice of: dice.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: HyperJumpCell)
]

{ #category : #tests }
GameTest >> test12GameHasBoardOnlyAtomicBombThenBoardHasAtomicBombWhereThereIsntAWormHole [

	| aGame aCollectionOfDice aBoardCreator aWormholeCreator dice |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
		
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 100 ).


	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	aCollectionOfDice := Dice of: dice.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: AtomicBombCell)
]

{ #category : #tests }
GameTest >> test13GameHasBoardOnlyCardDispenserThenBoardHasCardDispenserWhereThereIsntAWormHole [

	| aGame aCollectionOfDice aBoardCreator aWormholeCreator dice |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
		
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).


	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	aCollectionOfDice := Dice of: dice.
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: ((aGame board at: 1) isKindOf: CardDispenserCell)
]

{ #category : #testsGame002 }
GameTest >> testGameCreatedWithDieMovesSpaceshipInBetweenOneAndTheAmountOfFaces [

	| aGame aDie aBoardCreator aWormholeCreator |
	aDie := Die of: 5.
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aDie.

	self assert: ((aGame moveSpaceship at: 1) between: 2 and: 6)
]

{ #category : #tests }
GameTest >> testResetToCellOneThenEverySpaceshipIsOnCellOne [

	| result aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 7 4 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

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

	| result aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 26 43 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 3 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

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

	| aGame aCollectionOfDice aBoardCreator aWormholeCreator dice |
	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	aCollectionOfDice := Dice of: dice.
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

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

	| aGame aDie aBoardCreator aWormholeCreator |
	aDie := Die of: 6.
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: ((aGame moveSpaceship at: 1) between: 1 and: 13)
]

{ #category : #tests }
GameTest >> testWhenSpaceshipWinsThenReturnsItsPosition [

	| aGame resultOfGame aCollectionOfDice aBoardCreator aWormholeCreator dice |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).


	dice := OrderedCollection
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10)
		        with: (Die of: 10).
	aCollectionOfDice := Dice of: dice.
	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 4 with: 1).
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: aGame moveSpaceship equals: resultOfGame
]
