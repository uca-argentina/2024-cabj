Class {
	#name : #MoonWalkCell,
	#superclass : #RegularCell,
	#instVars : [
		'value',
		'spaceships',
		'turnManager',
		'game'
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

{ #category : #initialization }
MoonWalkCell >> initializeWithValueToMove: aValue inPosition: aPosition on: aGame [


	value := aValue.
	cellPosition := aPosition.
	game:=aGame.
]
