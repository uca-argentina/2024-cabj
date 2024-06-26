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

	| aCell aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

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

{ #category : #tests }
CellTest >> test03CellExitThenReturnsTrue [

	| aCell |
	aCell := Cell position: 1.

	self assert: (aCell exit: 3)
]
