Class {
	#name : #CellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
CellTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
CellTest >> test01CellInitializeWithPositionThenEnterReturnsIt [ 

	| aCell aGame aLoadedDie aBoardCreator aWormholeCreator collectionOfCells |
	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	collectionOfCells := OrderedCollection
		                     with: Cell
		                     with: Cell
		                     with: Cell
		                     with: Cell
		                     with: Cell.

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
 
	aCell := Cell position: 1.
	

	self assert: (aCell enterOn:aGame) equals: 1

]

{ #category : #tests }
CellTest >> test02PositionOfTheCellHasToBeGreaterThanZero [ 

	self
		should: [ Cell position: 0 ]
		raise: Error
		withMessage: 'A cell must have position greater than zero'

]
