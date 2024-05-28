Class {
	#name : #BlackHoleCell,
	#superclass : #RegularCell,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #action }
BlackHoleCell >> enter [

	^ cellPosition - 4
]
