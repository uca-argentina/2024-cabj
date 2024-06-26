Class {
	#name : #BlackHoleCell,
	#superclass : #Cell,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
BlackHoleCell >> enterOn:aGame [

	^ cellPosition - 4
]

{ #category : #action }
BlackHoleCell >> enterWithoutTurn: aSpaceship [

	^ cellPosition - 4
]
