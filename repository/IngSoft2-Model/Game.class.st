Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aSpaceship',
		'amountOfBoxes',
		'aDie'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Game class >> begin: anAmountOfBoxes [
	^(self new) initializeBegin: anAmountOfBoxes.
]

{ #category : #'as yet unclassified' }
Game class >> withBoard: anAmountOfBoxes playWithDieOf: anAmountOfFaces [

	^ self new
		  initializeWithBoard: anAmountOfBoxes
		  playWithDieOf: anAmountOfFaces
]

{ #category : #initialization }
Game >> initializeBegin: anAmountOfBoxes [
	aSpaceship:= Spaceship launch.
	amountOfBoxes:= anAmountOfBoxes .
]

{ #category : #initialization }
Game >> initializeWithBoard: anAmountOfBoxes playWithDieOf: anAmountOfFaces [

	amountOfBoxes := anAmountOfBoxes.
	aSpaceship := Spaceship launch.
	aDie := LoadedDie of: anAmountOfFaces 
]

{ #category : #testing }
Game >> isPlayedWith: aLoadedDie [ 
	^ self moveSpaceship: (aLoadedDie throw).
]

{ #category : #'as yet unclassified' }
Game >> moveSpaceship [
	^ aSpaceship playWith: aDie  .
]

{ #category : #'as yet unclassified' }
Game >> moveSpaceship: anAmountOfMovements [
	
	| spaceshipNextPosition |

	aSpaceship position =amountOfBoxes  ifTrue: [ Error signal:'The game has already finished.' ].
	
	spaceshipNextPosition:= (aSpaceship move: anAmountOfMovements ).
	spaceshipNextPosition = amountOfBoxes ifTrue: [^'Finished game'].
	^spaceshipNextPosition.
]
