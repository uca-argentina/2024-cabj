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
MoonWalkCell class >> withValueToMove: aValue inPosition: aPosition [
	^(self new) initializeWithValueToMove: aValue inPosition: aPosition.
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
MoonWalkCell >> initializeWithValueToMove: aValue inPosition: aPosition [
	value:=aValue.
	position:=aPosition .
]
