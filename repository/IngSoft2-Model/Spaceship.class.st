Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'actualPosition',
		'id',
		'actualLap',
		'fuel'
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

	actualPosition := 1.
	actualLap := 1.
	fuel := anAmountOfFuel.
	id := counterId
]

{ #category : #setter }
Spaceship >> loadFuel: anAmountOfFuel [ 
	^fuel:=anAmountOfFuel .
]

{ #category : #action }
Spaceship >> move: aNumberOfMovements on: aBoard [

	aNumberOfMovements >= self getFuel ifTrue: [
		actualPosition := aBoard enter: 1.
		fuel := 0.
		^ actualPosition ].
	actualPosition := aBoard enter: actualPosition + aNumberOfMovements.
	fuel := fuel - aNumberOfMovements.
	^ actualPosition
]

{ #category : #accessing }
Spaceship >> position [

	^ OrderedCollection with: actualPosition with: actualLap
]
