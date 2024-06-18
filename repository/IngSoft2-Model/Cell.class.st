Class {
	#name : #Cell,
	#superclass : #Object,
	#instVars : [
		'cellPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Cell class >> position: aPosition [
	aPosition <1 ifTrue: [ Error signal: 'A cell must have position greater than zero' ]. 
	^(self new) initializePosition: aPosition.
]

{ #category : #'set and get' }
Cell >> changeCellPositionTo: aCellPosition [

	cellPosition := aCellPosition
]

{ #category : #action }
Cell >> enter [

	^ cellPosition
]

{ #category : #action }
Cell >> enterWithoutTurn: aSpaceship [

	^ cellPosition
]

{ #category : #action }
Cell >> exit: aValue [

	^ true
]

{ #category : #initialization }
Cell >> initializePosition: aPosition [

	cellPosition := aPosition
]
