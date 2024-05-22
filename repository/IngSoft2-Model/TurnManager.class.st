Class {
	#name : #TurnManager,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'currentSpaceship',
		'turnsToSkip',
		'anAllShipsDisabledHandler'
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
	anAllShipsDisabledHandler:= AllShipsDisabledHandler new.
	currentSpaceship:=spaceships at: 1.
	turnsToSkip := Dictionary new.
	spaceships do: [:each | turnsToSkip at: each put: 0].
	
]

{ #category : #action }
TurnManager >> lostTwoTurns: aSpaceship [ 
	| currentTurns |
	currentTurns := turnsToSkip at: aSpaceship ifAbsent: [0].
	turnsToSkip at: aSpaceship put: (currentTurns + 2).
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
	(turnsToSkip at: currentSpaceship) > 0 ifTrue: [
		turnsToSkip
			at: currentSpaceship
			put: (turnsToSkip at: currentSpaceship) - 1.
		currentSpaceship := self nextSpaceship ].
	spaceshipPlaying := currentSpaceship.
	currentSpaceship := self nextSpaceship.
	^ spaceshipPlaying
]
