Class {
	#name : #PermanentCard,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PermanentCard class >> redo: null [

	^ self new
]

{ #category : #comparing }
PermanentCard >> = aCard [

	^ self class == aCard class
]

{ #category : #effect }
PermanentCard >> applyEffectOn: throwResult for: spaceshipId [

	^ throwResult
]

{ #category : #comparing }
PermanentCard >> compare: aCard [

	^ self = aCard
]

{ #category : #action }
PermanentCard >> deactivate [

	^ true
]

{ #category : #effect }
PermanentCard >> withEffectOn: aGame [

	game := aGame
]

{ #category : #accessing }
PermanentCard >> withRedoEffectOn: aGame forSpaceship: anId orCardToCancel: cardToCancel [

	game := aGame.
	aGame activeDeck activate: self
]
