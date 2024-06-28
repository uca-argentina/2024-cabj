Class {
	#name : #Wormhole,
	#superclass : #Object,
	#instVars : [
		'cellPosition',
		'positionToGoTo'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #evaluating }
Wormhole class >> in: aPosition to: anotherPosition [

	^ self new initializeIn: aPosition to: anotherPosition
]

{ #category : #action }
Wormhole >> applyEffectTo: aSpaceship on: aGame [

	aSpaceship move: positionToGoTo
]

{ #category : #accessing }
Wormhole >> cell [

	^ cellPosition
]

{ #category : #'set and get' }
Wormhole >> changeCellPositionTo: aCellPosition [

	cellPosition := aCellPosition
]

{ #category : #initialization }
Wormhole >> initializeIn: aPosition to: anotherPosition [

	cellPosition := aPosition.
	positionToGoTo := anotherPosition - cellPosition
]
