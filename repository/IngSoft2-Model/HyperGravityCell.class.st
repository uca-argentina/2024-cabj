Class {
	#name : #HyperGravityCell,
	#superclass : #RegularCell,
	#instVars : [
		'value',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
HyperGravityCell class >> withValue: aValue inPosition: aPosition [ 
	^(self new ) initializeWithValue: aValue inPosition: aPosition
]

{ #category : #'instance creation' }
HyperGravityCell >> enter [

	^ cellPosition - 4
]

{ #category : #initialization }
HyperGravityCell >> initializeWithValue: aValue inPosition: aPosition [
	value:=aValue.
	position:=aPosition 
]

{ #category : #'as yet unclassified' }
HyperGravityCell >> moveWithValue: aValueOfTheDie [
	value < aValueOfTheDie ifTrue: [ ^ (aValueOfTheDie +position) ].
	^ position
]
