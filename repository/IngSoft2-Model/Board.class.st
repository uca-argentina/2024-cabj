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

	| currentPosition completedLaps actualPosition totalCells expectedPosition |
	currentPosition := aPosition at: 1.
	completedLaps := ((aPosition at: 2) - 1) * amountOfCells.
	actualPosition := currentPosition + completedLaps.
	totalCells := amountOfCells * numberOfLaps.
	expectedPosition := actualPosition + aMovement.

	expectedPosition < totalCells ifTrue: [ ^ aMovement ].

	^ totalCells - actualPosition
]

{ #category : #action }
Board >> enter: aPosition [

	| cellPosition lapPosition adjustedPosition nextPosition |
	cellPosition := aPosition at: 1.
	lapPosition := aPosition at: 2.
	adjustedPosition := cellPosition - amountOfCells.
	nextPosition := OrderedCollection new.
	cellPosition > amountOfCells
		ifTrue: [
			nextPosition add: (collectionOfCells at: adjustedPosition) enter.
			nextPosition add: lapPosition + 1 ]
		ifFalse: [
			nextPosition add: (collectionOfCells at: cellPosition) enter.
			nextPosition add: lapPosition ].
	^ nextPosition
]

{ #category : #accessing }
Board >> finishLine [

	^ OrderedCollection with: amountOfCells with: numberOfLaps
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
	numberOfLaps := anAmountOfLaps .

	collectionOfCells at: aBeginning put: (RegularCell position: anEnd).
	collectionOfCells at: anEnd put: (RegularCell position: aBeginning)
]
