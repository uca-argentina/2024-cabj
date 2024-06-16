Class {
	#name : #AllyCard,
	#superclass : #Object,
	#instVars : [
		'allayTwoId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AllyCard class >> shareFuelWith: aSpaceshipId [

	^ self new initializeShareFuelWith: aSpaceshipId
]

{ #category : #comparing }
AllyCard >> = aCard [

	^ self class == aCard class
]

{ #category : #initialization }
AllyCard >> initializeShareFuelWith: aSpaceshipId [

	allayTwoId := aSpaceshipId.
	
]

{ #category : #accessing }
AllyCard >> withEffectOn: aGame [

	| fuelTankOne fuelTankTwo |
	fuelTankOne := aGame currentSpaceship objectFuelTank.
	fuelTankTwo := (aGame spaceships detect: [ :spaceship |
		                spaceship id = allayTwoId ]) objectFuelTank.

	fuelTankOne shareWith: fuelTankTwo.
	fuelTankTwo shareWith: fuelTankOne
]
