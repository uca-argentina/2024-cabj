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

{ #category : #initialization }
Spaceship >> initializeLaunch [
	actualPosition:= 0.
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements on: aBoard [

	actualPosition:= aBoard enter: (actualPosition + aNumberOfMovements).
	^actualPosition 
]

{ #category : #accessing }
Spaceship >> position [
	^ actualPosition .
]
