Class {
	#name : #GameLoadedDie,
	#superclass : #Object,
	#instVars : [
		'aSpaceship',
		'aDie',
		'aBoard',
		'collectionOfDice'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
GameLoadedDie class >> withBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDieOf: anAmountOfFaces [

	^ self new
		  initializeWithBoardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd 
		  playWithDieOf: anAmountOfFaces
]

{ #category : #initialization }
GameLoadedDie >> initializeWithBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDieOf: anAmountOfFaces [

	
	aBoard := 	Board of: anAmountOfBoxes 
							withWormholeBeginning: (beginningAndEnd at: 1) 
							andEnding: (beginningAndEnd at: 2).
	aSpaceship := Spaceship launch.
	
	collectionOfDice := OrderedCollection new.
	anAmountOfFaces do: [ :numberOfFaces | collectionOfDice add:(LoadedDie of:numberOfFaces)]
]

{ #category : #action }
GameLoadedDie >> moveSpaceship [
	| positionOfSpaceship |
	positionOfSpaceship:= aSpaceship playWith: collectionOfDice on: aBoard .
	positionOfSpaceship = aBoard finishLine ifTrue: [ ^'Game Over' ].
	^positionOfSpaceship.
]
