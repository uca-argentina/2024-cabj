Class {
	#name : #CancellationCard,
	#superclass : #Object,
	#instVars : [
		'cardToCancel',
		'spaceshipAffected',
		'activeDeck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CancellationCard class >> cancel: aCard [

	^ self new initializeCancel: aCard
]

{ #category : #comparing }
CancellationCard >> = aCard [

	^ self class == aCard class
]

{ #category : #accessing }
CancellationCard >> activateEffectOn: anActiveDeck [

	anActiveDeck remove: cardToCancel
]

{ #category : #initialization }
CancellationCard >> initializeCancel: aCard [

	cardToCancel := aCard
]
