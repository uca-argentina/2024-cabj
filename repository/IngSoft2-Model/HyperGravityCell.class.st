Class {
	#name : #HyperGravityCell,
	#superclass : #RegularCell,
	#instVars : [
		'value',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperGravityCell class >> withValueToMove: aValue inPosition: aPosition [ 
	^(self new ) initializeWithValueToMove: aValue inPosition: aPosition
]

{ #category : #'instance creation' }
HyperGravityCell >> enter [

	^ position
]

{ #category : #initialization }
HyperGravityCell >> initializeWithValueToMove: aValue inPosition: aPosition [
	value:=aValue.
	position:=aPosition 
]

{ #category : #'as yet unclassified' }
HyperGravityCell >> moveWithValue: aValueOfTheDie [
	value < aValueOfTheDie ifTrue: [ ^ (aValueOfTheDie +position) ].
	^ position
]
