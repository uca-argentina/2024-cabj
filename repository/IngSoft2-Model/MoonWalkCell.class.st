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
MoonWalkCell class >> withValueToMove: aValue inPosition: aPosition andSpaceships: aCollectionOfSpaceships [

	^ self new
		  initializeWithValueToMove: aValue
		  inPosition: aPosition
		  andSpaceships: aCollectionOfSpaceships
]

{ #category : #'instance creation' }
MoonWalkCell >> enter [

	| aSpaceship |
	aSpaceship := thisContext sender receiver.
	spaceships moveBackwards: value except: aSpaceship.
	^ cellPosition
]

{ #category : #initialization }
MoonWalkCell >> initializeWithValueToMove: aValue inPosition: aPosition andSpaceships: aCollectionOfSpaceships [

	spaceships := aCollectionOfSpaceships.
	value := aValue.
	cellPosition := aPosition
]
