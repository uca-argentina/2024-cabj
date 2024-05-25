Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'amountOfCells',
		'collectionOfCells',
		'numberOfLaps',
		'amountOfIndex'
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

	| cellPosition lapPosition nextPosition enterIndex enterResult |
	cellPosition := aPosition at: 1.
	lapPosition := aPosition at: 2.
	enterIndex := cellPosition + (amountOfCells * (lapPosition - 1)).
	enterResult := (collectionOfCells at: enterIndex) enter.
	enterResult - (amountOfCells * (lapPosition - 1)) < 0 ifTrue: [
		lapPosition := lapPosition - 1 ].
	enterResult > (amountOfCells * lapPosition) ifTrue: [
		enterResult := enterResult - (amountOfCells * lapPosition).
		lapPosition := lapPosition + 1 ].
	enterResult > amountOfCells ifTrue: [
		enterResult := enterResult - amountOfCells ].
	nextPosition := OrderedCollection with: enterResult.
	nextPosition add: lapPosition.
	^ nextPosition
]

{ #category : #accessing }
Board >> finishLine [

	^ OrderedCollection with: amountOfCells with: numberOfLaps
]

{ #category : #initialization }
Board >> initializeOfCells: anAmountOfCells numberOfLaps: anAmountOfLaps withWormholeBeginning: aBeginning andEnding: anEnd [

	amountOfIndex := anAmountOfCells * anAmountOfLaps.
	amountOfCells := anAmountOfCells.
	collectionOfCells := OrderedCollection new.
	numberOfLaps := anAmountOfLaps.
	1 to: amountOfIndex do: [ :index |
	collectionOfCells add: (RegularCell position: index) ].

	1 to: numberOfLaps do: [ :lap |
		collectionOfCells
			at: aBeginning + ((lap-1) * amountOfCells)
			put: (RegularCell position: anEnd + ((lap-1) * amountOfCells)).
		collectionOfCells
			at: anEnd + ((lap-1) * amountOfCells)
			put: (RegularCell position: aBeginning + ((lap-1) * amountOfCells)) ]
]
