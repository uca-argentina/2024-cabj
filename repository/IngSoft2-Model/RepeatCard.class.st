Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'spaceshipId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RepeatCard class >> repeatEffectFor: anId [

	^ self new initializeRepeatEffectFor: anId
]

{ #category : #comparing }
RepeatCard >> = aCard [

	^ self class == aCard class
]

{ #category : #accessing }
RepeatCard >> activateEffectOn: aGame forSpaceship: anId [

	| spaceshipToApplyEffect cellPosition cellToEnter cellOfSpaceship |
	spaceshipToApplyEffect := aGame spaceships detect: [ :spaceship |
		                          spaceship id = spaceshipId ].
	cellPosition := spaceshipToApplyEffect objectPosition cell.

	cellToEnter := aGame lastCellEffect copy changeCellPositionTo:
		               cellPosition.

	cellOfSpaceship := cellToEnter enterWithoutTurn:
		                   spaceshipToApplyEffect.

	spaceshipToApplyEffect move: cellOfSpaceship - cellPosition.

	aGame checkAndHandleFuelDepletion: spaceshipToApplyEffect
]

{ #category : #initialization }
RepeatCard >> initializeRepeatEffectFor: anId [

	spaceshipId := anId
]
