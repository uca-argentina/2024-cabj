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
	| counter |
	amountOfBoxes:= anAmountOfBoxes .
	wormholeBeginning:= WormholeBeginning atPosition: aBeginning .
	wormholeEnding:= WormholeEnding  atPosition: anEnd .
	wormholeBeginning withEnd: wormholeEnding .
	wormholeEnding withBeginning: wormholeBeginning .
	
	collectionOfBoxes:= OrderedCollection new.
	counter:= 1.
	
	(aBeginning-1) timesRepeat: [ collectionOfBoxes add: (Box position: counter). 
											counter:= counter+1.].
	
	collectionOfBoxes add: wormholeBeginning .
	counter:= counter+1.
	
	((anEnd-1)-(aBeginning)) timesRepeat: [ collectionOfBoxes add: (Box position: counter). 
											counter:= counter+1.].
	
	collectionOfBoxes add: wormholeEnding .
	counter:= counter+1.
	
	(anAmountOfBoxes - anEnd) timesRepeat: [ collectionOfBoxes add: (Box position: counter). 
											counter:= counter+1.].
]

{ #category : #'action handling' }
Board >> legalMoveFrom: aPosition move: aMovement [  
	(aPosition+aMovement)<amountOfBoxes ifTrue:[^aMovement].
	^(amountOfBoxes-aPosition).
]
