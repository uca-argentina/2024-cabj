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

	| aCard |
	aCard := collectionOfCards detect: [ :card | card equals: cardToCancel ].
	collectionOfCards remove: aCard
]
