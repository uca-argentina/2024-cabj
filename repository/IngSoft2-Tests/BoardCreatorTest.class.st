Class {
	#name : #BoardCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
BoardCreatorTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
BoardCreatorTest >> test01BoardCreatorInitializeThenGetCellsReturnsCells [

	| aBoardCreator aWormholeCreator |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 10 20 20 10 8 2 ).

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
		                 andSpecialCellsDistruibution: #( 10 20 20 10 8 2 ).

	self assert: aBoardCreator laps equals: 1
]

{ #category : #tests }
BoardCreatorTest >> test03BoardCreatorGeneratesNumberBetweenOneAndOneHundred [

	| aBoardCreator aWormholeCreator |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 10 20 20 10 8 2 ).

	self assert: (aBoardCreator numberGenerator between: 1 and: 100)
]

{ #category : #tests }
BoardCreatorTest >> test04BoardCreatorThrowsErrorWhenSumOfProbabilitiesIsGreaterOrLessThanOneHundred [

	| aWormholeCreator |
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.

	self
		should: [
			BoardCreator
				withCellsAndLaps: #( 10 1 )
				withWormholeCreator: aWormholeCreator
				andSpecialCellsDistruibution: #( 41 20 20 10 8 2 ) ]
		raise: Error
		withMessage: 'Sum of probabilities must be lower or equal to one hundred'
]
