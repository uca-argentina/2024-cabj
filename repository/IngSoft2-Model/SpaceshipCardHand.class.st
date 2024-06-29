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
SpaceshipCardHand class >> startGame [

	^ self new initializeStartGame
]

{ #category : #'instance creation' }
SpaceshipCardHand class >> startGameWithAllCards [

	^ self new initializeStartGameAllCards
]

{ #category : #accessing }
SpaceshipCardHand >> amount [

	^ collectionOfCards size
]

{ #category : #action }
SpaceshipCardHand >> gainACard [

	collectionOfCards add: aGameDeck pickACard
]

{ #category : #initialization }
SpaceshipCardHand >> initializeStartGame [

	aGameDeck := GameDeck startGame.
	collectionOfCards := OrderedCollection
		                     with: aGameDeck pickACard
		                     with: aGameDeck pickACard
]

{ #category : #initialization }
SpaceshipCardHand >> initializeStartGameAllCards [

	aGameDeck := GameDeck startGame.
	collectionOfCards := aGameDeck availableCards
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
