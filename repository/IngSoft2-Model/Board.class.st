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
	anAmountOfBoxes < 2 ifTrue: [ Error signal: 'A Board must have more than one box.' ]. 
	^(self new) initializeOf: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd.
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
Board >> initializeOf: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd [ 
	amountOfBoxes:= anAmountOfBoxes .
	wormholeBeginning:= aBeginning .
	wormholeEnding:= anEnd .
	wormhole:= Wormhole beginning:  wormholeBeginning end: wormholeEnding. 
]
