Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aSpaceship',
		'amountOfBoxes',
		'aDie',
		'aBoard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Game class >> begin: anAmountOfBoxes [
	^(self new) initializeBegin: anAmountOfBoxes.
]

{ #category : #'as yet unclassified' }
Game class >> withBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDieOf: anAmountOfFaces [

	^ self new
		  initializeWithBoardBoxes: anAmountOfBoxes
		  wormholeStartAndEnd: beginningAndEnd 
		  playWithDieOf: anAmountOfFaces
]

{ #category : #toDelete }
Game >> initializeBegin: anAmountOfBoxes [
	aSpaceship:= Spaceship launch.
	amountOfBoxes:= anAmountOfBoxes .
]

{ #category : #initialization }
Game >> initializeWithBoardBoxes: anAmountOfBoxes wormholeStartAndEnd: beginningAndEnd playWithDieOf: anAmountOfFaces [

	aBoard := 	Board of: anAmountOfBoxes 
							withWormholeBeginning: (beginningAndEnd at: 1) 
							andEnding: (beginningAndEnd at: 2).
	aSpaceship := Spaceship launch.
	aDie := LoadedDie of: anAmountOfFaces .
]

{ #category : #toDelete }
Game >> isPlayedWith: aLoadedDie [ 
	^ self moveSpaceship: (aLoadedDie throw).
]

{ #category : #'as yet unclassified' }
Game >> moveSpaceship [
	^ aSpaceship playWith: aDie  .
]

{ #category : #toDelete }
Game >> moveSpaceship: anAmountOfMovements [
	
	| spaceshipNextPosition |

	aSpaceship position =amountOfBoxes  ifTrue: [ Error signal:'The game has already finished.' ].
	
	spaceshipNextPosition:= (aSpaceship move: anAmountOfMovements ).
	spaceshipNextPosition = amountOfBoxes ifTrue: [^'Finished game'].
	^spaceshipNextPosition.
]
