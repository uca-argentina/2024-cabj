Class {
	#name : #AtomicBombCell,
	#superclass : #RegularCell,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AtomicBombCell class >> newOn: aGame withPostion: aPosition [ 
	^(self new) initializeNewOn: aGame withPostion: aPosition 
]

{ #category : #'instance creation' }
AtomicBombCell >> enter [

	^ 1
]

{ #category : #initialization }
AtomicBombCell >> initializeNewOn: aGame withPostion: aPosition [

	game := aGame.
	cellPosition := aPosition
]
