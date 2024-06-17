Class {
	#name : #GameOver,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
GameOver >> nextTurn [

	Error signal: 'The Game is Over'
]
