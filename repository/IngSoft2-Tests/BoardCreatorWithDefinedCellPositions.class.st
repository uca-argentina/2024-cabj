Class {
	#name : #BoardCreatorWithDefinedCellPositions,
	#superclass : #Object,
	#instVars : [
		'collectionAmountOfCellsAndLaps',
		'beginningAndEnd',
		'collection',
		'wormholeCreator'
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
BoardCreatorWithDefinedCellPositions >> amountOfRegularCells [

	| amountOfCells  |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	

	^ amountOfCells
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
BoardCreatorWithDefinedCellPositions >> createBoardFor: aCollectionOfSpaceships with: aTurnManager andMaxThrowOf: aThrowResult on:aGame [

	| amountOfCells anAmountOfIndex |
	amountOfCells := self cells.
	anAmountOfIndex := amountOfCells * self laps.
	self
		createTheRegularCellsWithAnAmountOfCells: amountOfCells
		AndIndexs: anAmountOfIndex.

	self createOneAtomicBombCellAtPositionFiveWith:
		aGame.
	self createOneBlackHoleCellAtPositionSix.
	self
		createOneMoonWalkCellAtPositionSevenWith: aGame.
	self createOneHyperGravityCellAtPositionEight.
	self createOneHyperJumpCellAtPositionNine.
	self createWormhole.

	^ collection
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneAtomicBombCellAtPositionFiveWith: aGame [

	collection
		at: 5
		put:
		(AtomicBombCell
			 withPostion: 5
			 onTheGame: aGame)
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneBlackHoleCellAtPositionSix [

	collection at: 6 put: (BlackHoleCell position: 6)
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneHyperGravityCellAtPositionEight [

	collection
		at: 8
		put: (HyperGravityCell withValueToMove: 3 inPosition: 8)
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneHyperJumpCellAtPositionNine [

	collection at: 9 put: (HyperJumpCell
			 withPosition: 9
			 Parsecs: (Parsecs totalCells: 10 convertionValue: 5)
			 andValues: #( 2 1 ))
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneMoonWalkCellAtPositionSevenWith: aGame [

	collection
		at: 7
		put: (MoonWalkCell withValueToMove: 4 inPosition: 7 on: aGame)
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createTheRegularCellsWithAnAmountOfCells: amountOfCells AndIndexs: anAmountOfIndex [

	| currentLap |
	1 to: anAmountOfIndex do: [ :indexAux |
		currentLap := indexAux - 1 // amountOfCells.
		collection add:
			(RegularCell position: indexAux - (amountOfCells * currentLap)) ]
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> createWormhole [

	| positionWithinLap anAmountOfCells anAmountOfLaps |
	anAmountOfCells := self cells.
	anAmountOfLaps := self laps.

	1 to: anAmountOfLaps do: [ :lap |
		positionWithinLap := anAmountOfCells * (lap - 1).
		collection
			at: wormholeCreator beginning enter + positionWithinLap
			put: wormholeCreator ending.
		collection
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
	collection := OrderedCollection new
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> laps [

	^ collectionAmountOfCellsAndLaps at: 2
]
