Class {
	#name : #RedoCard,
	#superclass : #InstantCard,
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

{ #category : #accessing }
RedoCard >> activateEffectOn: aGame forSpaceship: anId [

	| cardToActivate activeDeck |
	activeDeck := aGame activeDeck.
	cardToActivate := activeDeck lastCardPlayed redo: idForCard.
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
