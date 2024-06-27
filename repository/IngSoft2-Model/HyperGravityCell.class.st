Class {
	#name : #HyperGravityCell,
	#superclass : #Cell,
	#instVars : [
		'value'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperGravityCell class >> withValueToMove: aValue inPosition: aPosition [

	^ self new
		  initializeWithValueToMove: aValue
		  inPosition: aPosition
]

{ #category : #action }
HyperGravityCell >> enterOn: aGame [

	^ aGame throwDiceForHyperGravityCellWithValue:value onPosition: cellPosition .
]

{ #category : #initialization }
HyperGravityCell >> initializeWithValueToMove: aValue inPosition: aPosition [

	value := aValue.
	cellPosition := aPosition
]
