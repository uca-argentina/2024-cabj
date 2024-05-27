Class {
	#name : #BlackHoleCell,
	#superclass : #RegularCell,
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BlackHoleCell >> enter [

	^ cellPosition - 4
]
