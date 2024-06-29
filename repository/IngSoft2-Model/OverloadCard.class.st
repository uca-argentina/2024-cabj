Class {
	#name : #OverloadCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #effect }
OverloadCard >> applyEffectOn: throwResult for: aSpaceshipId [

	spaceshipAffected = aSpaceshipId ifTrue: [ ^ throwResult - 2 ].
	^ throwResult
]

{ #category : #accessing }
OverloadCard >> id [

	^ spaceshipAffected 
]

{ #category : #comparing }
OverloadCard >> isExactlyTheSameCard: aCard [

	^ spaceshipAffected = aCard id and: self = aCard
]
