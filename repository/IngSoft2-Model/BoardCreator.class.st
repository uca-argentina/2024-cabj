Class {
	#name : #BoardCreator,
	#superclass : #Object,
	#instVars : [
		'collectionAmountOfCellsAndLaps',
		'beginningAndEnd',
		'percentagesOfDistrubitionSpecialCells'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
BoardCreator class >> withCellsAndLaps: collectionAmountOfCellsAndLaps wormholeBeginningAndEnding: beginningAndEnd andSpecialCellsDistruibution: percentagesOfDistrubitionSpecialCells [

^(self new) initializeWithCellsAndLaps: collectionAmountOfCellsAndLaps wormholeBeginningAndEnding: beginningAndEnd andSpecialCellsDistruibution: percentagesOfDistrubitionSpecialCells
]

{ #category : #'set and get' }
BoardCreator >> amountOfAtomicBombCells [

	| amountOfCells percentageOfAtomicBomb amountOfAtomicBomb |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfAtomicBomb := percentagesOfDistrubitionSpecialCells
		                            at: 6.
	amountOfAtomicBomb := percentageOfAtomicBomb * amountOfCells
	                        // 100.

	^ amountOfAtomicBomb
]

{ #category : #'set and get' }
BoardCreator >> amountOfBlackHoleCells [

	| amountOfCells percentageOfBlackHoles amountOfBlackHoles |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfBlackHoles := percentagesOfDistrubitionSpecialCells
		                            at: 2.
	amountOfBlackHoles := percentageOfBlackHoles * amountOfCells
	                        // 100.

	^ amountOfBlackHoles
]

{ #category : #'set and get' }
BoardCreator >> amountOfHyperGravityCells [

	| amountOfCells percentageOfHyperGravityCells amountOfHyperGravityCells |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfHyperGravityCells := percentagesOfDistrubitionSpecialCells
		                            at: 3.
	amountOfHyperGravityCells := percentageOfHyperGravityCells * amountOfCells
	                        // 100.

	^ amountOfHyperGravityCells
]

{ #category : #'set and get' }
BoardCreator >> amountOfHyperJumpCells [

	| amountOfCells percentageOfHyperJump amountOfHyperJump |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfHyperJump := percentagesOfDistrubitionSpecialCells
		                            at: 5.
	amountOfHyperJump := percentageOfHyperJump * amountOfCells
	                        // 100.

	^ amountOfHyperJump
]

{ #category : #'set and get' }
BoardCreator >> amountOfMoonWalkCells [

	| amountOfCells percentageOfMoonWalk amountOfMoonWalk |
	amountOfCells := collectionAmountOfCellsAndLaps at: 1.
	percentageOfMoonWalk := percentagesOfDistrubitionSpecialCells
		                            at: 4.
	amountOfMoonWalk := percentageOfMoonWalk * amountOfCells
	                        // 100.

	^ amountOfMoonWalk
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
BoardCreator >> getBeginning [

	^ beginningAndEnd at: 1
]

{ #category : #'set and get' }
BoardCreator >> getCells [

	^ collectionAmountOfCellsAndLaps at: 1
]

{ #category : #'set and get' }
BoardCreator >> getEnding [

	^ beginningAndEnd at: 2
]

{ #category : #'set and get' }
BoardCreator >> getLaps [

	^ collectionAmountOfCellsAndLaps at: 2
]

{ #category : #initialization }
BoardCreator >> initializeWithCellsAndLaps: aCollectionAmountOfCellsAndLaps wormholeBeginningAndEnding: aBeginningAndEnd andSpecialCellsDistruibution: aPercentagesOfDistrubitionSpecialCells [

	collectionAmountOfCellsAndLaps := aCollectionAmountOfCellsAndLaps.
	beginningAndEnd := aBeginningAndEnd.
	percentagesOfDistrubitionSpecialCells := aPercentagesOfDistrubitionSpecialCells.
]
