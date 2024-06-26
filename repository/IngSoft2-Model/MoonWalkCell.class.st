Class {
	#name : #MoonWalkCell,
	#superclass : #Cell,
	#instVars : [
		'value',
		'game'
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
MoonWalkCell >> enterOn: aGame [

	aGame
		moveAllTheSpaceshipsExcept: aGame currentSpaceship
		withValueToMove: value negated.

	^ cellPosition
]

{ #category : #action }
MoonWalkCell >> enterWithoutTurn: aSpaceship on:aGame [

	aGame
		moveAllTheSpaceshipsExcept: aSpaceship
		withValueToMove: value negated.

	^ cellPosition
]

{ #category : #initialization }
MoonWalkCell >> initializeWithValueToMove: aValue inPosition: aPosition [

	value := aValue.
	cellPosition := aPosition
]
