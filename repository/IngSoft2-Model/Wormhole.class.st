Class {
	#name : #Wormhole,
	#superclass : #Object,
	#instVars : [
		'sideOne',
		'sideTwo'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Wormhole class >> withSides: first and: second [

	second <= first ifTrue: [
		Error signal: 'The ending must be greater than the beginning' ].
	^ self new initializeWithSides: first and: second.
]

{ #category : #initialization }
Wormhole >> initializeWithSides: first and: second [

	sideOne := RegularCell position: second.
	sideTwo := RegularCell position: first.
]
