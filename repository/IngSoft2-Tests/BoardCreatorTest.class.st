Class {
	#name : #BoardCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardCreatorTest >> test01BoardCreatorInitializeThenGetCellsReturnsCells [

	| aBoardCreator aWormholeCreator |
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #( 2 3 ).
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator 
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator getCells equals: 10
]

{ #category : #tests }
BoardCreatorTest >> test02BoardCreatorInitializeThenGetLapsReturnsLaps [

	| aBoardCreator aWormholeCreator |
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #( 2 3 ).
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator 
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator getLaps equals: 1
]

{ #category : #tests }
BoardCreatorTest >> test05BoardCreatorInitializeThenReturnsAmountOfRegularCells [

	| aBoardCreator aWormholeCreator |
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #( 2 3 ).
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 withWormholeCreator: aWormholeCreator 
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator amountOfRegularCells equals: 20
]

{ #category : #tests }
BoardCreatorTest >> test11BoardCreatorCreatesBoardThenSizeTheExpectedOne [

	| aBoardCreator collectionOfSpaceships aTurnManager aBoard aWormholeCreator |
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #( 2 3 ).
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 withWormholeCreator: aWormholeCreator 
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).
	
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 2
		                          withAmountOfFuel: 5
		                          indexCalculateWith: 10.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	
	aBoard := aBoardCreator createBoardFor: collectionOfSpaceships with: aTurnManager andMaxThrowOf: 30.

	self assert: aBoard size equals: 50
]
