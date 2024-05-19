Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'amountOfBoxes',
		'wormholeBeginning',
		'wormholeEnding',
		'wormhole',
		'collectionOfBoxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> of: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd [
	anAmountOfBoxes < 2 ifTrue: [ Error signal: 'A Board must have more than one box.' ]. 
	anEnd <= aBeginning  ifTrue: [
		Error signal: 'The ending must be greater than the beginning' ].
	^(self new) initializeOf: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd.
]

{ #category : #action }
Board >> enter: aPosition [ 
	
	| box |
	box:= collectionOfBoxes at: aPosition.
	^box enter.
	 
]

{ #category : #accessing }
Board >> finishLine [
	^amountOfBoxes .
]

{ #category : #initialization }
Board >> initializeOf: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd [

	amountOfBoxes := anAmountOfBoxes.

	collectionOfBoxes := OrderedCollection new.
	1 to: anAmountOfBoxes do: [ :index |
	collectionOfBoxes add: (RegularCell position: index) ].

	collectionOfBoxes at: aBeginning put: (RegularCell position: anEnd).
	collectionOfBoxes at: anEnd put: (RegularCell position: aBeginning).
]

{ #category : #'action handling' }
Board >> legalMoveFrom: aPosition move: aMovement [  
	(aPosition+aMovement)<amountOfBoxes ifTrue:[^aMovement].
	^(amountOfBoxes-aPosition).
]
