Class {
	#name : #RedoCard,
	#superclass : #Card,
	#instVars : [
		'idOrCardToRedo'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
RedoCard class >> forCardWith: anIdOrCard [

	^ self new initializeForCardWith: anIdOrCard
]

{ #category : #comparing }
RedoCard >> = aCard [

	^ self class == aCard class
]

{ #category : #accessing }
RedoCard >> activateEffectOn: aGame forSpaceship: anId [

	| cardToRedo |
	cardToRedo := aGame lastCardPlayed toDoEffectFor: idOrCardToRedo.
	cardToRedo activateEffectOn: aGame forSpaceship: anId.
]

{ #category : #initialization }
RedoCard >> initializeForCardWith: anIdOrCard [

	idOrCardToRedo := anIdOrCard
]
