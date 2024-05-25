Class {
	#name : #BoardWithDefinedSpecialCell,
	#superclass : #Object,
	#instVars : [
		'amountOfCells',
		'collectionOfCells',
		'numberOfLaps',
		'amountOfIndex'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
BoardWithDefinedSpecialCell class >> ofCells: anAmountOfCells numberOfLaps: anAmountOfLaps withSpecialCell: aSpecialCell On: anIndex [

	anAmountOfCells < 2 ifTrue: [
		Error signal: 'A Board must have more than one cell.' ].
	^ self new
		  initializeOfCells: anAmountOfCells
		  numberOfLaps: anAmountOfLaps
		  withSpecialCell: aSpecialCell
		  On: anIndex
]

{ #category : #'action handling' }
BoardWithDefinedSpecialCell >> adjustMovementWithinBoundsFrom: aPosition by: aMovement [

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
BoardWithDefinedSpecialCell >> enter: aPosition [

	| cellPosition lapPosition nextPosition enterIndex enterResult |
	cellPosition := aPosition at: 1.
	lapPosition := aPosition at: 2.
	enterIndex := cellPosition + ((lapPosition - 1) * amountOfCells).
	enterResult := (collectionOfCells at: enterIndex) enter.
	enterResult > amountOfCells ifTrue: [
		enterResult := enterResult - (amountOfCells * lapPosition).
		lapPosition := lapPosition + 1 ].
	nextPosition := OrderedCollection with: enterResult.
	nextPosition add: lapPosition.
	^ nextPosition
]

{ #category : #accessing }
BoardWithDefinedSpecialCell >> finishLine [

	^ OrderedCollection with: amountOfCells with: numberOfLaps
]

{ #category : #initialization }
BoardWithDefinedSpecialCell >> initializeOfCells: anAmountOfCells numberOfLaps: anAmountOfLaps withSpecialCell: aSpecialCell On: anIndex [

	amountOfIndex := anAmountOfCells * anAmountOfLaps.
	amountOfCells := anAmountOfCells.
	collectionOfCells := OrderedCollection new.
	numberOfLaps := anAmountOfLaps.
	1 to: amountOfIndex do: [ :index |
	collectionOfCells add: (RegularCell position: index) ].

	1 to: numberOfLaps do: [ :lap |
		collectionOfCells
			at: anIndex 
			put: (aSpecialCell initializePosition: anIndex) ]
]
