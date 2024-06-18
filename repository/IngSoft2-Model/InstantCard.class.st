Class {
	#name : #InstantCard,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #comparing }
InstantCard >> = aCard [

	^ self class == aCard class
]
