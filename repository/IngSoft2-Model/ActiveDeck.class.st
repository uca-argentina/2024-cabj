Class {
	#name : #ActiveDeck,
	#superclass : #Object,
	#instVars : [
		'collectionOfCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ActiveDeck class >> startGame [

	^ self new initializeStartGame
]

{ #category : #convenience }
ActiveDeck >> activate: aCard [

	collectionOfCards add: aCard
]

{ #category : #accessing }
ActiveDeck >> activeCards [

	^ collectionOfCards size
]

{ #category : #action }
ActiveDeck >> applyEffectOn: throwResult withCurrentSpaceship: spaceshipId [

	| auxNumber |
	auxNumber := throwResult.
	collectionOfCards isEmpty ifTrue: [ ^ throwResult ].
	collectionOfCards do: [ :card |
		auxNumber := card applyEffectOn: auxNumber for: spaceshipId ].
	^ auxNumber
]

{ #category : #initialization }
ActiveDeck >> initializeStartGame [

	collectionOfCards := OrderedCollection new.
]

{ #category : #removing }
ActiveDeck >> remove: cardToCancel [

	| anIndex indexToRemove |
	anIndex := 1.
	collectionOfCards do: [ :card |
		(card compare: cardToCancel) ifTrue: [
			indexToRemove := anIndex ].
		anIndex := anIndex + 1 ].
	(collectionOfCards at: indexToRemove) deactivate.
	collectionOfCards removeAt: indexToRemove
]
