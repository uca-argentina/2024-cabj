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
	fuelTankSharing := self
]

{ #category : #asserting }
FuelTank >> isEmpty [

	^ fuel <= 0
]

{ #category : #action }
FuelTank >> loadFuel [

	fuel := capacity
]

{ #category : #'set and get' }
FuelTank >> loadedWith [

	^ fuel
]

{ #category : #accessing }
FuelTank >> runOutOfFuel: aSpaceship [

	(self isEmpty and: fuelTankSharing isEmpty) ifTrue: [
		aSpaceship resetToOne ]
]

{ #category : #action }
FuelTank >> shareWith: aFuelTank [

	fuelTankSharing := aFuelTank
]

{ #category : #action }
FuelTank >> stopSharing [

	fuelTankSharing := self
]

{ #category : #action }
FuelTank >> useFuel: anAmountOfFuel [

	fuel := fuel - anAmountOfFuel.
	self isEmpty ifFalse: [ ^ self ].
	fuelTankSharing isEmpty ifFalse: [ fuelTankSharing useFuel: fuel abs ].
	fuel := 0
]
