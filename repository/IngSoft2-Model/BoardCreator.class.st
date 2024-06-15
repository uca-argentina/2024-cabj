Class {
	#name : #BoardCreator,
	#superclass : #Object,
	#instVars : [
		'collectionAmountOfCellsAndLaps',
		'beginningAndEnd',
		'percentagesOfDistrubitionSpecialCells',
		'numbers',
		'randomCollection',
		'counterForCreation',
		'wormholeCreator'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BoardCreator class >> withCellsAndLaps: collectionAmountOfCellsAndLaps withWormholeCreator: aWormholeCreator andSpecialCellsDistruibution: percentagesOfDistrubitionSpecialCells [

^(self new) initializeWithCellsAndLaps: collectionAmountOfCellsAndLaps withWormholeCreator: aWormholeCreator  andSpecialCellsDistruibution: percentagesOfDistrubitionSpecialCells
]

{ #category : #'set and get' }
BoardCreator >> amountOfRegularCells [

	| amountOfCells percentageOfRegularCells amountOfRegularCells |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfRegularCells := percentagesOfDistrubitionSpecialCells
		                            at: 1.
	amountOfRegularCells := percentageOfRegularCells * amountOfCells
	                        // 100.

	^ amountOfRegularCells
]

{ #category : #'set and get' }
BoardCreator >> cells [
 
	^ collectionAmountOfCellsAndLaps at: 1
]

{ #category : #'set and get' }
BoardCreator >> createAtomicBombCells: aGame [

	| amountOfCells percentageOfAtomicBomb amountOfAtomicBomb index aPosition |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfAtomicBomb := percentagesOfDistrubitionSpecialCells at: 6.
	amountOfAtomicBomb := percentageOfAtomicBomb * amountOfCells // 100.

	amountOfAtomicBomb timesRepeat: [
		index := counterForCreation atRandom.
		counterForCreation := counterForCreation - 1.
		aPosition := numbers at: index.
		randomCollection at: aPosition put: (AtomicBombCell
				 withPostion: aPosition
				 onTheGame: aGame).
		numbers removeAt: index ]
]

{ #category : #'set and get' }
BoardCreator >> createBlackHoleCells [

	| amountOfCells percentageOfBlackHoles amountOfBlackHoles index aPosition |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfBlackHoles := percentagesOfDistrubitionSpecialCells
		                            at: 2.
	amountOfBlackHoles := percentageOfBlackHoles * amountOfCells
	                        // 100.

	amountOfBlackHoles timesRepeat: [
		index := counterForCreation atRandom.
		counterForCreation := counterForCreation - 1.
		aPosition := numbers at: index.
		randomCollection at: aPosition put: (BlackHoleCell position: aPosition).
		numbers removeAt: index ].
]

{ #category : #creation }
BoardCreator >> createBoardFor: aCollectionOfSpaceships with: aTurnManager andMaxThrowOf: aThrowResult on:aGame [

	|  amountOfCells anAmountOfIndex currentLap|
	amountOfCells := self cells.
	anAmountOfIndex := amountOfCells * self laps.

	1 to: anAmountOfIndex do: [ :indexAux |
		currentLap := indexAux - 1 // amountOfCells.
		randomCollection add:
			(RegularCell position: indexAux - (amountOfCells * currentLap)) ].

	self createAtomicBombCells: aGame.
	self createBlackHoleCells.
	self createHyperGravityCells: aThrowResult.
	self createHyperJumpCells.
	self createMoonWalkCellsWith: aGame.
	self createWormhole.

	^ randomCollection
]

{ #category : #'set and get' }
BoardCreator >> createHyperGravityCells: aThrowMax [

	| amountOfCells percentageOfHyperGravityCells amountOfHyperGravityCells index aPosition |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfHyperGravityCells := percentagesOfDistrubitionSpecialCells
		                                 at: 3.
	amountOfHyperGravityCells := percentageOfHyperGravityCells
	                             * amountOfCells // 100.

	amountOfHyperGravityCells timesRepeat: [
		index := counterForCreation atRandom.
		counterForCreation := counterForCreation - 1.
		aPosition := numbers at: index.
		randomCollection at: aPosition put: (HyperGravityCell
				 withValueToMove: aThrowMax atRandom
				 inPosition: aPosition).
		numbers removeAt: index ]
]

{ #category : #'set and get' }
BoardCreator >> createHyperJumpCells [

	| amountOfCells percentageOfHyperJump amountOfHyperJump parsecs index aPosition |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfHyperJump := percentagesOfDistrubitionSpecialCells at: 5.
	amountOfHyperJump := percentageOfHyperJump * amountOfCells // 100.
	parsecs := Parsecs
		           totalCells: amountOfCells
		           convertionValue: amountOfCells // 2.

	amountOfHyperJump timesRepeat: [
		index := counterForCreation atRandom.
		counterForCreation := counterForCreation - 1.
		aPosition := numbers at: index.
		randomCollection at: aPosition put: (HyperJumpCell
				 withPosition: aPosition
				 Parsecs: parsecs
				 andValues: #( 10 8 6 4 2 )).
		numbers removeAt: index]
]

{ #category : #'set and get' }
BoardCreator >> createMoonWalkCellsWith: aGame [

	| amountOfCells percentageOfMoonWalk amountOfMoonWalk index aPosition |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfMoonWalk := percentagesOfDistrubitionSpecialCells at: 4.
	amountOfMoonWalk := percentageOfMoonWalk * amountOfCells // 100.

	amountOfMoonWalk timesRepeat: [
		index := counterForCreation atRandom.
		counterForCreation := counterForCreation - 1.
		aPosition := numbers at: index.
		randomCollection at: aPosition put: (MoonWalkCell
				 withValueToMove: amountOfCells atRandom
				 inPosition: aPosition
				 on: aGame).
		numbers removeAt: index ]
]

{ #category : #'set and get' }
BoardCreator >> createWormhole [

	| positionWithinLap anAmountOfCells anAmountOfLaps |
	anAmountOfCells := self cells.
	anAmountOfLaps := self laps.

	1 to: anAmountOfLaps do: [ :lap |
		positionWithinLap := anAmountOfCells * (lap - 1).
		randomCollection
			at: wormholeCreator beginning enter + positionWithinLap
			put: wormholeCreator ending.
		randomCollection
			at: wormholeCreator ending enter + positionWithinLap
			put: wormholeCreator beginning ]
]

{ #category : #initialization }
BoardCreator >> initializeWithCellsAndLaps: aCollectionAmountOfCellsAndLaps withWormholeCreator: aWormholeCreator andSpecialCellsDistruibution: aPercentagesOfDistrubitionSpecialCells [

	collectionAmountOfCellsAndLaps := aCollectionAmountOfCellsAndLaps.
	wormholeCreator := aWormholeCreator .
	percentagesOfDistrubitionSpecialCells := aPercentagesOfDistrubitionSpecialCells.
	numbers := (1 to: self cells ) asOrderedCollection.
	randomCollection := OrderedCollection new.
	counterForCreation := self cells
]

{ #category : #'set and get' }
BoardCreator >> laps [

	^ collectionAmountOfCellsAndLaps at: 2
]
