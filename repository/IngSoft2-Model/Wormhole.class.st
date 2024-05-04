Class {
	#name : #Wormhole,
	#superclass : #Object,
	#instVars : [
		'beginning',
		'end'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Wormhole class >> beginning: aBeginning end: anEnd [
	aBeginning <= 0 ifTrue: [ Error signal: 'The beginnig must be greater than zero' ] .
	aBeginning >= anEnd ifTrue: [ Error signal: 'The end must be greater than the beginning' ] .
	^ (self new) initializeBeginnig: aBeginning end: anEnd.
]

{ #category : #'as yet unclassified' }
Wormhole >> enterBeginning [
	^end .
]

{ #category : #'as yet unclassified' }
Wormhole >> enterEnd [
	^beginning .
]

{ #category : #initialization }
Wormhole >> initializeBeginnig: aBeginning end: anEnd [ 
	
	beginning := aBeginning .
	end := anEnd.
]
