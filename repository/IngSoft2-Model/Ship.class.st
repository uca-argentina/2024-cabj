Class {
	#name : #Ship,
	#superclass : #Object,
	#classVars : [
		'Position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Ship class >> beginGame [
	^ (self new) initializeBeginGame.
]

{ #category : #testing }
Ship >> hasWon [
	^ Position=3.
]

{ #category : #initialization }
Ship >> initializeBeginGame [
	Position:= 0.
]

{ #category : #'as yet unclassified' }
Ship >> itsPosition [
	^ Position.
]

{ #category : #accessing }
Ship >> move [
	Position:= Position + 1.
]
