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

	collectionActualPosition:= OrderedCollection with: 1 with: 1.
	fuel := anAmountOfFuel.
	id := counterId
]

{ #category : #setter }
Spaceship >> loadFuel: anAmountOfFuel [ 
	^fuel:=anAmountOfFuel .
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements on: aBoard [

	| actualPosition actualLap fuelDecrement completedLaps maxCells |
	actualPosition := collectionActualPosition at: 1.
	actualLap := collectionActualPosition at: 2.
	aNumberOfMovements >= self getFuel ifTrue: [
		collectionActualPosition := aBoard enter:
			                            (OrderedCollection
				                             with: 1
				                             with: actualLap).
		fuel := 0.
		^ collectionActualPosition ].
	actualPosition := actualPosition + aNumberOfMovements .
	collectionActualPosition := aBoard enter: (OrderedCollection
			                             with:
			                             actualPosition
			                             with: actualLap).
	completedLaps:=(collectionActualPosition at: 2)-1.
	maxCells:=aBoard finishLine at: 1.
	fuelDecrement:= (actualPosition-(completedLaps*maxCells)) - (collectionActualPosition at: 1).
	fuel := fuel - (aNumberOfMovements + fuelDecrement).
	^ collectionActualPosition
]

{ #category : #accessing }
Spaceship >> position [

	^ collectionActualPosition 
]
