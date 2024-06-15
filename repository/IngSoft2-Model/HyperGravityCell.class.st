Class {
	#name : #HyperGravityCell,
	#superclass : #Object,
	#instVars : [
		'value',
		'cellPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperGravityCell class >> withValueToMove: aValue inPosition: aPosition [

	^ self new
		  initializeWithValueToMove: aValue
		  inPosition: aPosition
]

{ #category : #action }
HyperGravityCell >> enter [

	^ cellPosition
]

{ #category : #action }
HyperGravityCell >> exit: aValue [

	aValue < value ifTrue: [ ^ false ].
	^ true
]

{ #category : #initialization }
HyperGravityCell >> initializeWithValueToMove: aValue inPosition: aPosition [

	value := aValue.
	cellPosition := aPosition
]
