Class {
	#name : #SpaceshipCardHand,
	#superclass : #Object,
	#instVars : [
		'collectionOfCards',
		'id',
		'aGameDeck'
	],
	#classInstVars : [
		'counterId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
SpaceshipCardHand class >> initialize [

	counterId := 0
]

{ #category : #'instance creation' }
SpaceshipCardHand class >> startGame [

	counterId := counterId + 1.
	^ self new initializeStartGameWithId: counterId
]

{ #category : #'instance creation' }
SpaceshipCardHand class >> startGameWithAllCards [

	counterId := counterId + 1.
	^ self new initializeStartGameAllCardsWithId: counterId
]

{ #category : #action }
SpaceshipCardHand >> activateCard: aCard [

	| cardToRemove |
	cardToRemove := collectionOfCards
		                detect: [ :card | card = aCard ]
		                ifNone: [ ^ false ].
	collectionOfCards remove: cardToRemove.
	^ true
]

{ #category : #accessing }
SpaceshipCardHand >> amount [

	^ collectionOfCards size
]

{ #category : #'as yet unclassified' }
SpaceshipCardHand >> gainACard [

	collectionOfCards add: aGameDeck pickACard
]

{ #category : #accessing }
SpaceshipCardHand >> id [

	^ id
]

{ #category : #initialization }
SpaceshipCardHand >> initializeStartGameAllCardsWithId: counterId [

	id := counterId.
	aGameDeck := GameDeck startGame.
	collectionOfCards := aGameDeck availableCards
]

{ #category : #initialization }
SpaceshipCardHand >> initializeStartGameWithId: counterId [

	id := counterId.
	aGameDeck := GameDeck startGame.
	collectionOfCards := OrderedCollection
		                     with: aGameDeck pickACard
		                     with: aGameDeck pickACard
]
