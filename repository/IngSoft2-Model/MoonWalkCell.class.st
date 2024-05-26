Class {
	#name : #MoonWalkCell,
	#superclass : #RegularCell,
	#instVars : [
		'value',
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
MoonWalkCell class >> withValue: aValue inPosition: aPosition [
	^(self new) initializeWithValue: aValue inPosition: aPosition.
]

{ #category : #'as yet unclassified' }
MoonWalkCell >> enterWithOtherSpaceship [
	^3
]

{ #category : #initialization }
MoonWalkCell >> initializeWithValue: aValue inPosition: aPosition [
	value:=aValue.
	position:=aPosition .
]
