Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #move }
SpaceshipTest >> test001SpaceshipInitializeInPositionOneAndMovesOneTimeThenIsInPositionTwo [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.

	self assert: (aSpaceship move: 1 on: aBoard) equals: 2
]

{ #category : #move }
SpaceshipTest >> test002SpaceshipMovesTwiceAndIsInPositionThree [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	aSpaceship move: 1 on: aBoard.

	self assert: (aSpaceship move: 1 on: aBoard) equals: 3
]

{ #category : #tests }
SpaceshipTest >> test004WhenSpaceshipMovesTwiceThenPositionIsCellThreeAndLap1 [

	| aSpaceship aBoard collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 5.
	collectionOfPosition := OrderedCollection with: 3 with: 1.
	Spaceship initialize.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	aSpaceship move: 1 on: aBoard.
	aSpaceship move: 1 on: aBoard.
	self assert: aSpaceship position equals: collectionOfPosition
]

{ #category : #move }
SpaceshipTest >> test005WhenASpaceshipMovesTwiceWithTwoJumps [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	self assert: (aSpaceship move: 2 on: aBoard) equals: 3
]

{ #category : #move }
SpaceshipTest >> test006WhenSpaceshipMovesTwoTimesAndOneTimeThenPositionIsFour [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	aSpaceship move: 2 on: aBoard.
	self assert: (aSpaceship move: 1 on: aBoard) equals: 4
]

{ #category : #move }
SpaceshipTest >> test007WhenOneSpaceshipIsInitializeThenTheIdIsOne [

	| aSpaceshipOne |
	aSpaceshipOne := Spaceship launchWithFuel: 4.
	Spaceship initialize.
	self assert: aSpaceshipOne getId equals: 1
]

{ #category : #move }
SpaceshipTest >> test008WhenTwoSpaceshipsAreLaunchedThenSpaceshipTwoIdEqualsTwo [

	| aSpaceshipOne aSpaceshipTwo |
	aSpaceshipOne := Spaceship launchWithFuel: 4.
	aSpaceshipTwo := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	self assert: aSpaceshipTwo getId equals: 2
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test009WhenSpaceshipIsLaunchedThenStartsOnCellOneAndLapOne [

	| aSpaceship collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 5.
	collectionOfPosition := OrderedCollection with: 1 with: 1.
	Spaceship initialize.
	self assert: aSpaceship position equals: collectionOfPosition
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test010WhenSpaceshipIsInitializeWithFuelThenAmountOfFuelStaysTheSame [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 6.
	Spaceship initialize.
	self assert: aSpaceship getFuel equals: 6
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test011WhenSpaceshipMovesOnceThenFuelIsOneLessThanInitializeWith [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	aSpaceship move: 1 on: aBoard.
	Spaceship initialize.
	self assert: aSpaceship getFuel equals: 4
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test012SpaceshipMovesMoreThanOneCellThenFuelWasteNumberOfMovements [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 10.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	aSpaceship move: 7 on: aBoard.
	Spaceship initialize.
	self assert: aSpaceship getFuel equals: 3
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test013SpaceshipsTriesToMoveMoreThanFuelThenOnlyMovesTheFuelItHas [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	aSpaceship move: 10 on: aBoard.
	Spaceship initialize.
	self assert: (aSpaceship position at: 1) equals: 1
]
