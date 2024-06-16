Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'spaceshipId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
OverloadCard class >> reduceThrowOf: aSpaceshipId [

	^ self new initializeReduceThorwOf: aSpaceshipId
]

{ #category : #comparing }
OverloadCard >> = aCard [

	^ self class == aCard class
]

{ #category : #initialization }
OverloadCard >> initializeReduceThorwOf: aSpaceshipId [

	spaceshipId := aSpaceshipId
]
