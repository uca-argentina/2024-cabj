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
	collectionOfCards do: [ :card |
		card = AccelerationCard new ifTrue: [ auxNumber := auxNumber + 1 ] ].
	collectionOfCards do: [ :card |
		card = OverloadCard new ifTrue: [
			card id = spaceshipId ifTrue: [ auxNumber := auxNumber - 2 ] ] ].
	^ auxNumber
]

{ #category : #initialization }
ActiveDeck >> initializeStartGame [

	collectionOfCards := OrderedCollection new.
]
