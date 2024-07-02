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
AllyTankManager >> allyOf: aSpaceshipId [

	(dictionaryOfAllys includesKey: aSpaceshipId) ifFalse: [
		^ aSpaceshipId ].
	^ dictionaryOfAllys at: aSpaceshipId
]

{ #category : #initialization }
AllyTankManager >> initializeManage: aCollectionOfSpaceships [

	fuelTanks := aCollectionOfSpaceships collect: [ :spaceship |
		             spaceship objectFuelTank ].

	dictionaryOfAllys := Dictionary new
]

{ #category : #action }
AllyTankManager >> spaceship: aSpaceshipId wantsToUse: anAmountOfFuel [

	| tankSpaceshipToMove tankAllySpaceship fuelToShare |
	(dictionaryOfAllys includesKey: aSpaceshipId) ifFalse: [ ^ self ].
	tankSpaceshipToMove := fuelTanks at: aSpaceshipId.
	tankAllySpaceship := fuelTanks at:
		                     (dictionaryOfAllys at: aSpaceshipId).

	fuelToShare := (tankSpaceshipToMove loadedWith - anAmountOfFuel) abs.

	(tankSpaceshipToMove loadedWith - anAmountOfFuel) < 0 ifFalse: [ ^ self ].
	tankAllySpaceship useFuel: fuelToShare.
	tankSpaceshipToMove loadFuel: fuelToShare
]

{ #category : #'set and get' }
AllyTankManager >> stopAlly: aSpaceshipId [

	| ally |
	ally := dictionaryOfAllys at: aSpaceshipId.
	dictionaryOfAllys removeKey: aSpaceshipId.
	dictionaryOfAllys removeKey: ally
]
