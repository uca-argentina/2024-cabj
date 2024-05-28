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

{ #category : #'as yet unclassified' }
BoardCreator >> getBeginning [

	^ beginningAndEnd at: 1
]

{ #category : #'as yet unclassified' }
BoardCreator >> getCells [

	^ collectionAmountOfCellsAndLaps at: 1
]

{ #category : #'as yet unclassified' }
BoardCreator >> getEnding [

	^ beginningAndEnd at: 2
]

{ #category : #'as yet unclassified' }
BoardCreator >> getLaps [

	^ collectionAmountOfCellsAndLaps at: 2
]

{ #category : #initialization }
BoardCreator >> initializeWithCellsAndLaps: aCollectionAmountOfCellsAndLaps wormholeBeginningAndEnding: aBeginningAndEnd andSpecialCellsDistruibution: aPercentagesOfDistrubitionSpecialCells [

	collectionAmountOfCellsAndLaps := aCollectionAmountOfCellsAndLaps.
	beginningAndEnd := aBeginningAndEnd.
	percentagesOfDistrubitionSpecialCells := aPercentagesOfDistrubitionSpecialCells.
]
