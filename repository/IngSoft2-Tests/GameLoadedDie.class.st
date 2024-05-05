Class {
	#name : #GameLoadedDie,
	#superclass : #Object,
	#instVars : [
		'aSpaceship',
		'aBoard',
		'collectionOfDice'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
GameLoadedDie class >> withBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: collectionOfFaces [

	^ self new
		  initializeWithBoardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd
		  playWithDice: collectionOfFaces
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
	| positionOfSpaceship |
	positionOfSpaceship:= aSpaceship playWith: collectionOfDice on: aBoard .
	positionOfSpaceship = aBoard finishLine ifTrue: [ ^'Game Over' ].
	^positionOfSpaceship.
]
