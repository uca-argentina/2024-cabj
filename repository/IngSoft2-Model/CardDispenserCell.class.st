Class {
	#name : #CardDispenserCell,
	#superclass : #RegularCell,
	#instVars : [
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

	| currentSpaceship |
	currentSpaceship := game currentSpaceship id.
	(game cardHand: currentSpaceship) gainACard.
	^ cellPosition
]

{ #category : #action }
CardDispenserCell >> enterWithoutTurn: aSpaceship [

	(game cardHand: aSpaceship id) gainACard.
	^ cellPosition
]

{ #category : #initialization }
CardDispenserCell >> initializeWithPostion: aPosition onTheGame: aGame [

	cellPosition := aPosition.
	game := aGame
]
