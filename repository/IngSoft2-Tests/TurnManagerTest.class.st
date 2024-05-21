Class {
	#name : #TurnManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TurnManagerTest >> test01OneSpaceshipsThenTurnOneReturnsSpaceshipOne [

	| aTurnManager spaceshipOne collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := OrderedCollection with: spaceshipOne.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.

	self assert: aTurnManager nextTurn equals: spaceshipOne
]

{ #category : #tests }
TurnManagerTest >> test02TwoSpaceshipsThenTurnTwoReturnsSpaceshipTwo [

	| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	spaceshipTwo := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := OrderedCollection
		                          with: spaceshipOne
		                          with: spaceshipTwo.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.

	self assert: aTurnManager nextTurn equals: spaceshipTwo
]

{ #category : #tests }
TurnManagerTest >> test03WhenRoundIsOverNextTurnIsTheFirstSpaceship [

	| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	spaceshipTwo := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := OrderedCollection
		                          with: spaceshipOne
		                          with: spaceshipTwo.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	self assert: aTurnManager nextTurn equals: spaceshipOne
]

{ #category : #tests }
TurnManagerTest >> testTurnManagerWithSpaceshipWithIdNextTurnReturnsId [

	| aTurnManager aSpaceship |
	aSpaceship := Spaceship launch.
	aTurnManager := TurnManager manage: aSpaceship asOrderedCollection.

	self assert: aTurnManager nextTurn equals: aSpaceship
]

{ #category : #tests }
TurnManagerTest >> testWhenRoundIsOverNextTurnIsTheFirstSpaceship [

	| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
	spaceshipOne := Spaceship launch.
	spaceshipTwo := Spaceship launch.
	collectionOfSpaceships := OrderedCollection
		                          with: spaceshipOne
		                          with: spaceshipTwo.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	self assert: aTurnManager nextTurn equals: spaceshipOne
]

{ #category : #tests }
TurnManagerTest >> testWithSpaceshipWithoutIdReturnsTheSpaceship [

	| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
	spaceshipOne := Spaceship launch.
	spaceshipTwo := Spaceship launch.
	collectionOfSpaceships := OrderedCollection
		                          with: spaceshipOne
		                          with: spaceshipTwo.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	self assert: aTurnManager nextTurn equals: spaceshipOne
]

{ #category : #tests }
TurnManagerTest >> testWithTwoSpaceshipsReturnNextId [

	| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
	spaceshipOne := Spaceship launch.
	spaceshipTwo := Spaceship launch.
	collectionOfSpaceships := OrderedCollection
		                          with: spaceshipOne
		                          with: spaceshipTwo.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.

	self assert: aTurnManager nextTurn equals: spaceshipTwo
]
