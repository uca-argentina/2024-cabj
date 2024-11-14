Class {
	#name : #BlackHoleCell,
	#superclass : #Cell,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
BlackHoleCell >> applyEffectTo: aSpaceship on: aGame [

	| aNumberOfMovements |
	aNumberOfMovements := aGame checkMoveIsPossible: -4 for: aSpaceship.
	aSpaceship move: aNumberOfMovements.
	aSpaceship position adjustPositionWith: aGame finishLine.
	aGame checkAndHandleFuelDepletion: aSpaceship
]
