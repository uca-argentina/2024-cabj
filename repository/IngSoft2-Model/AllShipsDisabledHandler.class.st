Class {
	#name : #AllShipsDisabledHandler,
	#superclass : #Object,
	#instVars : [
		'fuel',
		'objectPosition'
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

	objectPosition := Position startGame.
	objectPosition setIndexWith: 10
]

{ #category : #setter }
AllShipsDisabledHandler >> loadFuel: amountOfFuel [ 
	fuel:=amountOfFuel .
]

{ #category : #accessing }
AllShipsDisabledHandler >> move: aNumberOfMovements on: aBoard [

	^ self objectPosition
]

{ #category : #accessing }
AllShipsDisabledHandler >> objectPosition [

	^ objectPosition
]

{ #category : #accessing }
AllShipsDisabledHandler >> position [

	^ OrderedCollection with: 1 with: 1
]
