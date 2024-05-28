Class {
	#name : #HyperGravityCell,
	#superclass : #RegularCell,
	#instVars : [
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperGravityCell class >> withValueToMove: aValue inPosition: aPosition [

	^ self new
		  initializeWithValueToMove: aValue
		  inPosition: aPosition
]

{ #category : #'instance creation' }
HyperGravityCell >> enter [

	^ cellPosition
]

{ #category : #running }
HyperGravityCell >> exit: aValue [

	aValue < value ifTrue: [ ^ false ].
	^ true
]

{ #category : #initialization }
HyperGravityCell >> initializeWithValueToMove: aValue inPosition: aPosition [

	value := aValue.
	cellPosition := aPosition
]
