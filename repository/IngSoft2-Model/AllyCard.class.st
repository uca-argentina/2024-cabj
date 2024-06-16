Class {
	#name : #AllyCard,
	#superclass : #Object,
	#instVars : [
		'allayId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AllyCard class >> shareFuelWith: aSpaceshipId [

	^ self new initializeShareFuelWith: aSpaceshipId
]

{ #category : #comparing }
AllyCard >> = aCard [

	^ self class == aCard class
]

{ #category : #initialization }
AllyCard >> initializeShareFuelWith: aSpaceshipId [

	allayId := aSpaceshipId
]
