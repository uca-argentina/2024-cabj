Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'cardToCancel'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CancellationCard class >> cancel: aCard [

	^ self new initializeCancel: aCard
]

{ #category : #'instance creation' }
CancellationCard class >> redo: aCard [

	^ self new initializeCancel: aCard
]

{ #category : #comparing }
CancellationCard >> = aCard [

	^ self class == aCard class
]

{ #category : #accessing }
CancellationCard >> activateEffectOn: aGame forSpaceship: anId [

	aGame activeDeck removeACard: cardToCancel
]

{ #category : #initialization }
CancellationCard >> initializeCancel: aCard [

	cardToCancel := aCard
]

{ #category : #accessing }
CancellationCard >> withRedoEffectOn: aGame forSpaceship: anId orCardToCancel: aCardToCancel [

	aGame activeDeck removeACard: aCardToCancel
]
