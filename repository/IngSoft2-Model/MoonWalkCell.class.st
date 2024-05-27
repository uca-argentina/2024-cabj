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
	^position-value.
]

{ #category : #'as yet unclassified' }
MoonWalkCell >> enterWithSpaceship: aSpaceship [ 
	^position.
]

{ #category : #'as yet unclassified' }
MoonWalkCell >> enterWithSpaceshipPlaying [
	^position
]

{ #category : #initialization }
MoonWalkCell >> initializeWithValue: aValue inPosition: aPosition [
	value:=aValue.
	position:=aPosition .
]
