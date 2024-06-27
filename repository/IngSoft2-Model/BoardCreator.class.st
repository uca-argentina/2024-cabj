Class {
	#name : #BoardCreator,
	#superclass : #Object,
	#instVars : [
		'collectionAmountOfCellsAndLaps',
		'percentagesOfDistrubitionSpecialCells',
		'wormholeCreator',
		'game',
		'throwResult',
		'board',
		'counterForIndex',
		'counterForPosition',
		'laps',
		'cells',
		'wormhole'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BoardCreator class >> with: collectionOfCells ofLaps: numberOfLaps withWormholeCreator: aWormholeCreator [

	^ self new
		  initializeWith: collectionOfCells
		  ofLaps: numberOfLaps
		  withWormholeCreator: aWormholeCreator
]

{ #category : #'instance creation' }
BoardCreator class >> withCellsAndLaps: collectionAmountOfCellsAndLaps withWormholeCreator: aWormholeCreator andSpecialCellsDistruibution: percentagesOfDistrubitionSpecialCells [

(percentagesOfDistrubitionSpecialCells sum <= 100) ifFalse: [ Error signal: 'Sum of probabilities must be lower or equal to one hundred'].

^(self new) initializeWithCellsAndLaps: collectionAmountOfCellsAndLaps withWormholeCreator: aWormholeCreator  andSpecialCellsDistruibution: percentagesOfDistrubitionSpecialCells
]

{ #category : #'set and get' }
BoardCreator >> cells [

	^ cells size
]

{ #category : #'set and get' }
BoardCreator >> createAtomicBombCells [

	board add: (AtomicBombCell position: counterForPosition).
	counterForPosition := counterForPosition + 1
]

{ #category : #'set and get' }
BoardCreator >> createBlackHoleCells [

	board add: (BlackHoleCell position: counterForPosition).
	counterForPosition := counterForPosition + 1
]

{ #category : #creation }
BoardCreator >> createBoardFor: aGame with: aTurnManager andMaxThrowOf: aThrowResult [

	| amountOfCells anAmountOfIndex |
	game := aGame.
	throwResult := aThrowResult.
	amountOfCells := cells size.
	anAmountOfIndex := amountOfCells * laps.

	cells do: [ :eachClass |
		eachClass = Cell ifTrue: [ self createCells ].
		eachClass = BlackHoleCell ifTrue: [ self createBlackHoleCells ].
		eachClass = AtomicBombCell ifTrue: [ self createAtomicBombCells ].
		eachClass = CardDispenserCell ifTrue: [ self createCardDispenserCells ].
		eachClass = MoonWalkCell ifTrue: [ self createMoonWalkCells ].
		eachClass = HyperJumpCell ifTrue: [ self createHyperJumpCells ].
		eachClass = HyperGravityCell ifTrue: [ self createHyperGravityCells ] ].

	self createWormhole.

	^ board
]

{ #category : #'set and get' }
BoardCreator >> createCardDispenserCells [

	board add:
		(CardDispenserCell position: counterForPosition ).
	counterForPosition := counterForPosition + 1
]

{ #category : #'set and get' }
BoardCreator >> createCells [

	board add: (Cell position: counterForPosition).
	counterForPosition := counterForPosition + 1
]

{ #category : #'set and get' }
BoardCreator >> createHyperGravityCells [

	board add: (HyperGravityCell
			 withValueToMove: throwResult atRandom
			 inPosition: counterForPosition).
	counterForPosition := counterForPosition + 1
]

{ #category : #'set and get' }
BoardCreator >> createHyperJumpCells [

	| amountOfCells aConversor values |
	amountOfCells := cells size.
	aConversor := Conversor
		              totalCells: amountOfCells
		              convertionValue: amountOfCells // 2.
	values := OrderedCollection
		          with: (Parsecs ofValue: 10)
		          with: (Parsecs ofValue: 8)
		          with: (Parsecs ofValue: 6)
		          with: (Parsecs ofValue: 4).

	board add: (HyperJumpCell
			 withPosition: counterForPosition
			 Conversor: aConversor
			 andValues: values).
	counterForPosition := counterForPosition + 1
]

{ #category : #'set and get' }
BoardCreator >> createMoonWalkCells [

	| amountOfCells |
	amountOfCells := cells size.
	board add: (MoonWalkCell
			 withValueToMove: amountOfCells atRandom
			 inPosition: counterForPosition).
	counterForPosition := counterForPosition + 1
]

{ #category : #'set and get' }
BoardCreator >> createWormhole [

	board
		at: (wormholeCreator beginning enterOn: game)
		put: wormholeCreator ending.
	board
		at: (wormholeCreator ending enterOn: game)
		put: wormholeCreator beginning
]

{ #category : #initialization }
BoardCreator >> initializeWith: collectionOfCells ofLaps: numberOfLaps withWormholeCreator: aWormholeCreator [ 
	
	laps := numberOfLaps.
	cells := collectionOfCells.
	wormholeCreator := aWormholeCreator.
	board := OrderedCollection new.
	counterForPosition := 1.
]

{ #category : #initialization }
BoardCreator >> initializeWithCellsAndLaps: aCollectionAmountOfCellsAndLaps withWormholeCreator: aWormholeCreator andSpecialCellsDistruibution: aPercentagesOfDistrubitionSpecialCells [

	collectionAmountOfCellsAndLaps := aCollectionAmountOfCellsAndLaps.
	wormholeCreator := aWormholeCreator.
	percentagesOfDistrubitionSpecialCells := aPercentagesOfDistrubitionSpecialCells.
	board := OrderedCollection new.
	counterForPosition := 1.
	counterForIndex := 1
]

{ #category : #'set and get' }
BoardCreator >> laps [

	^ laps
]

{ #category : #position }
BoardCreator >> nextPosition [

	counterForIndex := counterForIndex + 1.
	counterForPosition := counterForIndex - 1 \\ self cells + 1
]

{ #category : #random }
BoardCreator >> numberGenerator [

	^ 100 atRandom
]
