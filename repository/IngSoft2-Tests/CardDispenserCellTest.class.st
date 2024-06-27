Class {
	#name : #CardDispenserCellTest,
	#superclass : #TestCase,
	#instVars : [
		'aLoadedDie',
		'aWormholeCreator',
		'aBoardCreator',
		'aGame',
		'collectionOfCells'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CardDispenserCellTest >> setUp [
	
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
		         playWithDice: aLoadedDie
]

{ #category : #asserting }
CardDispenserCellTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
CardDispenserCellTest >> test01CardDispenserCellInitializeWithPositionThenEnterReturnsIt [

	| aCardDispenserCell |
	
	aCardDispenserCell := CardDispenserCell position: 1 .

	self assert: (aCardDispenserCell enterOn: aGame) equals: 1
]

{ #category : #tests }
CardDispenserCellTest >> test02PositionOfTheCardDispenserCellHasToBeGreaterThanZero [ 
	
	self
		should: [ CardDispenserCell position: 0  . ]
		raise: Error
		withMessage: 'A cell must have position greater than zero'
]
