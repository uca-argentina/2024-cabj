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
Spaceship >> move: aNumberOfMovements [

	| actualIndex nextIndex completedLaps |
	actualIndex := collectionActualPosition getIndex.
	nextIndex := aNumberOfMovements + actualIndex.
	completedLaps := collectionActualPosition completedLaps.

	collectionActualPosition setCellAndLapWith: nextIndex.

	actualIndex := collectionActualPosition getIndex.

	fuel := fuel - (aNumberOfMovements) abs.

	fuel <= 0 ifTrue: [
		fuel := 0.
		collectionActualPosition setCellAndLapWith: completedLaps + 1 ]
]

{ #category : #'set and get' }
Spaceship >> objectPosition [

	^ collectionActualPosition
]
