Class {
	#name : #TurnManager,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'anAllShipsDisabledHandler',
		'currentSpaceship',
		'turnsToSkip',
		'spaceshipPlaying'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
TurnManager class >> manage: collectionOfSpaceships [ 
	^(self new) initializeManage: collectionOfSpaceships .
]

{ #category : #action }
TurnManager >> decrementTurnsOfSpaceship [

	turnsToSkip
		at: currentSpaceship
		put: (turnsToSkip at: currentSpaceship) - 1
]

{ #category : #initialization }
TurnManager >> initializeManage: collectionOfSpaceships [

	spaceships := collectionOfSpaceships.

	currentSpaceship := spaceships at: 1.
	spaceshipPlaying := spaceships at: 1.
	turnsToSkip := Dictionary new.
	turnsToSkip at: anAllShipsDisabledHandler put: 2.
	1 to: spaceships size do: [ :index |
	turnsToSkip at: (spaceships at: index) put: 0 ]
]

{ #category : #action }
TurnManager >> lostTurns: anAmountOfTurns by: aSpaceship [

	(turnsToSkip at: aSpaceship) = 0 ifTrue: [
		turnsToSkip at: aSpaceship put: anAmountOfTurns  ]
]

{ #category : #auxiliar }
TurnManager >> nextSpaceship [

        | currentIndex nextIndex |
        currentIndex := spaceships indexOf: currentSpaceship .
        nextIndex := currentIndex + 1.
        nextIndex > spaceships size ifTrue: [nextIndex := 1].
        currentSpaceship:= spaceships at: nextIndex
]

{ #category : #action }
TurnManager >> nextTurn [

	(turnsToSkip allSatisfy: [ :spaceship | spaceship value > 0 ])
		ifTrue: [
			self decrementTurnsOfSpaceship.
			self nextSpaceship.
			 ].

	(turnsToSkip at: currentSpaceship) > 0 ifTrue: [
		self decrementTurnsOfSpaceship.
		self nextSpaceship ].
	spaceshipPlaying := currentSpaceship.
	self nextSpaceship.
	^ spaceshipPlaying
]

{ #category : #accessing }
TurnManager >> spaceshipPlaying [
	^ spaceshipPlaying
]
