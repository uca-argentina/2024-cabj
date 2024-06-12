Class {
	#name : #MoonWalkCell,
	#superclass : #RegularCell,
	#instVars : [
		'value',
		'spaceships',
		'turnManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
MoonWalkCell class >> withValueToMove: aValue inPosition: aPosition andSpaceships: aCollectionOfSpaceships managedBy: aTurnManager [

	^ self new
		  initializeWithValueToMove: aValue
		  inPosition: aPosition
		  andSpaceships: aCollectionOfSpaceships
		  managedBy: aTurnManager
]

{ #category : #action }
MoonWalkCell >> enter [

	| aSpaceship |
	aSpaceship := turnManager spaceshipPlaying.
	spaceships move: value negated except: aSpaceship.
	^ cellPosition
]

{ #category : #initialization }
MoonWalkCell >> initializeWithValueToMove: aValue inPosition: aPosition andSpaceships: aCollectionOfSpaceships managedBy: aTurnManager [

	spaceships := aCollectionOfSpaceships.
	value := aValue.
	cellPosition := aPosition.
	turnManager := aTurnManager
]
