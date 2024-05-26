Class {
	#name : #AllShipsDisabledHandler,
	#superclass : #Object,
	#instVars : [
		'fuel',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AllShipsDisabledHandler class >> fakeLaunch [

	^ self new initializeFakeLaunch
]

{ #category : #'set and get' }
AllShipsDisabledHandler >> getFuel [
	^fuel.
]

{ #category : #initialization }
AllShipsDisabledHandler >> initializeFakeLaunch [

	position := Position startGame
]

{ #category : #setter }
AllShipsDisabledHandler >> loadFuel: amountOfFuel [ 
	fuel:=amountOfFuel .
]

{ #category : #accessing }
AllShipsDisabledHandler >> move: aNumberOfMovements on: aBoard of: amountOfCells [

	^ self objectPosition
]

{ #category : #accessing }
AllShipsDisabledHandler >> objectPosition [

	^ position
]
