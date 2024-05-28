Class {
	#name : #MoonWalkCell,
	#superclass : #RegularCell,
	#instVars : [
		'value',
		'spaceships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MoonWalkCell class >> withValueToMove: aValue spaceships: collectionOfSpaceships inPosition: aPosition [

	^ self new
		  initializeWithValueToMove: aValue
		  spaceships: collectionOfSpaceships
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
MoonWalkCell >> initializeWithValueToMove: aValue spaceships: collectionOfSpaceships inPosition: aPosition [

	spaceships := collectionOfSpaceships.
	value := aValue.
	cellPosition := aPosition
]
