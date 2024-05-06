Class {
	#name : #TurnManagerWithId,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'turn'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
TurnManagerWithId class >> manage: collectionOfSpaceships [ 
	^(self new) initializeManage: collectionOfSpaceships .
]

{ #category : #initialization }
TurnManagerWithId >> initializeManage: collectionOfSpaceships [ 
	spaceships:= collectionOfSpaceships .
	turn:=spaceships at: 1.
	
]

{ #category : #auxiliar }
TurnManagerWithId >> nextSpaceship [

        | currentIndex nextIndex |
        currentIndex := spaceships indexOf: turn ifAbsent: [0].
        nextIndex := currentIndex + 1.
        nextIndex > spaceships size ifTrue: [nextIndex := 1].
        ^spaceships at: nextIndex
]

{ #category : #action }
TurnManagerWithId >> nextTurn [
	| currentSpaceship |
	currentSpaceship :=turn.
	turn:= self nextSpaceship.
	^currentSpaceship .
]
