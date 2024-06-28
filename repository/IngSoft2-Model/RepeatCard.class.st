Class {
	#name : #RepeatCard,
	#superclass : #Object,
	#instVars : [
		'spaceshipId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RepeatCard class >> redo: aSpaceshipId [

	^ self new initializeRepeatEffectFor: aSpaceshipId
]

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

	| spaceshipToApplyEffect cellToEnter cellOfSpaceship |
	aGame activeDeck instantCardPlayed: self.
	spaceshipToApplyEffect := aGame spaceships detectSpaceshipWithId: spaceshipId.

	cellToEnter := aGame lastCellEffect copy.

	cellOfSpaceship := cellToEnter applyEffectTo:
		                   spaceshipToApplyEffect on: aGame.

	aGame checkAndHandleFuelDepletion: spaceshipToApplyEffect
]

{ #category : #initialization }
RepeatCard >> initializeRepeatEffectFor: anId [

	spaceshipId := anId
]

{ #category : #accessing }
RepeatCard >> withRedoEffectOn: aGame forSpaceship: anId orCardToCancel: aCardToCancel [

	| spaceshipToApplyEffect cellPosition cellToEnter cellOfSpaceship |
	aGame activeDeck instantCardPlayed: self.
	spaceshipToApplyEffect := aGame spaceships detectSpaceshipWithId: spaceshipId.
	cellPosition := spaceshipToApplyEffect objectPosition cell.

	cellToEnter := aGame lastCellEffect copy.

	cellOfSpaceship := cellToEnter applyEffectTo:
		                   spaceshipToApplyEffect on:aGame.

	aGame checkAndHandleFuelDepletion: spaceshipToApplyEffect
]
