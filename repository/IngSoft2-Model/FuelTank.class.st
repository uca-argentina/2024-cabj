Class {
	#name : #FuelTank,
	#superclass : #Object,
	#instVars : [
		'fuel'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
FuelTank class >> fullWith: anAmountOfFuel [

	^ self new initializeFullWith: anAmountOfFuel
]

{ #category : #initialization }
FuelTank >> initializeFullWith: anAmountOfFuel [

	fuel := anAmountOfFuel
]

{ #category : #testing }
FuelTank >> isEmpty [

	^ fuel <= 0
]

{ #category : #'as yet unclassified' }
FuelTank >> loadFuel [
	self shouldBeImplemented.
]

{ #category : #setter }
FuelTank >> loadFuel: anAmountOfFuel [

	fuel := fuel + anAmountOfFuel
]

{ #category : #'as yet unclassified' }
FuelTank >> loadedWith [

	^ fuel
]

{ #category : #'as yet unclassified' }
FuelTank >> useFuel: anAmountOfFuel [

	fuel := fuel - anAmountOfFuel
]
