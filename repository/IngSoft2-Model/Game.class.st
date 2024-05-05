Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aSpaceship',
		'aDie',
		'aBoard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: collectionOfFaces [

	^ self new
		  initializeWithBoardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd
		  playWithDice: collectionOfFaces
]

{ #category : #initialization }
Game >> initializeWithBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDice: collectionOfFaces [

	aBoard := Board
		          of: anAmountOfBoxes
		          withWormholeBeginning: (beginningAndEnd at: 1)
		          andEnding: (beginningAndEnd at: 2).
	aSpaceship := Spaceship launch.
	aDie := Die of: collectionOfFaces
]

{ #category : #action }
Game >> moveSpaceship [
	| positionOfSpaceship |
	positionOfSpaceship:= aSpaceship playWith: aDie on: aBoard .
	positionOfSpaceship = aBoard finishLine ifTrue: [ ^'Game Over' ].
	^positionOfSpaceship.
]
