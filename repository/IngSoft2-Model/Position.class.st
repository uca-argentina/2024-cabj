Class {
	#name : #Position,
	#superclass : #Object,
	#instVars : [
		'cell',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Position class >> startGame [

	^ self new initializeStartGame
]

{ #category : #accessing }
Position >> = aPosition [

	^ self cell = aPosition cell and: self lap = aPosition lap
]

{ #category : #checking }
Position >> adjustPositionFor: aNumberOfMovements with: aFinishLine [

	| aux cellXLapsOfFinishLine amountOfCells completedLaps nextCell |
	aux := aNumberOfMovements.
	amountOfCells := aFinishLine cell.
	cellXLapsOfFinishLine := (aFinishLine cell) * (aFinishLine lap).
	self cellsXLaps + aNumberOfMovements > cellXLapsOfFinishLine ifTrue: [
		aux := cellXLapsOfFinishLine - self cellsXLaps.
		self updateLap: (aFinishLine lap) - lap ].

	cell + aux > amountOfCells ifTrue: [
		completedLaps := cell + aNumberOfMovements - 1 // amountOfCells + 1
		                 - 1.
		self updateLap: completedLaps.
		nextCell := cell + aNumberOfMovements
		            - (completedLaps * amountOfCells).
		aux := nextCell - cell ].

	self cellsXLaps + aux < 1 ifTrue: [ aux := 1 - cell ].
	^ aux
]

{ #category : #accessing }
Position >> cell [

	^ cell
]

{ #category : #'set and get' }
Position >> cellsXLaps [

	^ cell * lap
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

{ #category : #'set and get' }
Position >> updateCell: aNumber [

	cell := cell + aNumber
]

{ #category : #'set and get' }
Position >> updateLap: aNumber [

	lap := lap + aNumber
]
