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
Spaceship >> move: aNumberOfMovements on: aBoard [

	| actualPosition actualIndex nextIndex completedLaps extraMovements |
	actualIndex := collectionActualPosition getIndex.
	nextIndex := aNumberOfMovements + actualIndex.
	completedLaps := collectionActualPosition completedLaps.
	
	((aBoard at: actualIndex) exit: aNumberOfMovements) ifFalse: [
		^ collectionActualPosition ].

	actualPosition := (aBoard at: nextIndex) enter.
	collectionActualPosition
		setCellAndLapWith: nextIndex
		and: actualPosition.
		
	actualIndex := collectionActualPosition getIndex.
	extraMovements := (actualIndex - nextIndex) abs.
	
	fuel := fuel - aNumberOfMovements .
	fuel := fuel - extraMovements.
	
	fuel <= 0 ifTrue: [
		actualPosition := (aBoard at: 1) enter.
		fuel := 0.
		collectionActualPosition
			setCellAndLapWith: completedLaps + 1
			and: actualPosition.
		^ collectionActualPosition ].

	completedLaps := collectionActualPosition completedLaps.

	^ collectionActualPosition
]

{ #category : #'set and get' }
Spaceship >> objectPosition [

	^ collectionActualPosition
]
