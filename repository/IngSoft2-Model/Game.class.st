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

{ #category : #'as yet unclassified' }
Game >> moveSpaceship [
	
	| spaceshipNextPosition |

	aSpaceship position =amountOfBoxes  ifTrue: [ Error signal:'The game has already finished.' ].
	
	spaceshipNextPosition:= (aSpaceship move).
	spaceshipNextPosition = amountOfBoxes ifTrue: [^'Finished game'].
	^spaceshipNextPosition.
]