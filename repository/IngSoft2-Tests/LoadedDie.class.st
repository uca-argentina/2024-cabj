Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
LoadedDie class >> of: anAmountOfFaces [
	anAmountOfFaces <3 ifTrue: [ Error signal: 'A die less than three faces doesnt exist' ].
	^ (self new) initializeOf: anAmountOfFaces .
]

{ #category : #initialization }
LoadedDie >> initializeOf: anAmountOfFaces [ 
	faces:= anAmountOfFaces 
]

{ #category : #'as yet unclassified' }
LoadedDie >> throw [
	^faces .
]
