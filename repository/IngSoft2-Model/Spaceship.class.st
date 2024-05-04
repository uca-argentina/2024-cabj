Class {
	#name : #Spaceship,
	#superclass : #Object,
	#classVars : [
		'Position'
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
	Position:= 0.
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements [
	Position := Position +aNumberOfMovements .
	^ Position . 
]

{ #category : #action }
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
