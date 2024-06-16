Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'id',
		'collectionActualPosition',
		'aFuelTank',
		'lostTurns'
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

{ #category : #action }
Spaceship >> changeCapacity: aNumber [

	aFuelTank changeCapacity: aNumber
]

{ #category : #accessing }
Spaceship >> id [

	^ id
]

{ #category : #initialization }
Spaceship >> initializeLaunch: counterId withFuel: anAmountOfFuel [

	collectionActualPosition := Position startGame.
	aFuelTank := FuelTank fullWith: anAmountOfFuel.
	id := counterId.
	lostTurns := false
]

{ #category : #setter }
Spaceship >> loadFuel [

	aFuelTank loadFuel
]

{ #category : #accessing }
Spaceship >> lostTurns [

	| auxVar |
	auxVar := lostTurns.
	lostTurns := false.
	^ auxVar
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements [

	| actualIndex nextIndex completedLaps |
	actualIndex := collectionActualPosition index.
	nextIndex := aNumberOfMovements + actualIndex.
	completedLaps := collectionActualPosition completedLaps.

	collectionActualPosition updateCellAndLapWith: nextIndex.

	aFuelTank useFuel: aNumberOfMovements abs.

	aFuelTank runOutOfFuel: self
]

{ #category : #'set and get' }
Spaceship >> objectFuelTank [

	^ aFuelTank
]

{ #category : #'set and get' }
Spaceship >> objectPosition [

	^ collectionActualPosition
]

{ #category : #initialization }
Spaceship >> resetToOne [

	| completedLaps |
	completedLaps := collectionActualPosition completedLaps.

	collectionActualPosition updateCellAndLapWith: completedLaps + 1.

	lostTurns := true
]
