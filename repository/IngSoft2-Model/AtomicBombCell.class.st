Class {
	#name : #AtomicBombCell,
	#superclass : #Cell,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
AtomicBombCell >> enterOn: aGame [

	aGame resetSpaceshipsToCellOne.
	^ 1
]

{ #category : #action }
AtomicBombCell >> enterWithoutTurn: aSpaceship on:aGame [

	aGame resetSpaceshipsToCellOne.
	^ 1
]
