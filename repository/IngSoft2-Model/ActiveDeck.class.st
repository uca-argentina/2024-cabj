Class {
	#name : #ActiveDeck,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ActiveDeck class >> startGame [

	^ self new initializeStartGame
]

{ #category : #convenience }
ActiveDeck >> activate: aCard [

	cards add: aCard
]

{ #category : #accessing }
ActiveDeck >> activeCards [

	^ cards size
]

{ #category : #action }
ActiveDeck >> applyEffectOn: throwResult withCurrentSpaceship: spaceshipId [

	| auxNumber |
	auxNumber := throwResult.
	cards isEmpty ifTrue: [ ^ throwResult ].
	cards do: [ :card |
		auxNumber := card applyEffectOn: auxNumber for: spaceshipId ].
	^ auxNumber
]

{ #category : #initialization }
ActiveDeck >> initializeStartGame [

	cards := OrderedCollection new.
]

{ #category : #removing }
ActiveDeck >> remove: cardToCancel [

	| anIndex indexToRemove |
	anIndex := 1.
	cards do: [ :card |
		(card compare: cardToCancel) ifTrue: [
			indexToRemove := anIndex ].
		anIndex := anIndex + 1 ].
	(cards at: indexToRemove) deactivate.
	cards removeAt: indexToRemove
]
