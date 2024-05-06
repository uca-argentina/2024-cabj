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
Board >> collectBoxes: numberOfBoxes withCounter: aCounter [

	| counter |
	counter := aCounter.

	numberOfBoxes timesRepeat: [
		collectionOfBoxes add: (Box position: counter).
		counter := counter + 1 ].
	^ counter
]

{ #category : #initialization }
Board >> createCollectioOfBoxes: anAmountOfBoxes with: aBeginning and: anEnd [

	| counter |
	collectionOfBoxes := OrderedCollection new.
	counter := 1.
	counter := self collectBoxes: aBeginning - 1 withCounter: counter.
	collectionOfBoxes add: wormholeBeginning.
	counter := counter + 1.
	counter := self
		           collectBoxes: anEnd - 1 - aBeginning
		           withCounter: counter.
	collectionOfBoxes add: wormholeEnding.
	counter := counter + 1.
	counter := self
		           collectBoxes: anAmountOfBoxes - anEnd
		           withCounter: counter
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
	self
		createCollectioOfBoxes: anAmountOfBoxes
		with: aBeginning
		and: anEnd
]

{ #category : #'action handling' }
Board >> legalMoveFrom: aPosition move: aMovement [  
	(aPosition+aMovement)<amountOfBoxes ifTrue:[^aMovement].
	^(amountOfBoxes-aPosition).
]
