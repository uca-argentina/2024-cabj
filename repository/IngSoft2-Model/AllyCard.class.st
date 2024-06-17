Class {
	#name : #AllyCard,
	#superclass : #Object,
	#instVars : [
		'allyTwoId'
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

{ #category : #'as yet unclassified' }
AllyCard >> ally [

	^ allyTwoId
]

{ #category : #'as yet unclassified' }
AllyCard >> applyEffectOn: throwResult for: spaceshipId [

	^ throwResult
]

{ #category : #comparing }
AllyCard >> equals: aCard [

	^ self class == aCard class and: allyTwoId = aCard ally
]

{ #category : #initialization }
AllyCard >> initializeShareFuelWith: aSpaceshipId [

	allyTwoId := aSpaceshipId.
	
]

{ #category : #accessing }
AllyCard >> withEffectOn: aGame [

	| spaceshipOne spaceshipTwo fuelTankOne fuelTankTwo |
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
