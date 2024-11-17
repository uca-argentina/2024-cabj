Class {
	#name : #AllyTankManager,
	#superclass : #Object,
	#instVars : [
		'fuelTanks',
		'dictionaryOfAllys'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AllyTankManager class >> manage: aCollectionOfSpaceships [

	^ (self new) initializeManage: aCollectionOfSpaceships
]

{ #category : #'set and get' }
AllyTankManager >> ally: aSpaceship with: aSpaceshipTwo [

	((dictionaryOfAllys includesKey: aSpaceship) or:
		 (dictionaryOfAllys includesKey: aSpaceshipTwo)) ifTrue: [ ^ self ].
	dictionaryOfAllys at: aSpaceship put: aSpaceshipTwo.
	dictionaryOfAllys at: aSpaceshipTwo put: aSpaceship
]

{ #category : #initialization }
AllyTankManager >> allyOf: aSpaceship [

	(dictionaryOfAllys includesKey: aSpaceship) ifFalse: [ ^ aSpaceship ].
	^ dictionaryOfAllys at: aSpaceship
]

{ #category : #initialization }
AllyTankManager >> initializeManage: aCollectionOfSpaceships [

	fuelTanks := aCollectionOfSpaceships collect: [ :spaceship |
		             spaceship objectFuelTank ].

	dictionaryOfAllys := Dictionary new
]

{ #category : #action }
AllyTankManager >> spaceship: aSpaceship wantsToUse: anAmountOfFuel [

	| tankSpaceshipToMove tankAllySpaceship fuelToShare |
	(dictionaryOfAllys includesKey: aSpaceship) ifFalse: [ ^ self ].
	tankSpaceshipToMove := fuelTanks at: aSpaceship id.
	tankAllySpaceship := fuelTanks at: (dictionaryOfAllys at: aSpaceship)id.

	fuelToShare := (tankSpaceshipToMove loadedWith - anAmountOfFuel) abs.

	tankSpaceshipToMove loadedWith - anAmountOfFuel < 0 ifFalse: [
		^ self ].
	tankAllySpaceship useFuel: fuelToShare.
	tankSpaceshipToMove loadFuel: fuelToShare
]

{ #category : #'set and get' }
AllyTankManager >> stopAlly: aSpaceship [

	| ally |
	ally := dictionaryOfAllys at: aSpaceship.
	dictionaryOfAllys removeKey: aSpaceship.
	dictionaryOfAllys removeKey: ally
]
