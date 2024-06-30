Class {
	#name : #BoardCreator,
	#superclass : #Object,
	#instVars : [
		'wormholeCreator',
		'game',
		'board',
		'counterForPosition',
		'laps',
		'cells',
		'maxThrow'
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
BoardCreator >> createBoardFor: aGame with: aTurnManager andMaxThrowOf: aNumber [

	| amountOfCells anAmountOfIndex |
	game := aGame.
	maxThrow := aNumber.
	amountOfCells := cells size.
	anAmountOfIndex := amountOfCells * laps.

	cells do: [ :cell | cell value: self ].

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
			 withValueToMove: maxThrow//2
			 inPosition: counterForPosition).
	counterForPosition := counterForPosition + 1
]

{ #category : #'set and get' }
BoardCreator >> createHyperJumpCells [

	| amountOfCells aConversor values |
	amountOfCells := cells size.
	aConversor := Conversor
		              totalCells: amountOfCells
		              convertionValue: amountOfCells * 2.
	values := OrderedCollection
		          with: (Parsecs ofValue: 10)
		          with: (LightYear ofValue: 24)
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
			 withValueToMove: 4
			 inPosition: counterForPosition).
	counterForPosition := counterForPosition + 1
]

{ #category : #'set and get' }
BoardCreator >> createWormhole [

	board
		at: wormholeCreator beginning cell
		put: wormholeCreator beginning.
	board at: wormholeCreator ending cell put: wormholeCreator ending
]

{ #category : #initialization }
BoardCreator >> initializeWith: collectionOfCells ofLaps: numberOfLaps withWormholeCreator: aWormholeCreator [ 
	
	laps := numberOfLaps.
	cells := collectionOfCells.
	wormholeCreator := aWormholeCreator.
	board := OrderedCollection new.
	counterForPosition := 1.
]

{ #category : #'set and get' }
BoardCreator >> laps [

	^ laps
]
