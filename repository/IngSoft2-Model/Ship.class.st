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
	Position:=1.
]
