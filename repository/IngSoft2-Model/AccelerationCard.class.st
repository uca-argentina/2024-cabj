Class {
	#name : #AccelerationCard,
	#superclass : #Object,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
AccelerationCard >> = aCard [

	^ self class == aCard class
]

{ #category : #comparing }
AccelerationCard >> == aCard [

	^ self class == aCard class
]

{ #category : #'as yet unclassified' }
AccelerationCard >> applyEffectOn: throwResult for: spaceshipId [

	^ throwResult + 1
]

{ #category : #comparing }
AccelerationCard >> equals: aCard [

	^ self = aCard
]

{ #category : #'as yet unclassified' }
AccelerationCard >> withEffectOn: aGame [

	game := aGame
]
