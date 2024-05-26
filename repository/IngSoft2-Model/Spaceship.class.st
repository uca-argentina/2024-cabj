Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'id',
		'fuel',
		'collectionActualPosition'
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

{ #category : #'set and get' }
Spaceship >> getFuel [

	^ fuel
]

{ #category : #accessing }
Spaceship >> getId [

	^ id
]

{ #category : #initialization }
Spaceship >> initializeLaunch: counterId withFuel: anAmountOfFuel [

	collectionActualPosition := Position startGame.
	fuel := anAmountOfFuel.
	id := counterId
]

{ #category : #setter }
Spaceship >> loadFuel: anAmountOfFuel [ 
	^fuel:=anAmountOfFuel .
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements on: aBoard of: amountOfCells [

	| actualPosition actualLap resultingPosition fuelDecrement completedLaps |
	actualPosition := collectionActualPosition cell.
	actualLap := collectionActualPosition lap.
	completedLaps := amountOfCells * (actualLap - 1).

	aNumberOfMovements >= self getFuel ifTrue: [
		actualPosition := (aBoard at: 1) enter.
		fuel := 0.
		collectionActualPosition setCell: actualPosition.
		^ collectionActualPosition ].

	resultingPosition := actualPosition + completedLaps
	                     + aNumberOfMovements.
	actualPosition := (aBoard at: resultingPosition) enter.
	actualPosition - completedLaps < 0 ifTrue: [
		actualLap := actualLap - 1 ].
	actualLap := resultingPosition - 1 // amountOfCells + 1.
	collectionActualPosition setCell: actualPosition.
	collectionActualPosition setLap: actualLap.
	completedLaps := amountOfCells * (actualLap - 1).
	fuelDecrement := resultingPosition - completedLaps - actualPosition.
	fuel := fuel - aNumberOfMovements - fuelDecrement.
	^ collectionActualPosition
]

{ #category : #accessing }
Spaceship >> position [

	^ collectionActualPosition 
]
