Class {
	#name : #FuelTank,
	#superclass : #Object,
	#instVars : [
		'fuel',
		'capacity',
		'fuelTankSharing'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
FuelTank class >> fullWith: anAmountOfFuel [

	^ self new initializeFullWith: anAmountOfFuel
]

{ #category : #accessing }
FuelTank >> capacity [

	^ capacity
]

{ #category : #action }
FuelTank >> changeCapacity: aNumber [

	capacity := capacity + aNumber
]

{ #category : #initialization }
FuelTank >> initializeFullWith: anAmountOfFuel [

	fuel := anAmountOfFuel.
	capacity := anAmountOfFuel.
]

{ #category : #asserting }
FuelTank >> isEmpty [

	^ fuel <= 0
]

{ #category : #action }
FuelTank >> loadFuel: anAmountOfFuel [

	fuel := fuel + anAmountOfFuel
]

{ #category : #'set and get' }
FuelTank >> loadedWith [

	^ fuel
]

{ #category : #action }
FuelTank >> reloadToCapacity [

	fuel := capacity
]

{ #category : #action }
FuelTank >> useFuel: anAmountOfFuel [

	fuel := fuel - anAmountOfFuel.
	self isEmpty ifFalse: [ ^ self ].
	fuel := 0
]
