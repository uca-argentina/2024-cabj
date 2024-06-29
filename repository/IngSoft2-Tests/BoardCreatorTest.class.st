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

	| aBoardCreator aWormholeCreator collectionOfCells |
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

	self assert: aBoardCreator cells equals: 5
]

{ #category : #tests }
BoardCreatorTest >> test02BoardCreatorInitializeThenGetLapsReturnsLaps [
	
	
	| aBoardCreator aWormholeCreator collectionOfCells |
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

	self assert: aBoardCreator laps equals: 1
]

{ #category : #tests }
BoardCreatorTest >> test03BoardCreatorCreatesBoardOfOnlyCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	
	collectionOfCells := OrderedCollection new.
	
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	
	4 timesRepeat: [ collectionOfCells add: Cell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.
		
	board := aBoardCreator createBoardFor: nil with: nil andMaxThrowOf: nil.

	self assert: ((board at: 1) isKindOf: Cell)
]

{ #category : #tests }
BoardCreatorTest >> test04BoardCreatorCreatesBoardOfOnlyBlackHoleCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	
	collectionOfCells := OrderedCollection new.
	
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	
	4 timesRepeat: [ collectionOfCells add: BlackHoleCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
		
	board := aBoardCreator createBoardFor: nil with: nil andMaxThrowOf: nil.

	self assert: ((board at: 1) isKindOf: BlackHoleCell)
]

{ #category : #tests }
BoardCreatorTest >> test05BoardCreatorCreatesBoardOfOnlyHyperGravityCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	
	collectionOfCells := OrderedCollection new.
	
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	
	4 timesRepeat: [ collectionOfCells add: HyperGravityCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
		
	board := aBoardCreator createBoardFor: nil with: nil andMaxThrowOf: 10.

	self assert: ((board at: 1) isKindOf: HyperGravityCell)
]

{ #category : #tests }
BoardCreatorTest >> test06BoardCreatorCreatesBoardOfOnlyMoonWalkCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	
	collectionOfCells := OrderedCollection new.
	
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	
	4 timesRepeat: [ collectionOfCells add: MoonWalkCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
		
	board := aBoardCreator createBoardFor: nil with: nil andMaxThrowOf: 10.

	self assert: ((board at: 1) isKindOf: MoonWalkCell)
]

{ #category : #tests }
BoardCreatorTest >> test07BoardCreatorCreatesBoardOfOnlyHyperJumpCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	
	collectionOfCells := OrderedCollection new.
	
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	
	4 timesRepeat: [ collectionOfCells add: HyperJumpCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
		
	board := aBoardCreator createBoardFor: nil with: nil andMaxThrowOf: 10.

	self assert: ((board at: 1) isKindOf: HyperJumpCell)
]

{ #category : #tests }
BoardCreatorTest >> test08BoardCreatorCreatesBoardOfOnlyAtomicBombCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	
	collectionOfCells := OrderedCollection new.
	
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	
	4 timesRepeat: [ collectionOfCells add: AtomicBombCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
		
	board := aBoardCreator createBoardFor: nil with: nil andMaxThrowOf: 10.

	self assert: ((board at: 1) isKindOf: AtomicBombCell)
]

{ #category : #tests }
BoardCreatorTest >> test09BoardCreatorCreatesBoardOfOnlyCardDispenserCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	
	collectionOfCells := OrderedCollection new.
	
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	
	4 timesRepeat: [ collectionOfCells add: CardDispenserCell ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.
		
	board := aBoardCreator createBoardFor: nil with: nil andMaxThrowOf: 10.

	self assert: ((board at: 1) isKindOf: CardDispenserCell)
]
