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
SpaceshipCardHand class >> startGame [

	counterId := counterId + 1.
	^ self new initializeStartGameWithId: counterId
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
SpaceshipCardHand >> initializeStartGameWithId: counterId [
	
	id := counterId.
	collectionOfCards := OrderedCollection
		                     with: OverloadCard new
		                     with: AccelerationCard new
]
