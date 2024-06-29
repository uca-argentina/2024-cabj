Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'id',
		'aFuelTank',
		'allySpaceship',
		'fuelDepleted',
		'position'
	],
	#classInstVars : [
		'counterId'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'class initialization' }
Spaceship class >> initialize [

	counterId := 0
]

{ #category : #'instance creation' }
Spaceship class >> launchWithFuel: anAmountOfFuel [
	counterId := counterId + 1.
	^ self new initializeLaunch: counterId withFuel: anAmountOfFuel .
]

{ #category : #comparing }
Spaceship >> > aSpaceship [

	| completedLaps aSpaceshipCompletedLaps cellPosition aSpaceshipCellPosition |
	completedLaps := position lap - 1.
	aSpaceshipCompletedLaps := aSpaceship objectPosition lap -1.
	cellPosition := position cell.
	aSpaceshipCellPosition := aSpaceship objectPosition cell.

	^ completedLaps > aSpaceshipCompletedLaps
		  ifTrue: [ true ]
		  ifFalse: [
			  completedLaps = aSpaceshipCompletedLaps
				  ifTrue: [ cellPosition > aSpaceshipCellPosition ]
				  ifFalse: [ false ] ]
]

{ #category : #'set and get' }
Spaceship >> amountOfFuel [

	^ aFuelTank loadedWith
]

{ #category : #action }
Spaceship >> changeCapacity: aNumber [

	aFuelTank changeCapacity: aNumber
]

{ #category : #accessing }
Spaceship >> fuelDepleted [

	^ fuelDepleted
]

{ #category : #accessing }
Spaceship >> id [

	^ id
]

{ #category : #initialization }
Spaceship >> initializeLaunch: counterId withFuel: anAmountOfFuel [

	position := Position startGame.
	aFuelTank := FuelTank fullWith: anAmountOfFuel.
	id := counterId.
	fuelDepleted := aFuelTank isEmpty.
	allySpaceship := self
]

{ #category : #setter }
Spaceship >> loadFuel [

	aFuelTank reloadToCapacity
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements [

	| aux |
	aux := aNumberOfMovements.
	aNumberOfMovements > aFuelTank loadedWith ifTrue: [
		aux := aFuelTank loadedWith ].

	position updateCell: aux.

	aFuelTank useFuel: aux abs
]

{ #category : #'set and get' }
Spaceship >> objectFuelTank [

	^ aFuelTank
]

{ #category : #'set and get' }
Spaceship >> objectPosition [

	^ position
]

{ #category : #initialization }
Spaceship >> resetToOne [

	| currentCell |
	currentCell := position cell.
	position updateCell: 1 - currentCell
]

{ #category : #action }
Spaceship >> shareWith: aAllySpaceship [

	allySpaceship := aAllySpaceship.
	allySpaceship objectFuelTank shareWith: aFuelTank
]

{ #category : #action }
Spaceship >> stopSharing [

	allySpaceship := self
]
