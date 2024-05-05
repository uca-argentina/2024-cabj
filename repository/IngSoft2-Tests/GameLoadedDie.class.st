Class {
	#name : #GameLoadedDie,
	#superclass : #Object,
	#instVars : [
		'aSpaceship',
		'aBoard',
		'collectionOfDice',
		'collectionOfSpaceships',
		'turnManager'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
GameLoadedDie class >> numberOfSpaceships: anAmountOfSpaceships boardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: collectionOfFaces [ 
	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships 
		  boardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd
		  playWithDice: collectionOfFaces.
]

{ #category : #initialization }
GameLoadedDie >> initializeNumberOfSpaceships: anAmountOfSpaceships boardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: collectionOfFaces [ 
	
	aBoard := Board
		          of: anAmountOfBoxes
		          withWormholeBeginning: (beginningAndEnd at: 1)
		          andEnding: (beginningAndEnd at: 2).
	
	collectionOfSpaceships:= OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [ collectionOfSpaceships add: Spaceship launch ].
	turnManager:= TurnManager manage: collectionOfSpaceships .
	
	collectionOfFaces asOrderedCollection .
	collectionOfDice := collectionOfFaces collect: [ :numberOfFaces |
		                    LoadedDie of: numberOfFaces ]
]

{ #category : #action }
GameLoadedDie >> moveSpaceship [
	| positionOfSpaceship nextSpaceship |
	nextSpaceship:= turnManager nextTurn.
	positionOfSpaceship:= nextSpaceship playWith: collectionOfDice on: aBoard .
	positionOfSpaceship = aBoard finishLine ifTrue: [ ^'Game Over' ].
	^positionOfSpaceship.
]
