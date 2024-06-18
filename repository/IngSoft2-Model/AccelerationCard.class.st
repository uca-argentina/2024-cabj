Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AccelerationCard class >> redo: null [

	^ self new
]

{ #category : #comparing }
AccelerationCard >> = aCard [

	^ self class == aCard class
]

{ #category : #effect }
AccelerationCard >> applyEffectOn: throwResult for: spaceshipId [

	^ throwResult + 1
]

{ #category : #comparing }
AccelerationCard >> compare: aCard [

	^ self = aCard
]

{ #category : #action }
AccelerationCard >> deactivate [

	^ true
]

{ #category : #effect }
AccelerationCard >> withEffectOn: aGame [

	game := aGame
]

{ #category : #effect }
AccelerationCard >> withRedoEffectOn: aGame forSpaceship: anId orCardToCancel: cardToCancel [

	game := aGame.
	aGame activeDeck activate: self
]
