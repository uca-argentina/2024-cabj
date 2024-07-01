Class {
	#name : #TurnManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TurnManagerTest >> test01OneSpaceshipsThenTurnOneReturnsSpaceshipOne [

	| aTurnManager collectionOfSpaceships |
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 1
		                          withAmountOfFuel: 5.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: 1
]

{ #category : #tests }
TurnManagerTest >> test02TwoSpaceshipsThenTurnTwoReturnsSpaceshipTwo [

	| aTurnManager collectionOfSpaceships |
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 2
		                          withAmountOfFuel: 5.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: 2
]

{ #category : #tests }
TurnManagerTest >> test03WhenRoundIsOverNextTurnIsTheFirstSpaceship [

	| aTurnManager collectionOfSpaceships |
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 2
		                          withAmountOfFuel: 5.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	Spaceship initialize.

	self assert: aTurnManager nextTurn equals: 1
]

{ #category : #tests }
TurnManagerTest >> test04WhenSpaceshipOneLosesTurnsTheNextTurnIsSpaceshipTwo [

	| aTurnManager collectionOfSpaceships |
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 2
		                          withAmountOfFuel: 5.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.
	aTurnManager lostTurns: 2 by: 1.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: 2
]

{ #category : #tests }
TurnManagerTest >> test05WhenSpaceshipOneLosesTwoTurnsThenSpaceshipTwoPlaysThem [

	| aTurnManager collectionOfSpaceships |
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 2
		                          withAmountOfFuel: 5.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.
	aTurnManager lostTurns: 2 by: 1.
	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: 1
]

{ #category : #tests }
TurnManagerTest >> test06WhenEverySpaceshipsLosesTheirTurnThenReturnAnAllShipsDisabledHandler [

	| aTurnManager collectionOfSpaceships |
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 1
		                          withAmountOfFuel: 5.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager lostTurns: 2 by: 1.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: 1
]

{ #category : #tests }
TurnManagerTest >> test07WhenSpaceshipLostTwoTurnsIsCalledTwiceAndTwoTurnsPassThenSpaceshipRecoversTurn [

	| aTurnManager collectionOfSpaceships |
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 1
		                          withAmountOfFuel: 5.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager lostTurns: 2 by: 1.
	aTurnManager lostTurns: 2 by: 1.
	aTurnManager lostTurns: 2 by: 1.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: 1
]

{ #category : #tests }
TurnManagerTest >> test08OneSpaceshipLostOneTurnAndThenRecoversIt [

	| aTurnManager collectionOfSpaceships |
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 2
		                          withAmountOfFuel: 5.

	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager lostTurns: 1 by: 1.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager nextTurn equals: 1
]

{ #category : #tests }
TurnManagerTest >> test09TurnManagerNextTurnIsSpaceshipOneThenSpaceshipPlayingIsOne [

	| aTurnManager collectionOfSpaceships |
	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: 2
		                          withAmountOfFuel: 5.


	aTurnManager := TurnManager manage: collectionOfSpaceships.
	aTurnManager nextTurn.

	Spaceship initialize.
	self assert: aTurnManager spaceshipPlaying equals: 1
]
