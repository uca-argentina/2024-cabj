Class {
	#name : #BlackHoleCell,
	#superclass : #RegularCell,
	#instVars : [
		'game'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BlackHoleCell class >> newOn: aGame withPostion: aPosition [ 
	^(self new) initializeNewOn: aGame withPostion: aPosition 
]

{ #category : #'instance creation' }
BlackHoleCell >> enter [

	^ cellPosition - 4
]

{ #category : #initialization }
BlackHoleCell >> initializeNewOn: aGame withPostion: aPosition [

	game := aGame.
	cellPosition := aPosition
]
