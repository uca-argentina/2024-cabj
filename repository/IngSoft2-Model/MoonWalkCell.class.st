Class {
	#name : #MoonWalkCell,
	#superclass : #Object,
	#instVars : [
		'value',
		'game',
		'cellPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MoonWalkCell class >> withValueToMove: aValue inPosition: aPosition on:aGame [

	^ self new
		  initializeWithValueToMove: aValue
		  inPosition: aPosition
		  on:aGame
]

{ #category : #action }
MoonWalkCell >> enter [

	game moveAllTheSpaceshipsThatAreNotPlayingWith: value negated.
	
	^ cellPosition
]

{ #category : #action }
MoonWalkCell >> exit: aValue [

	^ true
]

{ #category : #initialization }
MoonWalkCell >> initializeWithValueToMove: aValue inPosition: aPosition on: aGame [


	value := aValue.
	cellPosition := aPosition.
	game:=aGame.
]
