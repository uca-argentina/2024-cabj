Class {
	#name : #Position,
	#superclass : #Object,
	#instVars : [
		'cell',
		'lap'
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

{ #category : #'as yet unclassified' }
Position >> getIndexWith: amountOfCells [

	| completedLaps |
	completedLaps := amountOfCells * (self lap - 1).
	^ self cell + completedLaps
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

	cell := aCellNumber
]

{ #category : #initialization }
Position >> setLap: aLapNumber [

	lap := aLapNumber
]
