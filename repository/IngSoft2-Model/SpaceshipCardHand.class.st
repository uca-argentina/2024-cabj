Class {
	#name : #SpaceshipCardHand,
	#superclass : #Object,
	#instVars : [
		'collectionOfCards',
		'id'
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
SpaceshipCardHand class >> startGameWith: aCard and: anotherCard [

	counterId := counterId + 1.
	^ self new
		  initializeStartGameWithId: counterId
		  with: aCard
		  and: anotherCard
]

{ #category : #'instance creation' }
SpaceshipCardHand class >> startGameWithAllCards: aGameDeck [

	counterId := counterId + 1.
	^ self new initializeStartGameWithId: counterId with: aGameDeck
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

{ #category : #accessing }
SpaceshipCardHand >> id [

	^ id
]

{ #category : #initialization }
SpaceshipCardHand >> initializeStartGameWithId: counterId with: aGameDeck [

	id := counterId.
	collectionOfCards := aGameDeck availableCards
]

{ #category : #initialization }
SpaceshipCardHand >> initializeStartGameWithId: counterId with: aCard and: anotherCard [

	id := counterId.
	collectionOfCards := OrderedCollection with: aCard with: anotherCard
]
