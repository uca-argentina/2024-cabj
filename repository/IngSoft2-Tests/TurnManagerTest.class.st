Class {
	#name : #TurnManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TurnManagerTest >> test01OneSpaceshipsThenTurnOneReturnsSpaceshipOne [

	| aTurnManager spaceshipOne collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 1
		                          withAmountOfFuel: 5
		                          indexCalculateWith: 10.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.

	Spaceship initialize.
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

	Spaceship initialize.
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

	Spaceship initialize.

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
	aTurnManager lostTurns: 2 by: spaceshipOne.
	aTurnManager nextTurn.

	Spaceship initialize.
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
	aTurnManager lostTurns: 2 by: spaceshipOne.
	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: spaceshipOne
]

{ #category : #tests }
TurnManagerTest >> test06WhenEverySpaceshipsLosesTheirTurnThenReturnAnAllShipsDisabledHandler [

	| aTurnManager spaceshipOne collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := OrderedCollection with: spaceshipOne.
	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager lostTurns: 2 by: spaceshipOne.

	Spaceship initialize.
	self assert:
		(aTurnManager nextTurn isKindOf: AllShipsDisabledHandler)
]

{ #category : #tests }
TurnManagerTest >> test07WhenSpaceshipLostTwoTurnsIsCalledTwiceAndTwoTurnsPassThenSpaceshipRecoversTurn [

	| aTurnManager spaceshipOne collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := OrderedCollection with: spaceshipOne.
	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager lostTurns: 2 by: spaceshipOne.
	aTurnManager lostTurns: 2 by: spaceshipOne.
	aTurnManager lostTurns: 2 by: spaceshipOne.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: spaceshipOne
]

{ #category : #tests }
TurnManagerTest >> test08OneSpaceshipLostOneTurnAndThenRecoversIt [

	| aTurnManager spaceshipOne collectionOfSpaceships |
	spaceshipOne := Spaceship launchWithFuel: 5.
	collectionOfSpaceships := OrderedCollection with: spaceshipOne.
	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager lostTurns: 1 by: spaceshipOne.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: spaceshipOne
]
