Class {
	#name : #PermanentCard,
	#superclass : #Object,
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

{ #category : #action }
PermanentCard >> deactivate [

	^ true
]

{ #category : #effect }
PermanentCard >> withEffectOn: aGame [


]

{ #category : #accessing }
PermanentCard >> withRedoEffectOn: aGame forSpaceship: anId orCardToCancel: cardToCancel [

	aGame activeDeck activate: self
]
