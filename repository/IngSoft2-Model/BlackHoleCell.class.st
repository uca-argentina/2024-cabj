Class {
	#name : #BlackHoleCell,
	#superclass : #RegularCell,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BlackHoleCell >> enter [

	^ cellPosition - 4
]
