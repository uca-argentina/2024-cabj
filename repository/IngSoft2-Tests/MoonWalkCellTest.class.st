Class {
	#name : #MoonWalkCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkCellTest >> test01MoonWalkEnterThenReturnsPositionOfCell [

	| aGame aBoardCreator aLoadedDie|

	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 20 2 )
		                 wormholeBeginningAndEnding: #( 2 3 ).
	aLoadedDie:= LoadedDie of:#(9 7 6).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship .
	aGame moveSpaceship .
	aGame moveSpaceship.

	self assert: (aGame finalPositionOfSpaceships at:3)  equals: 7
	
	
	
	
	
	


]

{ #category : #tests }
MoonWalkCellTest >> test02SpaceshipThreeEntersMoonWalkThenEverySpaceshipExceptThreeMovesBackwards [

	|  aBoardCreator aLoadedDie aGame  result |
	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 20 2 )
		                 wormholeBeginningAndEnding: #( 2 3 ).
	aLoadedDie:= LoadedDie of:#(9 7 6).
	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie..
	aGame moveSpaceship .
	aGame moveSpaceship .
	aGame moveSpaceship .
	.
	result := Dictionary new.
	result at: 1 put: 6.
	result at: 2 put: 4.
	result at: 3 put: 7.


	self assert: aGame finalPositionOfSpaceships   equals: result
]
