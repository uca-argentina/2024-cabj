Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'actualPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Spaceship class >> launch [
	^(self new) initializeLaunch.
]

{ #category : #action }
Spaceship >> checkIf: sumOfThrows isLegalOn: aBoard [
	
	^(aBoard legalMoveFrom: actualPosition move: sumOfThrows).
	
]

{ #category : #initialization }
Spaceship >> initializeLaunch [
	actualPosition:= 0.
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements [
	actualPosition   := actualPosition + aNumberOfMovements .
	 
]

{ #category : #action }
Spaceship >> playWith: collectionOfDice on: aBoard [

	| movements sumOfThrows |
	
	sumOfThrows := self sumOfThrows: collectionOfDice.
	
	movements := self checkIf: sumOfThrows isLegalOn: aBoard.
	
	self move: movements.
	
	actualPosition := aBoard enter: actualPosition.
	^ actualPosition
]

{ #category : #accessing }
Spaceship >> position [
	^ actualPosition .
]

{ #category : #action }
Spaceship >> sumOfThrows: collectionOfDice [

	| sumOfThrows |
	sumOfThrows := 0.
	collectionOfDice do: [ :die | sumOfThrows := sumOfThrows + die throw ].
	^ sumOfThrows
]
