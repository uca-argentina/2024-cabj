Class {
	#name : #BoardCreatorWithDefinedCellPositions,
	#superclass : #Object,
	#instVars : [
		'collectionAmountOfCellsAndLaps',
		'beginningAndEnd',
		'collection'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
BoardCreatorWithDefinedCellPositions class >> withCellsAndLaps: collectionAmountOfCellsAndLaps wormholeBeginningAndEnding: beginningAndEnd [

	^ self new
		  initializeWithCellsAndLaps: collectionAmountOfCellsAndLaps
		  wormholeBeginningAndEnding: beginningAndEnd
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> amountOfRegularCells [

	| amountOfCells  |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	

	^ amountOfCells
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createBoardFor: aCollectionOfSpaceships with: aTurnManager andMaxThrowOf: aThrowResult [

	| amountOfCells anAmountOfIndex |
	amountOfCells := self getCells.
	anAmountOfIndex := amountOfCells * self getLaps.
	self
		createTheRegularCellsWithAnAmountOfCells: amountOfCells
		AndIndexs: anAmountOfIndex.

	self createOneAtomicBombCellAtPositionFiveWith:
		aCollectionOfSpaceships.
	self createOneBlackHoleCellAtPositionSix.
	self
		createOneMoonWalkCellAtPositionSevenWith: aCollectionOfSpaceships
		and: aTurnManager.
	self createOneHyperGravityCellAtPositionEight.
	self createOneHyperJumpCellAtPositionNine.

	^ collection
]

{ #category : #creation }
BoardCreatorWithDefinedCellPositions >> createOneAtomicBombCellAtPositionFiveWith: aCollectionOfSpaceships [

	collection
		at: 5
		put:
		(AtomicBombCell
			 withPostion: 5
			 andSpaceships: aCollectionOfSpaceships)
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
BoardCreatorWithDefinedCellPositions >> createOneMoonWalkCellAtPositionSevenWith: aCollectionOfSpaceships and: aTurnManager [

	collection at: 7 put: (MoonWalkCell
			 withValueToMove: 4
			 inPosition: 7
			 andSpaceships: aCollectionOfSpaceships
			 managedBy: aTurnManager)
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
BoardCreatorWithDefinedCellPositions >> getBeginning [

	^ beginningAndEnd at: 1
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> getCells [

	^ collectionAmountOfCellsAndLaps at: 1
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> getEnding [

	^ beginningAndEnd at: 2
]

{ #category : #'set and get' }
BoardCreatorWithDefinedCellPositions >> getLaps [

	^ collectionAmountOfCellsAndLaps at: 2
]

{ #category : #initialization }
BoardCreatorWithDefinedCellPositions >> initializeWithCellsAndLaps: aCollectionAmountOfCellsAndLaps wormholeBeginningAndEnding: aBeginningAndEnd [

	collectionAmountOfCellsAndLaps := aCollectionAmountOfCellsAndLaps.
	beginningAndEnd := aBeginningAndEnd.
	collection := OrderedCollection new.
	
]
