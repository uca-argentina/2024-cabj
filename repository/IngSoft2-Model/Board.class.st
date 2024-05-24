Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'amountOfCells',
		'collectionOfCells',
		'numberOfLaps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> ofCells: anAmountOfCells numberOfLaps: anAmountOfLaps withWormholeBeginning: aBeginning andEnding: anEnd [

	anAmountOfCells < 2 ifTrue: [
		Error signal: 'A Board must have more than one cell.' ].
	anEnd <= aBeginning ifTrue: [
		Error signal: 'The ending must be greater than the beginning' ].
	^ self new
		  initializeOfCells: anAmountOfCells
		  numberOfLaps: anAmountOfLaps
		  withWormholeBeginning: aBeginning
		  andEnding: anEnd
]

{ #category : #'action handling' }
Board >> adjustMovementWithinBoundsFrom: aPosition by: aMovement [

	aPosition + aMovement < amountOfCells ifTrue: [ ^ aMovement ].
	numberOfLaps :=numberOfLaps -1.
	^ amountOfCells - aPosition
]

{ #category : #action }
Board >> enter: aPosition [

	^ (collectionOfCells at: aPosition) enter
]

{ #category : #accessing }
Board >> finishLine [

	^ amountOfCells
]

{ #category : #accessing }
Board >> getLap [
	^numberOfLaps .
]

{ #category : #initialization }
Board >> initializeOfCells: anAmountOfCells numberOfLaps: anAmountOfLaps withWormholeBeginning: aBeginning andEnding: anEnd [

	amountOfCells := anAmountOfCells.

	collectionOfCells := OrderedCollection new.
	1 to: anAmountOfCells do: [ :index |
	collectionOfCells add: (RegularCell position: index) ].
	numberOfLaps := 1.

	collectionOfCells at: aBeginning put: (RegularCell position: anEnd).
	collectionOfCells at: anEnd put: (RegularCell position: aBeginning)
]
