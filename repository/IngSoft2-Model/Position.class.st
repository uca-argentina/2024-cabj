Class {
	#name : #Position,
	#superclass : #Object,
	#instVars : [
		'cell',
		'lap',
		'completedLaps',
		'amountOfCells',
		'index'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Position class >> startGame [

	^ self new initializeStartGame
]

{ #category : #accessing }
Position >> cell [

	^ cell
]

{ #category : #'set and get' }
Position >> completedLaps [

	^ completedLaps
]

{ #category : #'set and get' }
Position >> completedLapsWith: anAmountOfCells [

	completedLaps := anAmountOfCells * (self lap - 1).
	^ completedLaps
]

{ #category : #'set and get' }
Position >> getIndex [

	^ index
]

{ #category : #'set and get' }
Position >> getPosition [

	^ OrderedCollection with: cell with: lap
]

{ #category : #initialization }
Position >> initializeStartGame [

	cell := 1.
	lap := 1
]

{ #category : #accessing }
Position >> lap [

	^ lap
]

{ #category : #initialization }
Position >> setCell: aCellNumber [

	cell := aCellNumber.
]

{ #category : #'set and get' }
Position >> setCellAndLapWith: anIndex and: aCell [

	| actualLap difference temporalIndex temporalCell |
	temporalIndex := anIndex.
	temporalCell := aCell.
	actualLap := self lap.
	aCell - completedLaps < 0 ifTrue: [ actualLap := actualLap - 1 ].
	aCell > amountOfCells ifTrue: [
		difference := aCell - anIndex.
		temporalIndex := anIndex + difference.
		temporalCell := aCell - amountOfCells ].
	actualLap := temporalIndex - 1 // amountOfCells + 1.
	self setCell: temporalCell.
	self setLap: actualLap.
	self setIndexWith: amountOfCells
]

{ #category : #'set and get' }
Position >> setIndexWith: anAmountOfCells [

	amountOfCells := anAmountOfCells.
	index := self cell + (self completedLapsWith: anAmountOfCells).
	^ index
]

{ #category : #initialization }
Position >> setLap: aLapNumber [

	lap := aLapNumber
]
