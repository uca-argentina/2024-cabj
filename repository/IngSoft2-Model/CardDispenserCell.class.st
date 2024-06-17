Class {
	#name : #CardDispenserCell,
	#superclass : #Object,
	#instVars : [
		'cellPosition',
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
CardDispenserCell class >> withPostion: aPosition onTheGame: aGame [

	aPosition < 1 ifTrue: [
		Error signal: 'A cell must have position greater than zero' ].

	^ self new initializeWithPostion: aPosition onTheGame: aGame
]

{ #category : #action }
CardDispenserCell >> enter [

	game currentSpaceshipCardHand gainACard.
	^ cellPosition
]

{ #category : #initialization }
CardDispenserCell >> exit: aValue [

	^ true
]

{ #category : #initialization }
CardDispenserCell >> initializeWithPostion: aPosition onTheGame: aGame [

	cellPosition := aPosition.
	game := aGame
]
