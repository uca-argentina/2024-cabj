Class {
	#name : #FuelTankTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
FuelTankTest >> test01FuelTankInitializeWithAmountOfFuelThenIsLoadedWithTheSameAmount [

	| aFuelTank |
	aFuelTank := FuelTank fullWith: 10.

	self assert: aFuelTank loadedWith equals: 10
]

{ #category : #tests }
FuelTankTest >> test02FuelTankUseFuelThenLoadedWithFuelLessTheAmountUsed [

	| aFuelTank |
	aFuelTank := FuelTank fullWith: 10.
	aFuelTank useFuel: 3.
	
	self assert: aFuelTank loadedWith equals: 7
]

{ #category : #tests }
FuelTankTest >> test03FuelTankUseFuelAndLoadsTheSameAmountThenIsLoadedWithAmountInitializedWith [

	| aFuelTank |
	aFuelTank := FuelTank fullWith: 10.
	aFuelTank useFuel: 3.
	aFuelTank loadFuel.

	self assert: aFuelTank loadedWith equals: 10
]

{ #category : #tests }
FuelTankTest >> test04FuelTankInitializeWithFuelThenIsNotEmpty [

	| aFuelTank |
	aFuelTank := FuelTank fullWith: 10.
	
	self deny: aFuelTank isEmpty
]

{ #category : #tests }
FuelTankTest >> test05FuelTankInitializedWithoutFuelThenIsEmpty [

	| aFuelTank |
	aFuelTank := FuelTank fullWith: 0.
	
	self assert: aFuelTank isEmpty
]

{ #category : #tests }
FuelTankTest >> test06UseMoreFuelThanLoadedWithThenFuelTankLoadedWithZero [

	| aFuelTank |
	aFuelTank := FuelTank fullWith: 5.
	aFuelTank useFuel: 6.
	
	self assert: aFuelTank loadedWith equals: 0
]

{ #category : #tests }
FuelTankTest >> test07FuelTankInitializeWithFiveThenCapacityIsFive [

	| aFuelTank |
	aFuelTank := FuelTank fullWith: 5.
	
	self assert: aFuelTank capacity equals: 5
]

{ #category : #tests }
FuelTankTest >> test08ChangedCapacityOfFuelTankThenCapacityHasChange [

	| aFuelTank |
	aFuelTank := FuelTank fullWith: 5.
	aFuelTank changeCapacity: 1.

	self assert: aFuelTank capacity equals: 6
]

{ #category : #tests }
FuelTankTest >> test09FuelTankOneSharesWithTwoThenUsesFuelTankTwosFuel [

	| aFuelTankOne aFuelTankTwo |
	aFuelTankOne := FuelTank fullWith: 0.
	aFuelTankTwo := FuelTank fullWith: 5.
	aFuelTankOne shareWith: aFuelTankTwo.

	aFuelTankOne useFuel: 2.

	self assert: aFuelTankTwo loadedWith equals: 3
]
