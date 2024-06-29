Class {
	#name : #PermanentCard,
	#superclass : #Object,
	#instVars : [
		'spaceshipAffected'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
PermanentCard class >> toDoEffectFor: aSpaceshipId [

	^ self new initializeToDoEffectFor: aSpaceshipId
]

{ #category : #comparing }
PermanentCard >> = aCard [

	^ self class == aCard class
]

{ #category : #effect }
PermanentCard >> activateEffectOn: aGame forSpaceship: anId [
	
	aGame activateCard: self

]

{ #category : #effect }
PermanentCard >> applyEffectOn: throwResult for: spaceshipId [

	^ throwResult
]

{ #category : #action }
PermanentCard >> deactivate [

	^ true
]

{ #category : #initialization }
PermanentCard >> initializeToDoEffectFor: aSpaceshipId [

	spaceshipAffected := aSpaceshipId
]
