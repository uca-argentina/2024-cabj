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
	^(self new) initializeOf: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd.
]

{ #category : #initialization }
Board >> createWormholeAt: aBeginning and: anEnd [

	wormholeBeginning := WormholeBeginning atPosition: aBeginning.
	wormholeEnding := WormholeEnding atPosition: anEnd.
	wormholeBeginning withEnd: wormholeEnding.
	wormholeEnding withBeginning: wormholeBeginning
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
	self createWormholeAt: aBeginning and: anEnd.

	collectionOfBoxes := OrderedCollection new.
	1 to: anAmountOfBoxes do: [ :index |
	collectionOfBoxes add: (RegularCell position: index) ].

	collectionOfBoxes at: aBeginning put: wormholeBeginning.
	collectionOfBoxes at: anEnd put: wormholeEnding
]

{ #category : #'action handling' }
Board >> legalMoveFrom: aPosition move: aMovement [  
	(aPosition+aMovement)<amountOfBoxes ifTrue:[^aMovement].
	^(amountOfBoxes-aPosition).
]
