Class {
	#name : #Ship,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Ship >> itsPosition [
	^ 0.
]

{ #category : #accessing }
Ship >> move [
	self shouldBeImplemented.
]
