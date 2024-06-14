Class {
	#name : #BlackHoleCell,
	#superclass : #Object,
	#instVars : [
		'cellPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
BlackHoleCell class >> position: aPosition [
	aPosition <1 ifTrue: [ Error signal: 'A cell must have position greater than zero' ]. 
	^(self new) initializePosition: aPosition.
]

{ #category : #action }
BlackHoleCell >> enter [

	^ cellPosition - 4
]

{ #category : #action }
BlackHoleCell >> exit: aValue [

	^ true
]

{ #category : #initialization }
BlackHoleCell >> initializePosition: aPosition [

	cellPosition := aPosition
]
