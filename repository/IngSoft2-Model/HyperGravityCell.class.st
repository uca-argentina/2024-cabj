Class {
	#name : #HyperGravityCell,
	#superclass : #RegularCell,
	#instVars : [
		'value',
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperGravityCell class >> newOn: aGame withValueToMove: aValue inPosition: aPosition [

	^ self new
		  initializeNewOn: aGame
		  withValueToMove: aValue
		  inPosition: aPosition
]

{ #category : #'instance creation' }
HyperGravityCell >> enter [

	^ cellPosition
]

{ #category : #running }
HyperGravityCell >> exit: aValue [

	aValue < value ifTrue: [ ^ false ].
	^ true
]

{ #category : #initialization }
HyperGravityCell >> initializeNewOn: aGame withValueToMove: aValue inPosition: aPosition [

	game := aGame.
	value := aValue.
	cellPosition := aPosition
]
