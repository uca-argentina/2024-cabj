Class {
	#name : #TurnManager,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'currentSpaceship'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
TurnManager class >> manage: collectionOfSpaceships [ 
	^(self new) initializeManage: collectionOfSpaceships .
]

{ #category : #initialization }
TurnManager >> initializeManage: collectionOfSpaceships [ 
	spaceships:= collectionOfSpaceships .
	currentSpaceship:=spaceships at: 1.
	
]

{ #category : #auxiliar }
TurnManager >> nextSpaceship [

        | currentIndex nextIndex |
        currentIndex := spaceships indexOf: currentSpaceship .
        nextIndex := currentIndex + 1.
        nextIndex > spaceships size ifTrue: [nextIndex := 1].
        ^spaceships at: nextIndex
]

{ #category : #action }
TurnManager >> nextTurn [
	| spaceshipPlaying |
	spaceshipPlaying :=currentSpaceship .
	currentSpaceship := self nextSpaceship.
	^spaceshipPlaying  .
]
