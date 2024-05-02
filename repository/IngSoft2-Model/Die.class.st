Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> of: anAmountFaces [ 
	^ (self new) initializeOf: anAmountFaces .
]

{ #category : #initialization }
Die >> initializeOf: anAmountOfFaces [
	faces:= anAmountOfFaces .
]

{ #category : #'as yet unclassified' }
Die >> throw [
	^faces.
]

{ #category : #'as yet unclassified' }
Die >> thrown [
	self shouldBeImplemented.
]
