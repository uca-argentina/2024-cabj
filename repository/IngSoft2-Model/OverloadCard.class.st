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

{ #category : #'as yet unclassified' }
OverloadCard >> applyEffectOn: throwResult for: aSpaceshipId [

	spaceshipId = aSpaceshipId ifTrue: [ ^ throwResult - 2 ].
	^ throwResult
]

{ #category : #comparing }
OverloadCard >> equals: aCard [

	^ self = aCard and: spaceshipId = aCard id
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
