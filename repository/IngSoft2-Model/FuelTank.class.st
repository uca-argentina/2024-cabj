Class {
	#name : #FuelTank,
	#superclass : #Object,
	#instVars : [
		'fuel'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
FuelTank class >> fullWith: anAmountOfFuel [

	^ self new initializeFullWith: anAmountOfFuel
]

{ #category : #initialization }
FuelTank >> initializeFullWith: anAmountOfFuel [

	fuel := anAmountOfFuel
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

{ #category : #accessing }
FuelTank >> runOutOfFuel: aSpaceship [

	self isEmpty ifTrue: [ aSpaceship resetToOne ]
]

{ #category : #action }
FuelTank >> useFuel: anAmountOfFuel [

	fuel := fuel - anAmountOfFuel.
	self isEmpty ifTrue: [ fuel := 0 ]
]
