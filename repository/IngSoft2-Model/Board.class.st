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
Board class >> of: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd [

	anAmountOfBoxes < 2 ifTrue: [
		Error signal: 'A Board must have more than one box.' ].
	anEnd <= aBeginning ifTrue: [
		Error signal: 'The ending must be greater than the beginning' ].
	aBeginning = 1 ifTrue: [
		Error signal: 'The beggining position of the wormhole should be greater than one' ].
	anEnd  = anAmountOfBoxes  ifTrue: [
		Error signal: 'The ending position of the wormhole should be lower than the amount of cells' ].
	^ self new
		  initializeOf: anAmountOfBoxes
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
Board >> initializeOf: anAmountOfCells withWormholeBeginning: aBeginning andEnding: anEnd [

	amountOfCells := anAmountOfCells.

	collectionOfCells := OrderedCollection new.

	collectionOfCells := (1 to: anAmountOfCells) collect: [ :index |
		                     RegularCell position: index ].


	collectionOfCells at: aBeginning put: (RegularCell position: anEnd).
	collectionOfCells at: anEnd put: (RegularCell position: aBeginning)
]
