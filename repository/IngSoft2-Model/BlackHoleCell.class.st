Class {
	#name : #BlackHoleCell,
	#superclass : #RegularCell,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
BlackHoleCell >> enter [

	^ cellPosition - 4
]
