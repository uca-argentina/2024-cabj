Class {
	#name : #MoonWalkCell,
	#superclass : #RegularCell,
	#instVars : [
		'value',
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MoonWalkCell class >> withValueToMove: aValue onGame: aGame inPosition: aPosition [

	^ self new
		  initializeWithValueToMove: aValue
		  onGame: aGame
		  inPosition: aPosition
]

{ #category : #initialization }
MoonWalkCell >> initializeWithValueToMove: aValue onGame: aGame inPosition: aPosition [ 

	game := aGame.
	value := aValue.
	cellPosition := aPosition
]
