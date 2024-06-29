Class {
	#name : #MoonWalkCell,
	#superclass : #Cell,
	#instVars : [
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MoonWalkCell class >> withValueToMove: aValue inPosition: aPosition [ 
	^ self new
		  initializeWithValueToMove: aValue
		  inPosition: aPosition
		  
]

{ #category : #action }
MoonWalkCell >> applyEffectTo: aSpaceship on:aGame [

	aGame
		moveAllTheSpaceshipsExcept: aSpaceship
		withValueToMove: value negated.
]

{ #category : #initialization }
MoonWalkCell >> initializeWithValueToMove: aValue inPosition: aPosition [

	value := aValue.
	cellPosition := aPosition
]
