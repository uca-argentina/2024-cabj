Class {
	#name : #AllyCard,
	#superclass : #PermanentCard,
	#instVars : [
		'allyTwoId',
		'spaceshipOne',
		'spaceshipTwo'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AllyCard class >> redo: aSpaceshipId [

	^ self new initializeShareFuelWith: aSpaceshipId
]

{ #category : #'instance creation' }
AllyCard class >> shareFuelWith: aSpaceshipId [

	^ self new initializeShareFuelWith: aSpaceshipId
]

{ #category : #'set and get' }
AllyCard >> ally [

	^ allyTwoId
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

{ #category : #initialization }
AllyCard >> initializeShareFuelWith: aSpaceshipId [

	allyTwoId := aSpaceshipId
]

{ #category : #comparing }
AllyCard >> isExactlyTheSameCard: aCard [

	^ self class == aCard class and: allyTwoId = aCard ally
]

{ #category : #accessing }
AllyCard >> withEffectOn: aGame [

	| fuelTankOne fuelTankTwo |
	spaceshipOne := aGame currentSpaceship.
	spaceshipTwo := aGame spaceships detectSpaceshipWithId: allyTwoId.
	fuelTankOne := spaceshipOne objectFuelTank.
	fuelTankTwo := spaceshipTwo objectFuelTank.

	spaceshipOne shareWith: spaceshipTwo.
	spaceshipTwo shareWith: spaceshipOne.
	fuelTankOne shareWith: fuelTankTwo.
	fuelTankTwo shareWith: fuelTankOne
]

{ #category : #accessing }
AllyCard >> withRedoEffectOn: aGame forSpaceship: anId orCardToCancel: cardToCancel [

	| fuelTankOne fuelTankTwo |
	aGame activateInstantCard: self.
	spaceshipOne := aGame spaceships detectSpaceshipWithId: anId.
	spaceshipTwo := aGame spaceships detectSpaceshipWithId: allyTwoId.
	fuelTankOne := spaceshipOne objectFuelTank.
	fuelTankTwo := spaceshipTwo objectFuelTank.

	spaceshipOne shareWith: spaceshipTwo.
	spaceshipTwo shareWith: spaceshipOne.
	fuelTankOne shareWith: fuelTankTwo.
	fuelTankTwo shareWith: fuelTankOne
]
