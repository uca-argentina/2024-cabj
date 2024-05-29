Class {
	#name : #BoardCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardCreatorTest >> test01BoardCreatorInitializeThenGetCellsReturnsCells [

	| aBoardCreator |
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator getCells equals: 10
]

{ #category : #tests }
BoardCreatorTest >> test02BoardCreatorInitializeThenGetLapsReturnsLaps [

	| aBoardCreator |
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator getLaps equals: 1
]

{ #category : #tests }
BoardCreatorTest >> test03BoardCreatorInitializeThenGetBeginningReturnsBeginning [

	| aBoardCreator |
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator getBeginning equals: 2
]

{ #category : #tests }
BoardCreatorTest >> test04BoardCreatorInitializeThenGetEndingReturnsEnding [

	| aBoardCreator |
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator getEnding equals: 3
]

{ #category : #tests }
BoardCreatorTest >> test05BoardCreatorInitializeThenReturnsAmountOfRegularCells [

	| aBoardCreator |
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).

	self assert: aBoardCreator amountOfRegularCells equals: 20
]

{ #category : #tests }
BoardCreatorTest >> test11BoardCreatorCreatesBoardThenSizeTheExpectedOne [

	| aBoardCreator collectionOfSpaceships aTurnManager aBoard|
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).
	
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 2
		                          withAmountOfFuel: 5
		                          indexCalculateWith: 10.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	
	aBoard := aBoardCreator createBoardFor: collectionOfSpaceships with: aTurnManager andMaxThrowOf: 30.

	self assert: aBoard size equals: 50
]
