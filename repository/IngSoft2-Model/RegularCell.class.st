Class {
	#name : #RegularCell,
	#superclass : #Object,
	#instVars : [
		'cellPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
RegularCell class >> position: aPosition [
	aPosition <1 ifTrue: [ Error signal: 'A cell must have position greater than zero' ]. 
	^(self new) initializePosition: aPosition.
]

{ #category : #'instance creation' }
RegularCell >> enter [

	^ cellPosition
]

{ #category : #running }
RegularCell >> exit: aValue [

	^ true
]

{ #category : #initialization }
RegularCell >> initializePosition: aPosition [

	cellPosition := aPosition
]
