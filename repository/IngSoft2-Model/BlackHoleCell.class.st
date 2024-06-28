Class {
	#name : #BlackHoleCell,
	#superclass : #Cell,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
BlackHoleCell >> applyEffectTo: aSpaceship on: aGame [

	aSpaceship move: -4
]
