Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aSpaceship',
		'amountOfBoxes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Game class >> begin: anAmountOfBoxes [
	^(self new) initializeBegin: anAmountOfBoxes.
]

{ #category : #initialization }
Game >> initializeBegin: anAmountOfBoxes [
	aSpaceship:= Spaceship launch.
	amountOfBoxes:= anAmountOfBoxes .
]

{ #category : #testing }
Game >> isPlayedWith: aLoadedDie [ 
	^ 4.
]

{ #category : #'as yet unclassified' }
Game >> moveSpaceship: anAmountOfMovements [
	
	| spaceshipNextPosition |

	aSpaceship position =amountOfBoxes  ifTrue: [ Error signal:'The game has already finished.' ].
	
	spaceshipNextPosition:= (aSpaceship move: anAmountOfMovements ).
	spaceshipNextPosition = amountOfBoxes ifTrue: [^'Finished game'].
	^spaceshipNextPosition.
]
