Class {
	#name : #Box,
	#superclass : #Object,
	#instVars : [
		'boxPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Box class >> position: aPosition [
	aPosition <1 ifTrue: [ Error signal: 'A box must have position greater than zero' ]. 
	^(self new) initializePosition: aPosition.
]

{ #category : #'instance creation' }
Box >> enter [
	^boxPosition .
]

{ #category : #initialization }
Box >> initializePosition: aPosition [ 
	boxPosition:= aPosition.
]
