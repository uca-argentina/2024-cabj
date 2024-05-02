Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LoadedDie class >> of: anAmountOfFaces [
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
