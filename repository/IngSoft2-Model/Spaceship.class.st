Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'actualPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #toDelete }
Spaceship class >> beginGame [
	^ (self new) initializeBeginGame.
]

{ #category : #'instance creation' }
Spaceship class >> launch [
	^(self new) initializeLaunch.
]

{ #category : #initialization }
Spaceship >> initializeLaunch [
	actualPosition:= 0.
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements [
	actualPosition   := actualPosition + aNumberOfMovements .
	^ actualPosition . 
]

{ #category : #action }
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
