Class {
	#name : #GameDeck,
	#superclass : #Object,
	#instVars : [
		'availableCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
GameDeck class >> startGame [

	^ self new initializeStartGame
]

{ #category : #initialization }
GameDeck >> initializeStartGame [

	availableCards := OrderedCollection
		                  with: AllyCard new
		                  with: OverloadCard new
		                  with: AccelerationCard new
]

{ #category : #'as yet unclassified' }
GameDeck >> pickACard [

	^ availableCards at: 3 atRandom
]

{ #category : #accessing }
GameDeck >> size [

	^ availableCards size
]
