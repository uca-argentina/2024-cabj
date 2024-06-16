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

{ #category : #'as yet unclassified' }
AccelerationCard >> withEffectOn: aGame [

	game := aGame
]
