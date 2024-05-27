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
MoonWalkCell class >> newOn: aGame withValueToMove: aValue inPosition: aPosition [

	^ self new
		  initializeNewOn: aGame
		  withValueToMove: aValue
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
MoonWalkCell >> initializeNewOn: aGame withValueToMove: aValue inPosition: aPosition [

	game := aGame.
	value := aValue.
	cellPosition := aPosition
]
