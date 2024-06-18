Class {
	#name : #GameWithDefinedPositionsOfCellsTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test01GameMovesSpaceshipWhichEntersAtomicBombThenEveryoneGoesBackToCellOne [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 8 4 ).
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeCreator: aWormholeCreator.

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

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test02GameMovesSpaceshipEntersHyperJumpThenReturnsNewPositionAdjustedByParsecs [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 8 3 ).
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	
	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeCreator: aWormholeCreator.
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 10.
	result at: 2 put: 3.
	result at: 3 put: 4.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test03SpaceshipThreeEntersMoonWalkThenEveryOtherSpaceshipGoesBackAValue [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 9 6 ).
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	
	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 6.
	result at: 2 put: 6.
	result at: 3 put: 7.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test04GameMovesSpaceshipsOneEntersBlackHoleThenPositionIsMinusFour [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 5 9 9 ).
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	
	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 2.
	result at: 2 put: 10.
	result at: 3 put: 10.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test05SpaceshipOneEntersHyperGravityAndRollsLessThanMinuminValueThenStaysThere [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 7 9 9 2 ).
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 10.
	result at: 3 put: 10.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test06SpaceshipEntersHyperGravityAndRollsValueThenSpaceshipCanMove [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 7 9 9 4 ).
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 3.
	result at: 2 put: 10.
	result at: 3 put: 10.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test07SecondSpaceshipAndThirdSpaceshipEnterHyperJumpThenThirdMovesLessParsecsThanSecond [

	| result aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 8 8 ).
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	
	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 10.
	result at: 2 put: 3.
	result at: 3 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test08SpaceshipEntersCardDispenserThenAmountOfCardsOnHandEqualsThree [

	| aLoadedDie aGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 3 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.

	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.

	self assert: (aGame cardHand: 1) amount equals: 3
]
