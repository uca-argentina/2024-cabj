Class {
	#name : #AtomicBombCell,
	#superclass : #Cell,
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
AtomicBombCell >> enterOn: aGame [

	game resetSpaceshipsToCellOne.
	^ 1
]

{ #category : #action }
AtomicBombCell >> enterWithoutTurn: aSpaceship [

	game resetSpaceshipsToCellOne.
	^ 1
]

{ #category : #initialization }
AtomicBombCell >> initializeWithPostion: aPosition onTheGame: aGame [

	game := aGame.
	cellPosition := aPosition
]
