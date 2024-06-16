Class {
	#name : #OverloadCard,
	#superclass : #Object,
	#instVars : [
		'spaceshipId',
		'game'
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

{ #category : #accessing }
OverloadCard >> id [

	^ spaceshipId
]

{ #category : #initialization }
OverloadCard >> initializeReduceThorwOf: aSpaceshipId [

	spaceshipId := aSpaceshipId
]

{ #category : #'as yet unclassified' }
OverloadCard >> withEffectOn: aGame [

	game := aGame
]