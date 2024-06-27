Class {
	#name : #OverloadCard,
	#superclass : #PermanentCard,
	#instVars : [
		'spaceshipId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
OverloadCard class >> redo: aSpaceshipId [

	^ self new initializeReduceThorwOf: aSpaceshipId
]

{ #category : #'instance creation' }
OverloadCard class >> reduceThrowOf: aSpaceshipId [

	^ self new initializeReduceThorwOf: aSpaceshipId
]

{ #category : #effect }
OverloadCard >> applyEffectOn: throwResult for: aSpaceshipId [

	spaceshipId = aSpaceshipId ifTrue: [ ^ throwResult - 2 ].
	^ throwResult
]

{ #category : #accessing }
OverloadCard >> id [

	^ spaceshipId
]

{ #category : #initialization }
OverloadCard >> initializeReduceThorwOf: aSpaceshipId [

	spaceshipId := aSpaceshipId
]

{ #category : #comparing }
OverloadCard >> isExactlyTheSameCard: aCard [

	^ spaceshipId = aCard id and: self = aCard
]
