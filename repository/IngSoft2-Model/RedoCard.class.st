Class {
	#name : #RedoCard,
	#superclass : #Object,
	#instVars : [
		'idForCard',
		'cardToCancel'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RedoCard class >> forSpaceshipId: anId orCardToCancel: aCard [

	^ self new initializeForSpaceshipId: anId orCardToCancel: aCard
]

{ #category : #comparing }
RedoCard >> = aCard [

	^ self class == aCard class
]

{ #category : #accessing }
RedoCard >> activateEffectOn: aGame forSpaceship: anId [

	| cardToActivate |
	cardToActivate := aGame lastCardPlayed redo: idForCard.
	cardToActivate
		withRedoEffectOn: aGame
		forSpaceship: anId
		orCardToCancel: cardToCancel.
]

{ #category : #initialization }
RedoCard >> initializeForSpaceshipId: anId orCardToCancel: aCard [

	idForCard := anId.
	cardToCancel := aCard
]
