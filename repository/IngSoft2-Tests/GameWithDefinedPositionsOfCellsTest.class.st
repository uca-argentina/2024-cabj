Class {
	#name : #GameWithDefinedPositionsOfCellsTest,
	#superclass : #TestCase,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'amountOfFuel',
		'collectionOfSpaceships',
		'turnManager',
		'dictionaryOfPositions',
		'amountOfIndex',
		'amountOfCells',
		'numberOfLaps',
		'finishLine'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test01GameMovesSpaceshipWhichEntersAtomicBombThenEveryoneGoesBackToCellOne [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 8 4 ).
	
	aBoardCreator := BoardCreatorWithDefinedCellPositions 
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 .
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #(2 3).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie
					withWormholeCreator: aWormholeCreator.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.
	result at: 3 put: 1.

	self assert: aGame finalPositionOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test02GameMovesSpaceshipEntersHyperJumpThenReturnsNewPositionAdjustedByParsecs [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 8 3 ).

	aBoardCreator := BoardCreatorWithDefinedCellPositions 
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeBeginningAndEnding: #( 2 3 ).
		                
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #(2 3).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie
					withWormholeCreator:aWormholeCreator.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 10.
	result at: 2 put: 3.
	result at: 3 put: 4.

	self assert: aGame finalPositionOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test03SpaceshipThreeEntersMoonWalkThenEveryOtherSpaceshipGoesBackAValue [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 9 6 ).

	aBoardCreator := BoardCreatorWithDefinedCellPositions 
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeBeginningAndEnding: #( 2 3 ).
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #(2 3).
	
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie
					withWormholeCreator: aWormholeCreator.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 6.
	result at: 2 put: 6.
	result at: 3 put: 7.

	self assert: aGame finalPositionOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test04GameMovesSpaceshipsOneEntersBlackHoleThenPositionIsMinusFour [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 5 9 9 ).

	aBoardCreator := BoardCreatorWithDefinedCellPositions 
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeBeginningAndEnding: #( 2 3 ).
		                 
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #(2 3).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie
					withWormholeCreator:aWormholeCreator.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 2.
	result at: 2 put: 10.
	result at: 3 put: 10.

	self assert: aGame finalPositionOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test05SpaceshipOneEntersHyperGravityAndRollsLessThanMinuminValueThenStaysThere [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 7 9 9 2 ).

	aBoardCreator := BoardCreatorWithDefinedCellPositions 
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeBeginningAndEnding: #( 2 3 ).
		                 
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #(2 3).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie
					withWormholeCreator: aWormholeCreator.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 10.
	result at: 3 put: 10.

	self assert: aGame finalPositionOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test06SpaceshipEntersHyperGravityAndRollsValueThenSpapceshipCanMove [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 7 9 9 4 ).

	aBoardCreator := BoardCreatorWithDefinedCellPositions 
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeBeginningAndEnding: #( 2 3 ).
	
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #(2 3).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie
					withWormholeCreator: aWormholeCreator.
	
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 3.
	result at: 2 put: 10.
	result at: 3 put: 10.

	self assert: aGame finalPositionOfSpaceships equals: result
]
