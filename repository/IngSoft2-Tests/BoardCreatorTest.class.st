Class {
	#name : #BoardCreatorTest,
	#superclass : #TestCase,
	#instVars : [
		'collectionOfCells',
		'aWormholeCreator',
		'aBoardCreator'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
BoardCreatorTest >> setUp [

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
		                 withWormholeCreator: aWormholeCreator
]

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

	self assert: aBoardCreator cells equals: 5
]

{ #category : #tests }
BoardCreatorTest >> test02BoardCreatorInitializeThenGetLapsReturnsLaps [


	self assert: aBoardCreator laps equals: 1
]
