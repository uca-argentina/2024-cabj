Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'spaceshipAffected'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RepeatCard class >> toDoEffectFor: aSpaceshipId [

	^ self new initializeToDoEffectFor: aSpaceshipId
]

{ #category : #comparing }
RepeatCard >> = aCard [

	^ self class == aCard class
]

{ #category : #accessing }
RepeatCard >> activateEffectOn: aGame forSpaceship: anId [

	| spaceshipToApplyEffect cellToEnter cellOfSpaceship |
	aGame activateCard: self.
	spaceshipToApplyEffect := aGame spaceships detectSpaceshipWithId: spaceshipAffected.

	cellToEnter := aGame lastCellEffect.

	cellOfSpaceship := cellToEnter applyEffectTo:
		                   spaceshipToApplyEffect on: aGame.
]

{ #category : #initialization }
RepeatCard >> initializeToDoEffectFor: aSpaceshipId [

	spaceshipAffected := aSpaceshipId
]
