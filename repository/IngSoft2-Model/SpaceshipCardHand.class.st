Class {
	#name : #SpaceshipCardHand,
	#superclass : #Object,
	#instVars : [
		'collectionOfCards',
		'aGameDeck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpaceshipCardHand class >> startGameWith: aGameDeck [

	^ self new initializeStartGameWith: aGameDeck
]

{ #category : #'instance creation' }
SpaceshipCardHand class >> startGameWithAllCards: aGameDeck [

	^ self new initializeStartGameAllCards: aGameDeck
]

{ #category : #accessing }
SpaceshipCardHand >> amount [

	^ collectionOfCards size
]

{ #category : #action }
SpaceshipCardHand >> gainACard [

	collectionOfCards add: ((aGameDeck createCollectionSize: 1) at: 1)
]

{ #category : #initialization }
SpaceshipCardHand >> initializeStartGameAllCards: gameDeck [

	aGameDeck := gameDeck.
	collectionOfCards := aGameDeck objectsToManage
]

{ #category : #initialization }
SpaceshipCardHand >> initializeStartGameWith: gameDeck [

	aGameDeck := gameDeck.
	collectionOfCards := gameDeck createCollectionSize: 2
]

{ #category : #action }
SpaceshipCardHand >> use: aCard [

	| cardToRemove |
	cardToRemove := collectionOfCards
		                detect: [ :card | card = aCard ]
		                ifNone: [ ^ false ].
	collectionOfCards remove: cardToRemove.
	^ true
]
