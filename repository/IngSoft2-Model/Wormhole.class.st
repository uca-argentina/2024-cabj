Class {
	#name : #Wormhole,
	#superclass : #Object,
	#instVars : [
		'cellPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #evaluating }
Wormhole class >> in: aPosition [
	^(self new) initializeIn: aPosition.
]

{ #category : #'set and get' }
Wormhole >> changeCellPositionTo: aCellPosition [

	cellPosition := aCellPosition
]

{ #category : #action }
Wormhole >> enterOn:aGame [

	^ cellPosition
]

{ #category : #action }
Wormhole >> enterWithoutTurn: aSpaceship [

	^ cellPosition
]

{ #category : #action }
Wormhole >> exit: aValue [

	^ true
]

{ #category : #initialization }
Wormhole >> initializeIn: aPosition [

	cellPosition := aPosition
]
