Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'actualPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Spaceship class >> beginGame [
	^ (self new) initializeBeginGame.
]

{ #category : #private }
Spaceship class >> launch [
	^(self new) initializeLaunch.
]

{ #category : #initialization }
Spaceship >> initializeLaunch [
	actualPosition:= 0.
]

{ #category : #accessing }
Spaceship >> move: aNumberOfMovements [
	actualPosition   := actualPosition + aNumberOfMovements .
	^ actualPosition . 
]

{ #category : #'as yet unclassified' }
Spaceship >> playWith: aLoadedDie on: aBoard [ 
	
	| movements |
	movements:= aBoard legalMoveFrom: actualPosition move: (aLoadedDie throw).
	self move: movements .
	actualPosition  := aBoard enterWormhole: actualPosition.
	
	^actualPosition . 
]

{ #category : #accessing }
Spaceship >> position [
	^ actualPosition .
]
