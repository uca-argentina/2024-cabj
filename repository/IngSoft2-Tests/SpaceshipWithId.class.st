Class {
	#name : #SpaceshipWithId,
	#superclass : #Object,
	#instVars : [
		'actualPosition',
		'spaceShipId'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
SpaceshipWithId class >> launch: id [

^(self new) initializeLaunch: id.
]

{ #category : #action }
SpaceshipWithId >> checkIf: sumOfThrows isLegalOn: aBoard [

	| movements |
	movements := aBoard legalMoveFrom: actualPosition move: sumOfThrows.
	^ movements
]

{ #category : #initialization }
SpaceshipWithId >> initializeLaunch: id [

actualPosition := 0.
spaceShipId:= id.
]

{ #category : #action }
SpaceshipWithId >> move: aNumberOfMovements [
	actualPosition   := actualPosition + aNumberOfMovements .
	^ actualPosition . 
]

{ #category : #action }
SpaceshipWithId >> playWith: collectionOfDice on: aBoard [

	| movements sumOfThrows |
	
	sumOfThrows := self sumOfThrows: collectionOfDice.
	
	movements := self checkIf: sumOfThrows isLegalOn: aBoard.
	
	self move: movements.
	
	actualPosition := aBoard enterWormhole: actualPosition.
	^ actualPosition
]

{ #category : #accessing }
SpaceshipWithId >> position [
	^ actualPosition .
]

{ #category : #'set and get' }
SpaceshipWithId >> spaceshipName [
^spaceShipId .
]

{ #category : #action }
SpaceshipWithId >> sumOfThrows: collectionOfDice [

	| sumOfThrows |
	sumOfThrows := 0.
	collectionOfDice do: [ :die | sumOfThrows := sumOfThrows + die throw ].
	^ sumOfThrows
]
