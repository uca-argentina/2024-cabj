Class {
	#name : #TurnManager,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'turn'
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
	turn:=spaceships at: 1.
	
]

{ #category : #auxiliar }
TurnManager >> nextSpaceship [

        | currentIndex nextIndex |
        currentIndex := spaceships indexOf: turn ifAbsent: [0].
        nextIndex := currentIndex + 1.
        nextIndex > spaceships size ifTrue: [nextIndex := 1].
        ^spaceships at: nextIndex
]

{ #category : #action }
TurnManager >> nextTurn [
	| currentSpaceship |
	currentSpaceship :=turn.
	turn:= self nextSpaceship.
	^currentSpaceship .
]
