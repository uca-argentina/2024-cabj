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

{ #category : #effect }
AccelerationCard >> applyEffectOn: throwResult for: spaceshipId [

	^ throwResult + 1
]

{ #category : #comparing }
AccelerationCard >> compare: aCard [

	^ self = aCard
]

{ #category : #private }
AccelerationCard >> deactivate [

	^ true
]

{ #category : #effect }
AccelerationCard >> withEffectOn: aGame [

	game := aGame
]
