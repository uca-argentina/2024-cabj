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

{ #category : #'as yet unclassified' }
GameLoadedDie class >> numberOfSpaceships: anAmountOfSpaceships boardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: collectionOfFaces [ 
	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships 
		  boardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd
		  playWithDice: collectionOfFaces.
]

{ #category : #'as yet unclassified' }
GameLoadedDie class >> withAmountOfSpaceships: anInteger boardBoxes: anInteger2 wormholeStartAndEnd: aCollection playWithDice: aCollection4 [ 
	self shouldBeImplemented.
]

{ #category : #'instance creation' }
GameLoadedDie class >> withBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: collectionOfFaces [

	^ self new
		  initializeWithBoardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd
		  playWithDice: collectionOfFaces
]

{ #category : #initialization }
GameLoadedDie >> initializeNumberOfSpaceships: anAmountOfSpaceships boardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: collectionOfFaces [ 
	
	aBoard := Board
		          of: anAmountOfBoxes
		          withWormholeBeginning: (beginningAndEnd at: 1)
		          andEnding: (beginningAndEnd at: 2).
	
	aSpaceship := Spaceship launch.
	
	collectionOfSpaceships:= OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [ collectionOfSpaceships add: Spaceship launch ].
	turnManager:= TurnManager manage: collectionOfSpaceships .
	
	collectionOfFaces asOrderedCollection .
	collectionOfDice := collectionOfFaces collect: [ :numberOfFaces |
		                    LoadedDie of: numberOfFaces ]
]

{ #category : #initialization }
GameLoadedDie >> initializeWithBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: collectionOfFaces [

	aBoard := Board
		          of: anAmountOfBoxes
		          withWormholeBeginning: (beginningAndEnd at: 1)
		          andEnding: (beginningAndEnd at: 2).

	aSpaceship := Spaceship launch.
	
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
