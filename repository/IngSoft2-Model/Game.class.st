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
Game class >> begin [
	^(self new) initializeBegin.
]

{ #category : #'as yet unclassified' }
Game class >> begin: anAmountOfBoxes [
	^(self new) initializeBegin: anAmountOfBoxes.
]

{ #category : #initialization }
Game >> initializeBegin [
	aSpaceship:= Spaceship launch.
]

{ #category : #initialization }
Game >> initializeBegin: anAmountOfBoxes [
	aSpaceship:= Spaceship launch.
	amountOfBoxes:= anAmountOfBoxes .
]

{ #category : #'as yet unclassified' }
Game >> moveSpaceship [
	
	| spaceshipPosition |
	spaceshipPosition:= (aSpaceship move).
	spaceshipPosition = amountOfBoxes ifTrue: [^'Finished game'].
	^spaceshipPosition.
]
