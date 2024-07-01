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
BoardCreatorTest >> test01BoardCreatorInitializeThenCellsReturnsAmountOfCellsOnBoard [

	| aBoardCreator aWormholeCreator collectionOfCells |
	collectionOfCells := OrderedCollection new.
	5 timesRepeat: [ collectionOfCells add: Cell new ].

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	self assert: aBoardCreator cells equals: 5
]

{ #category : #tests }
BoardCreatorTest >> test02BoardCreatorInitializeThenLapsReturnsAmountOfLaps [

	| aBoardCreator aWormholeCreator collectionOfCells |
	collectionOfCells := OrderedCollection new.
	5 timesRepeat: [ collectionOfCells add: Cell new ].

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

	4 timesRepeat: [ collectionOfCells add: Cell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	board := aBoardCreator createBoard.

	self assert: ((board at: 1) isKindOf: Cell)
]

{ #category : #tests }
BoardCreatorTest >> test04BoardCreatorCreatesBoardOfOnlyBlackHoleCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	collectionOfCells := OrderedCollection new.

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.

	4 timesRepeat: [ collectionOfCells add: BlackHoleCell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	board := aBoardCreator createBoard.

	self assert: ((board at: 1) isKindOf: BlackHoleCell)
]

{ #category : #tests }
BoardCreatorTest >> test05BoardCreatorCreatesBoardOfOnlyHyperGravityCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	collectionOfCells := OrderedCollection new.

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.

	4 timesRepeat: [
		collectionOfCells add: (HyperGravityCell withValueToMove: 4) ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	board := aBoardCreator createBoard.

	self assert: ((board at: 1) isKindOf: HyperGravityCell)
]

{ #category : #tests }
BoardCreatorTest >> test06BoardCreatorCreatesBoardOfOnlyMoonWalkCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	collectionOfCells := OrderedCollection new.

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.

	4 timesRepeat: [
		collectionOfCells add: (MoonWalkCell withValueToMove: 4) ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	board := aBoardCreator createBoard.

	self assert: ((board at: 1) isKindOf: MoonWalkCell)
]

{ #category : #tests }
BoardCreatorTest >> test07BoardCreatorCreatesBoardOfOnlyHyperJumpCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells aConversor values |
	aConversor := Conversor totalCells: 4 convertionValue: 8.
	values := OrderedCollection
		          with: (Parsecs ofValue: 10)
		          with: (LightYear ofValue: 24)
		          with: (Parsecs ofValue: 6)
		          with: (Parsecs ofValue: 4).

	collectionOfCells := OrderedCollection new.

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.

	4 timesRepeat: [
		collectionOfCells add:
			(HyperJumpCell withConversor: aConversor andValues: values) ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	board := aBoardCreator createBoard.

	self assert: ((board at: 1) isKindOf: HyperJumpCell)
]

{ #category : #tests }
BoardCreatorTest >> test08BoardCreatorCreatesBoardOfOnlyAtomicBombCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	collectionOfCells := OrderedCollection new.

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.

	4 timesRepeat: [ collectionOfCells add: AtomicBombCell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	board := aBoardCreator createBoard.

	self assert: ((board at: 1) isKindOf: AtomicBombCell)
]

{ #category : #tests }
BoardCreatorTest >> test09BoardCreatorCreatesBoardOfOnlyCardDispenserCellsThenBoardHasOnlyCellsWhereThereIsntAWormhole [

	| board aBoardCreator aWormholeCreator collectionOfCells |
	collectionOfCells := OrderedCollection new.

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.

	4 timesRepeat: [ collectionOfCells add: CardDispenserCell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	board := aBoardCreator createBoard.

	self assert: ((board at: 1) isKindOf: CardDispenserCell)
]
