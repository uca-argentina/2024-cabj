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
		'counterForPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BoardCreator class >> withCellsAndLaps: collectionAmountOfCellsAndLaps withWormholeCreator: aWormholeCreator andSpecialCellsDistruibution: percentagesOfDistrubitionSpecialCells [

(percentagesOfDistrubitionSpecialCells sum <= 100) ifFalse: [ Error signal: 'Sum of probabilities must be lower or equal to one hundred'].

^(self new) initializeWithCellsAndLaps: collectionAmountOfCellsAndLaps withWormholeCreator: aWormholeCreator  andSpecialCellsDistruibution: percentagesOfDistrubitionSpecialCells
]

{ #category : #'set and get' }
BoardCreator >> cells [

	^ collectionAmountOfCellsAndLaps at: 1
]

{ #category : #'set and get' }
BoardCreator >> createAtomicBombCells [

	board add: (AtomicBombCell position: counterForPosition).
	self nextPosition
]

{ #category : #'set and get' }
BoardCreator >> createBlackHoleCells [

	board add: (BlackHoleCell position: counterForPosition).
	self nextPosition
]

{ #category : #creation }
BoardCreator >> createBoardFor: aGame with: aTurnManager andMaxThrowOf: aThrowResult [

	| amountOfCells anAmountOfIndex aEffectManager |
	game := aGame.
	throwResult := aThrowResult.
	amountOfCells := self cells.
	anAmountOfIndex := amountOfCells * self laps.

	aEffectManager := EffectManager
		                  for: self
		                  probabilitiesDistribution:
		                  percentagesOfDistrubitionSpecialCells.

	anAmountOfIndex timesRepeat: [
		(aEffectManager createEffect: self numberGenerator) value ].

	self createWormhole.

	^ board
]

{ #category : #'set and get' }
BoardCreator >> createCardDispenserCells [

	board add:
		(CardDispenserCell position: counterForPosition ).
	self nextPosition
]

{ #category : #'set and get' }
BoardCreator >> createCells [

	board add: (Cell position: counterForPosition).
	self nextPosition
]

{ #category : #'set and get' }
BoardCreator >> createHyperGravityCells [

	board add: (HyperGravityCell
			 withValueToMove: throwResult atRandom
			 inPosition: counterForPosition).
	self nextPosition
]

{ #category : #'set and get' }
BoardCreator >> createHyperJumpCells [

	| amountOfCells parsecs |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	parsecs := Conversor
		           totalCells: amountOfCells
		           convertionValue: amountOfCells // 2.

	board add: (HyperJumpCell
			 withPosition: counterForPosition
			 Conversor: parsecs
			 andValues: #( 10 8 6 4 2 )).
	self nextPosition
]

{ #category : #'set and get' }
BoardCreator >> createMoonWalkCells [

	| amountOfCells |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	board add: (MoonWalkCell
			 withValueToMove: amountOfCells atRandom
			 inPosition: counterForPosition).
	self nextPosition
]

{ #category : #'set and get' }
BoardCreator >> createWormhole [

	| positionWithinLap anAmountOfCells anAmountOfLaps |
	anAmountOfCells := self cells.
	anAmountOfLaps := self laps.

	1 to: anAmountOfLaps do: [ :lap |
		positionWithinLap := anAmountOfCells * (lap - 1).
		board
			at: (wormholeCreator beginning enterOn:game) + positionWithinLap
			put: wormholeCreator ending.
		board
			at: (wormholeCreator ending enterOn:game) + positionWithinLap
			put: wormholeCreator beginning ]
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

	^ collectionAmountOfCellsAndLaps at: 2
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
