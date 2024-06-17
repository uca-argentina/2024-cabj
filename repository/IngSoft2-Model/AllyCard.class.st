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

	| spaceshipOne spaceshipTwo fuelTankOne fuelTankTwo |
	spaceshipOne := aGame currentSpaceship.
	spaceshipTwo := aGame spaceships detect: [ :spaceship |
		                spaceship id = allayTwoId ].
	fuelTankOne := spaceshipOne objectFuelTank.
	fuelTankTwo := spaceshipTwo objectFuelTank.

	spaceshipOne shareWith: spaceshipTwo.
	spaceshipTwo shareWith: spaceshipOne.
	fuelTankOne shareWith: fuelTankTwo.
	fuelTankTwo shareWith: fuelTankOne
]
