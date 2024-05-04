Class {
	#name : #GameLoadedDie,
	#superclass : #Object,
	#instVars : [
		'aSpaceship',
		'amountOfBoxes',
		'aDie',
		'aBoard'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #toDelete }
GameLoadedDie class >> begin: anAmountOfBoxes [
	^(self new) initializeBegin: anAmountOfBoxes.
]

{ #category : #'instance creation' }
GameLoadedDie class >> withBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDieOf: anAmountOfFaces [

	^ self new
		  initializeWithBoardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd 
		  playWithDieOf: anAmountOfFaces
]

{ #category : #toDelete }
GameLoadedDie >> initializeBegin: anAmountOfBoxes [
	aSpaceship:= Spaceship launch.
	amountOfBoxes:= anAmountOfBoxes .
]

{ #category : #initialization }
GameLoadedDie >> initializeWithBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDieOf: anAmountOfFaces [

	aBoard := 	Board of: anAmountOfBoxes 
							withWormholeBeginning: (beginningAndEnd at: 1) 
							andEnding: (beginningAndEnd at: 2).
	aSpaceship := Spaceship launch.
	aDie := LoadedDie of: anAmountOfFaces .
]

{ #category : #toDelete }
GameLoadedDie >> isPlayedWith: aLoadedDie [ 
	^ self moveSpaceship: (aLoadedDie throw).
]

{ #category : #action }
GameLoadedDie >> moveSpaceship [
	^ aSpaceship playWith: aDie on: aBoard .
]

{ #category : #toDelete }
GameLoadedDie >> moveSpaceship: anAmountOfMovements [
	
	| spaceshipNextPosition |

	aSpaceship position =amountOfBoxes  ifTrue: [ Error signal:'The game has already finished.' ].
	
	spaceshipNextPosition:= (aSpaceship move: anAmountOfMovements ).
	spaceshipNextPosition = amountOfBoxes ifTrue: [^'Finished game'].
	^spaceshipNextPosition.
]
