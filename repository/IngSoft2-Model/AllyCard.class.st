Class {
	#name : #AllyCard,
	#superclass : #Object,
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

{ #category : #comparing }
AllyCard >> = aCard [

	^ self class == aCard class
]

{ #category : #'set and get' }
AllyCard >> ally [

	^ allyTwoId
]

{ #category : #effect }
AllyCard >> applyEffectOn: throwResult for: spaceshipId [

	^ throwResult
]

{ #category : #comparing }
AllyCard >> compare: aCard [

	^ self class == aCard class and: allyTwoId = aCard ally
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

{ #category : #accessing }
AllyCard >> withEffectOn: aGame [

	| fuelTankOne fuelTankTwo |
	spaceshipOne := aGame currentSpaceship.
	spaceshipTwo := aGame spaceships detect: [ :spaceship |
		                spaceship id = allyTwoId ].
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
	aGame activeDeck activate: self.
	spaceshipOne := aGame spaceships detect: [ :spaceship |
		                spaceship id = anId ].
	spaceshipTwo := aGame spaceships detect: [ :spaceship |
		                spaceship id = allyTwoId ].
	fuelTankOne := spaceshipOne objectFuelTank.
	fuelTankTwo := spaceshipTwo objectFuelTank.

	spaceshipOne shareWith: spaceshipTwo.
	spaceshipTwo shareWith: spaceshipOne.
	fuelTankOne shareWith: fuelTankTwo.
	fuelTankTwo shareWith: fuelTankOne
]
