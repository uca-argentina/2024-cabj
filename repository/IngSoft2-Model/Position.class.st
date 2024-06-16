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
Position >> index [

	^ index
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

{ #category : #'set and get' }
Position >> position [

	^ OrderedCollection with: cell with: lap
]

{ #category : #initialization }
Position >> resetToOne [

	cell := 1.
	index := cell * lap
]

{ #category : #'set and get' }
Position >> updateCellAndLapWith: anIndex [

	cell := anIndex - 1 \\ amountOfCells + 1.
	lap := anIndex - 1 // amountOfCells + 1.

	self updateIndexWith: amountOfCells
]

{ #category : #'set and get' }
Position >> updateIndexWith: anAmountOfCells [

	amountOfCells := anAmountOfCells.
	index := self cell + (self completedLapsWith: anAmountOfCells).
	^ index
]
