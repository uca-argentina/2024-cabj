Class {
	#name : #AtomicBombCell,
	#superclass : #RegularCell,
	#instVars : [
		'spaceships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AtomicBombCell class >> withPostion: aPosition andSpaceships: aCollectionOfSpaceships [

	^ self new
		  initializeWithPostion: aPosition
		  andSpaceships: aCollectionOfSpaceships
]

{ #category : #action }
AtomicBombCell >> enter [

	spaceships resetToCellOne.
	^ 1
]

{ #category : #initialization }
AtomicBombCell >> initializeWithPostion: aPosition andSpaceships: aCollectionOfSpaceships [

	spaceships := aCollectionOfSpaceships.
	cellPosition := aPosition
]
