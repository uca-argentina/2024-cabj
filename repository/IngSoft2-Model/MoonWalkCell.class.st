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

{ #category : #enter }
MoonWalkCell >> enterWithOtherSpaceship [
	^cellPosition-value.
]

{ #category : #enter }
MoonWalkCell >> enterWithSpaceship: aSpaceship [ 
	^cellPosition.
]

{ #category : #enter }
MoonWalkCell >> enterWithSpaceshipPlaying [
	^cellPosition
]

{ #category : #initialization }
MoonWalkCell >> initializeWithValueToMove: aValue onGame: aGame inPosition: aPosition [

	game := aGame.
	value := aValue.
	cellPosition := aPosition
]
