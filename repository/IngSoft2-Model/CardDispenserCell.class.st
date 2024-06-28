Class {
	#name : #CardDispenserCell,
	#superclass : #Cell,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #action }
CardDispenserCell >> applyEffectTo: aSpaceship on:aGame [

	(aGame cardHand: aSpaceship id) gainACard.
]
