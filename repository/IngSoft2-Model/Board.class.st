Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'amountOfCells',
		'collectionOfCells'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> ofCells: anAmountOfCells numberOfLaps: aNumberOfLaps withWormholeBeginning: aBeginning andEnding: anEnd [

	anAmountOfCells < 2 ifTrue: [
		Error signal: 'A Board must have more than one box.' ].
	anEnd <= aBeginning ifTrue: [
		Error signal: 'The ending must be greater than the beginning' ].
	^ self new
		  initializeOf: anAmountOfCells
		  numberOfLaps: aNumberOfLaps
		  withWormholeBeginning: aBeginning
		  andEnding: anEnd
]

{ #category : #'action handling' }
Board >> adjustMovementWithinBoundsFrom: aPosition by: aMovement [

	aPosition + aMovement < amountOfCells ifTrue: [ ^ aMovement ].
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

{ #category : #initialization }
Board >> initializeOf: anAmountOfCells numberOfLaps: aNumberOfLaps withWormholeBeginning: aBeginning andEnding: anEnd [ 
	amountOfCells := anAmountOfCells * aNumberOfLaps .

	collectionOfCells := OrderedCollection new.
	1 to: anAmountOfCells do: [ :index |
	collectionOfCells add: (RegularCell position: index) ].

	collectionOfCells at: aBeginning put: (RegularCell position: anEnd).
	collectionOfCells at: anEnd put: (RegularCell position: aBeginning)
]
