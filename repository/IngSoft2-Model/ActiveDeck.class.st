Class {
	#name : #ActiveDeck,
	#superclass : #Object,
	#instVars : [
		'cards',
		'lastCardPlayed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ActiveDeck class >> startGame [

	^ self new initializeStartGame
]

{ #category : #convenience }
ActiveDeck >> activate: aCard [

	aCard class superclass = PermanentCard ifTrue: [ cards add: aCard ].
	lastCardPlayed := aCard class
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

	cards := OrderedCollection new
]

{ #category : #accessing }
ActiveDeck >> lastCardPlayed [

	^ lastCardPlayed
]

{ #category : #removing }
ActiveDeck >> removeACard: cardToCancel [

	| anIndex indexToRemove |
	indexToRemove := 0.
	anIndex := 1.
	cards do: [ :card |
		(card isExactlyTheSameCard: cardToCancel) ifTrue: [
			indexToRemove := anIndex ].
		anIndex := anIndex + 1 ].
	(cards at: indexToRemove) deactivate.
	cards removeAt: indexToRemove
]
