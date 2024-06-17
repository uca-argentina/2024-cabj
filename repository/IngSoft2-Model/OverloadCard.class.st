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

{ #category : #effect }
OverloadCard >> applyEffectOn: throwResult for: aSpaceshipId [

	spaceshipId = aSpaceshipId ifTrue: [ ^ throwResult - 2 ].
	^ throwResult
]

{ #category : #comparing }
OverloadCard >> compare: aCard [

	^ spaceshipId = aCard id and: self = aCard
]

{ #category : #private }
OverloadCard >> deactivate [

	^ true
]

{ #category : #accessing }
OverloadCard >> id [

	^ spaceshipId
]

{ #category : #initialization }
OverloadCard >> initializeReduceThorwOf: aSpaceshipId [

	spaceshipId := aSpaceshipId
]

{ #category : #effect }
OverloadCard >> withEffectOn: aGame [

	game := aGame
]
