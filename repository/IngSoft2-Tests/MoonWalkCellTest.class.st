Class {
	#name : #MoonWalkCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkCellTest >> test01MoonWalkEnterThenReturnsPositionOfCell [

	| aGame aBoardCreator aLoadedDie aWormholeCreator |
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	
	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 20 2 )
		                 wormholeCreator: aWormholeCreator.
		
	aLoadedDie:= LoadedDie of:#(9 7 6).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship .
	aGame moveSpaceship .
	aGame moveSpaceship.

	self assert: (aGame spaceships cellsOfSpaceships at:3)  equals: 7
	
	
	
	
	
	


]

{ #category : #tests }
MoonWalkCellTest >> test02SpaceshipThreeEntersMoonWalkThenEverySpaceshipExceptThreeMovesBackwards [

	| aBoardCreator aLoadedDie aGame result aWormholeCreator |
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	
	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 20 2 )
		                 wormholeCreator: aWormholeCreator.
		
	aLoadedDie := LoadedDie of: #( 9 7 6 ).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 6.
	result at: 2 put: 4.
	result at: 3 put: 7.


	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
MoonWalkCellTest >> test03MoonWalkExitThenReturnsTrue [

	| aBoardCreator aLoadedDie aGame aWormholeCreator aMoonWalkCell |
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	
	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 20 2 )
		                 wormholeCreator: aWormholeCreator.
		
	aLoadedDie := LoadedDie of: #( 9 7 6 ).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	
	aMoonWalkCell := MoonWalkCell withValueToMove: 4 inPosition: 3 .

	self assert: (aMoonWalkCell exit: 5)
]
