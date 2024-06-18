Class {
	#name : #BoardCreatorWithDefinedCellPositions,
	#superclass : #Object,
	#instVars : [
		'collectionAmountOfCellsAndLaps',
		'beginningAndEnd',
		'wormholeCreator',
		'board'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
BoardCreatorWithDefinedCellPositions class >> withCellsAndLaps: collectionAmountOfCellsAndLaps wormholeCreator: aWormholeCreator [

	^ self new
		  initializeWithCellsAndLaps: collectionAmountOfCellsAndLaps
		  wormholeCreator: aWormholeCreator
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> beginning [

	^ beginningAndEnd at: 1
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> cells [

	^ collectionAmountOfCellsAndLaps at: 1
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createBoardFor: aGame with: aTurnManager andMaxThrowOf: aThrowResult [

	| amountOfCells anAmountOfIndex |
	amountOfCells := self cells.
	anAmountOfIndex := amountOfCells * self laps.
	self
		createTheRegularCellsWithAnAmountOfCells: amountOfCells
		AndIndexs: anAmountOfIndex.
	
	self createOneCardDispenserCellAtPositionFourWith: aGame.
	self createOneAtomicBombCellAtPositionFiveWith: aGame.
	self createOneBlackHoleCellAtPositionSix.
	self createOneMoonWalkCellAtPositionSevenWith: aGame.
	self createOneHyperGravityCellAtPositionEight.
	self createOneHyperJumpCellAtPositionNine.
	self createWormhole.

	^ board
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneAtomicBombCellAtPositionFiveWith: aGame [

	board
		at: 5
		put: (AtomicBombCell withPostion: 5 onTheGame: aGame)
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneBlackHoleCellAtPositionSix [

	board at: 6 put: (BlackHoleCell position: 6)
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneCardDispenserCellAtPositionFourWith: aGame [

	board
		at: 4
		put: (CardDispenserCell withPostion: 4 onTheGame: aGame)
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneHyperGravityCellAtPositionEight [

	board
		at: 8
		put: (HyperGravityCell withValueToMove: 3 inPosition: 8)
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneHyperJumpCellAtPositionNine [

	board at: 9 put: (HyperJumpCell
			 withPosition: 9
			 Conversor: (Conversor totalCells: 10 convertionValue: 5)
			 andValues: (OrderedCollection
					  with: (Parsecs ofValue: 2)
					  with: (Parsecs ofValue: 1)))
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneMoonWalkCellAtPositionSevenWith: aGame [

	board
		at: 7
		put: (MoonWalkCell withValueToMove: 4 inPosition: 7 on: aGame)
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createTheRegularCellsWithAnAmountOfCells: amountOfCells AndIndexs: anAmountOfIndex [

	| currentLap |
	1 to: anAmountOfIndex do: [ :indexAux |
		currentLap := indexAux - 1 // amountOfCells.
		board add:
			(Cell position: indexAux - (amountOfCells * currentLap)) ]
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> createWormhole [

	| positionWithinLap anAmountOfCells anAmountOfLaps |
	anAmountOfCells := self cells.
	anAmountOfLaps := self laps.

	1 to: anAmountOfLaps do: [ :lap |
		positionWithinLap := anAmountOfCells * (lap - 1).
		board
			at: wormholeCreator beginning enter + positionWithinLap
			put: wormholeCreator ending.
		board
			at: wormholeCreator ending enter + positionWithinLap
			put: wormholeCreator beginning ]
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> ending [

	^ beginningAndEnd at: 2
]

{ #category : #initialization }
BoardCreatorWithDefinedCellPositions >> initializeWithCellsAndLaps: aCollectionAmountOfCellsAndLaps wormholeCreator: aWormholeCreator [

	collectionAmountOfCellsAndLaps := aCollectionAmountOfCellsAndLaps.
	wormholeCreator := aWormholeCreator.
	board := OrderedCollection new
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> laps [

	^ collectionAmountOfCellsAndLaps at: 2
]
