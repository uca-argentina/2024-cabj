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

{ #category : #action }
Wormhole >> enter [
	^cellPosition .
]

{ #category : #action }
Wormhole >> exit: aValue [
	^true .
]

{ #category : #initialization }
Wormhole >> initializeIn: aPosition [
	cellPosition:= aPosition .
]
