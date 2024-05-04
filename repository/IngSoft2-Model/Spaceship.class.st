Class {
	#name : #Spaceship,
	#superclass : #Object,
	#classVars : [
		'Position'
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
	Position:= 0.
]

{ #category : #accessing }
Spaceship >> move: aNumberOfMovements [
	Position := Position +aNumberOfMovements .
	^ Position . 
]

{ #category : #'as yet unclassified' }
Spaceship >> playWith: aLoadedDie on: aBoard [ 
	
	| movements |
	movements:= self move: (aLoadedDie throw).
	
	Position:= aBoard enterWormhole: movements.
	
	^Position . 
]

{ #category : #accessing }
Spaceship >> position [
^Position.
]
