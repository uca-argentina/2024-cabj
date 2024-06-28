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

{ #category : #action }
Cell >> applyEffectTo: aSpaceship on:aGame [


]

{ #category : #initialization }
Cell >> initializePosition: aPosition [

	cellPosition := aPosition
]
