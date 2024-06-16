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

{ #category : #initialization }
ActiveDeck >> initializeStartGame [

	collectionOfCards := OrderedCollection new.
]
