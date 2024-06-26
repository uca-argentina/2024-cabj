Class {
	#name : #CardDispenserCell,
	#superclass : #Cell,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #action }
CardDispenserCell >> enterOn: aGame [

	| currentSpaceship |
	currentSpaceship := aGame currentSpaceship id.
	(aGame cardHand: currentSpaceship) gainACard.
	^ cellPosition
]

{ #category : #action }
CardDispenserCell >> enterWithoutTurn: aSpaceship on:aGame [

	(aGame cardHand: aSpaceship id) gainACard.
	^ cellPosition
]
