Class {
	#name : #AllyCard,
	#superclass : #PermanentCard,
	#instVars : [
		'spaceshipOne',
		'spaceshipTwo'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AllyCard >> activateEffectOn: aGame forSpaceship: anId [

	| fuelTankOne fuelTankTwo |
	aGame activateCard: self.
	spaceshipOne := aGame spaceships detectSpaceshipWithId:
		                anId.
	spaceshipTwo := aGame spaceships detectSpaceshipWithId:
		                spaceshipAffected.
	fuelTankOne := spaceshipOne objectFuelTank.
	fuelTankTwo := spaceshipTwo objectFuelTank.

	spaceshipOne shareWith: spaceshipTwo.
	spaceshipTwo shareWith: spaceshipOne.
	fuelTankOne shareWith: fuelTankTwo.
	fuelTankTwo shareWith: fuelTankOne
]

{ #category : #'set and get' }
AllyCard >> ally [

	^ spaceshipAffected 
]

{ #category : #action }
AllyCard >> deactivate [

	| fuelTankOne fuelTankTwo |
	fuelTankOne := spaceshipOne objectFuelTank.
	fuelTankTwo := spaceshipTwo objectFuelTank.

	spaceshipOne stopSharing.
	spaceshipTwo stopSharing.
	fuelTankOne stopSharing.
	fuelTankTwo stopSharing
]

{ #category : #comparing }
AllyCard >> isExactlyTheSameCard: aCard [

	^ self class == aCard class and: spaceshipAffected = aCard ally
]
