Class {
	#name : #AllShipsDisabledHandler,
	#superclass : #Object,
	#instVars : [
		'fuel'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'set and get' }
AllShipsDisabledHandler >> getFuel [
	^fuel.
]

{ #category : #setter }
AllShipsDisabledHandler >> loadFuel: amountOfFuel [ 
	fuel:=amountOfFuel .
]

{ #category : #accessing }
AllShipsDisabledHandler >> move: amountOfMovements on: aBoard [ 
	^1.
]

{ #category : #accessing }
AllShipsDisabledHandler >> position [

	^ OrderedCollection with: 1 with: 1
]
