Class {
	#name : #AtomicBombCell,
	#superclass : #Object,
	#instVars : [
		'game',
		'cellPosition'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AtomicBombCell class >> withPostion: aPosition onTheGame: aGame [

	^ self new
		  initializeWithPostion: aPosition
		  onTheGame: aGame
]

{ #category : #action }
AtomicBombCell >> enter [

	game resetSpaceshipsToCellOne.
	^ 1
]

{ #category : #action }
AtomicBombCell >> exit: aValue [

	^ true
]

{ #category : #initialization }
AtomicBombCell >> initializeWithPostion: aPosition onTheGame: aGame [

	game := aGame.
	cellPosition := aPosition
]
