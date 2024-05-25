Class {
	#name : #BlackHole,
	#superclass : #Object,
	#instVars : [
		'cellPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
BlackHole class >> position: aPosition [
	aPosition <1 ifTrue: [ Error signal: 'A cell must have position greater than zero' ]. 
	^(self new) initializePosition: aPosition.
]

{ #category : #'instance creation' }
BlackHole >> enter [
	^cellPosition - 4.
]

{ #category : #initialization }
BlackHole >> initializePosition: aPosition [ 
	cellPosition:= aPosition.
]
