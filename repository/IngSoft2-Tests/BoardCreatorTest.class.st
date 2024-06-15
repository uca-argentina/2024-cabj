Class {
	#name : #BoardCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardCreatorTest >> test01BoardCreatorInitializeThenGetCellsReturnsCells [

	| aBoardCreator aWormholeCreator |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator cells equals: 10
]

{ #category : #tests }
BoardCreatorTest >> test02BoardCreatorInitializeThenGetLapsReturnsLaps [

	| aBoardCreator aWormholeCreator |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator laps equals: 1
]

{ #category : #tests }
BoardCreatorTest >> test05BoardCreatorInitializeThenReturnsAmountOfRegularCells [

	| aBoardCreator aWormholeCreator |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator amountOfRegularCells equals: 20
]

{ #category : #tests }
BoardCreatorTest >> test11BoardCreatorCreatesBoardThenSizeTheExpectedOne [

	| aBoardCreator collectionOfSpaceships aTurnManager aWormholeCreator aGame aLoadedDie |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 2
		                          withAmountOfFuel: 5
		                          indexCalculateWith: 10.

	aTurnManager := TurnManager manage: collectionOfSpaceships.

	aLoadedDie := LoadedDie of: #( 5 ).

	aGame := aGame := Game
		                  numberOfSpaceships: 2
		                  withBoardCreator: aBoardCreator
		                  playWithDice: aLoadedDie.


	self assert: aGame board size equals: 50
]
