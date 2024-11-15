Class {
	#name : #AllyCard,
	#superclass : #Card,
	#instVars : [
		'game',
		'spaceshipId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AllyCard >> activateEffectOn: aGame forSpaceship: anId [

	game := aGame.
	spaceshipId := anId.
	aGame activateCard: self.
	aGame ally: anId with: spaceshipAffected
]

{ #category : #'set and get' }
AllyCard >> ally [

	^ spaceshipAffected 
]

{ #category : #action }
AllyCard >> deactivate [

	game stopAlly: spaceshipId.
]

{ #category : #comparing }
AllyCard >> isExactlyTheSameCard: aCard [

	^ self class == aCard class and: spaceshipAffected = aCard ally
]
