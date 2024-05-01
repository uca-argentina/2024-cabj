Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'amountOfBoxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> of: anAmountOfBoxes [
	anAmountOfBoxes < 2 ifTrue: [ Error signal: 'A Board must have more than one box.' ]. 
	^ (self new) initializeOf: anAmountOfBoxes 
]

{ #category : #'as yet unclassified' }
Board >> finishLine [
	^amountOfBoxes .
]

{ #category : #initialization }
Board >> initializeOf: anAmountOfBoxes [ 
	amountOfBoxes:= anAmountOfBoxes.
]
