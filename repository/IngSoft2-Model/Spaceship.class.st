Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'id',
		'collectionActualPosition',
		'aFuelTank'
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
	completedLaps := collectionActualPosition completedLaps.
	aSpaceshipCompletedLaps := aSpaceship objectPosition completedLaps.
	cellPosition := collectionActualPosition cell.
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

{ #category : #accessing }
Spaceship >> id [

	^ id
]

{ #category : #initialization }
Spaceship >> initializeLaunch: counterId withFuel: anAmountOfFuel [

	collectionActualPosition := Position startGame.
	aFuelTank := FuelTank fullWith: anAmountOfFuel.
	id := counterId
]

{ #category : #setter }
Spaceship >> loadFuel: anAmountOfFuel [

	aFuelTank loadFuel: anAmountOfFuel
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements [

	| actualIndex nextIndex completedLaps |
	actualIndex := collectionActualPosition getIndex.
	nextIndex := aNumberOfMovements + actualIndex.
	completedLaps := collectionActualPosition completedLaps.

	collectionActualPosition setCellAndLapWith: nextIndex.

	aFuelTank useFuel: aNumberOfMovements abs.

	aFuelTank runOutOfFuel: self
]

{ #category : #'set and get' }
Spaceship >> objectPosition [

	^ collectionActualPosition
]

{ #category : #initialization }
Spaceship >> resetToOne [

	| completedLaps |
	completedLaps := collectionActualPosition completedLaps.

	collectionActualPosition setCellAndLapWith: completedLaps + 1
]
