Class {
	#name : #AtomicBombCell,
	#superclass : #RegularCell,
	#instVars : [
		'game'
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

	game resetSpaceshipsToCellOne .
	^ 1
]

{ #category : #initialization }
AtomicBombCell >> initializeWithPostion: aPosition onTheGame: aGame [

	game:=aGame.
	cellPosition := aPosition
]
