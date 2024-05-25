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
BoardWithDefinedSpecialCell class >> ofCells: anAmountOfCells numberOfLaps: anAmountOfLaps withWormholeSides: collectionWormholePositions withSpecialCellOn: collectionSpecialCellAndPosition [

	anAmountOfCells < 2 ifTrue: [
		Error signal: 'A Board must have more than one cell.' ].
	(collectionWormholePositions at:2) <= (collectionWormholePositions at: 1) ifTrue: [
		Error signal: 'The ending must be greater than the beginning' ].
	^ self new
		  initializeofCells: anAmountOfCells
		  numberOfLaps: anAmountOfLaps
		  withWormholeSides: collectionWormholePositions
		  withSpecialCellOn: collectionSpecialCellAndPosition
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
	enterIndex := cellPosition + (amountOfCells * (lapPosition - 1)).
	enterResult := (collectionOfCells at: enterIndex) enter.
	enterResult - (amountOfCells * (lapPosition - 1)) < 0 ifTrue: [
		lapPosition := lapPosition - 1 ].
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
BoardWithDefinedSpecialCell >> initializeofCells: anAmountOfCells numberOfLaps: anAmountOfLaps withWormholeSides: collectionWormholePositions withSpecialCellOn: collectionSpecialCellAndPosition [

	amountOfIndex := anAmountOfCells * anAmountOfLaps.
	amountOfCells := anAmountOfCells.
	collectionOfCells := OrderedCollection new.
	numberOfLaps := anAmountOfLaps.
	1 to: amountOfIndex do: [ :index |
	collectionOfCells add: (RegularCell position: index) ].

	1 to: numberOfLaps do: [ :lap |
		collectionOfCells
			at: (collectionWormholePositions at: 1) + ((lap - 1) * amountOfCells)
			put: (RegularCell position:
					 (collectionWormholePositions at: 2) + ((lap - 1) * amountOfCells)).
		collectionOfCells
			at: (collectionWormholePositions at: 2) + ((lap - 1) * amountOfCells)
			put: (RegularCell position:
					 (collectionWormholePositions at: 1) + ((lap - 1) * amountOfCells)) ].
	1 to: numberOfLaps do: [ :lap |
		collectionOfCells
			at: (collectionSpecialCellAndPosition at: 2)
			put: ((collectionSpecialCellAndPosition at: 1) initializePosition:
					 (collectionSpecialCellAndPosition at: 2)) ]
]
