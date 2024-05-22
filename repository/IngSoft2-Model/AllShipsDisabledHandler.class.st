Class {
	#name : #AllShipsDisabledHandler,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AllShipsDisabledHandler >> move: amountOfMovements on: aBoard [ 
	^1.
]

{ #category : #accessing }
AllShipsDisabledHandler >> position [

	^ OrderedCollection with: 1 with: 1
]
