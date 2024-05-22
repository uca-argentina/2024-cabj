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
TurnManagerTest >> test04WhenSpaceshipOneLosesTurnsTheNextTurnIsSpaceshipTwo [

	| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	spaceshipTwo := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := OrderedCollection
		                          with: spaceshipOne
		                          with: spaceshipTwo.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.
	aTurnManager lostTwoTurns: spaceshipOne .
	aTurnManager nextTurn.

	self assert: aTurnManager nextTurn equals: spaceshipTwo
]

{ #category : #tests }
TurnManagerTest >> test05WhenSpaceshipOneLosesTwoTurnsThenSpaceshipTwoPlaysThem [

	| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	spaceshipTwo := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := OrderedCollection
		                          with: spaceshipOne
		                          with: spaceshipTwo.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.
	aTurnManager lostTwoTurns: spaceshipOne .
	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	self assert: aTurnManager nextTurn equals: spaceshipOne
]

{ #category : #tests }
TurnManagerTest >> test06WhenEverySpaceshipsLosesTheirTurnThenReturnAnAllShipsDisabledHandler [

	| aTurnManager spaceshipOne collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := OrderedCollection
		                          with: spaceshipOne.
	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager lostTwoTurns: spaceshipOne .

	self assert: (aTurnManager nextTurn isKindOf: AllShipsDisabledHandler )
]
