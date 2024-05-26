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

	self assert: ((aSpaceship move: 1 on: aBoard) at: 1) equals: 2
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

	self assert: ((aSpaceship move: 1 on: aBoard) at: 1) equals: 3
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
	self assert: ((aSpaceship move: 2 on: aBoard) at: 1) equals: 3
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
	self assert: ((aSpaceship move: 1 on: aBoard) at: 1) equals: 4
]

{ #category : #id }
SpaceshipTest >> test007WhenOneSpaceshipIsInitializeThenTheIdIsOne [

	| aSpaceshipOne |
	aSpaceshipOne := Spaceship launchWithFuel: 4.
	Spaceship initialize.
	self assert: aSpaceshipOne getId equals: 1
]

{ #category : #id }
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

{ #category : #fuelTests }
SpaceshipTest >> test010WhenSpaceshipIsInitializeWithFuelThenAmountOfFuelStaysTheSame [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 6.
	Spaceship initialize.
	self assert: aSpaceship getFuel equals: 6
]

{ #category : #fuelTests }
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

{ #category : #fuelTests }
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

{ #category : #fuelTests }
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

{ #category : #fuelTests }
SpaceshipTest >> test014WhenSpaceshipMovesTheSameAsAmountOfFuelThenGoesBackToStart [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	aSpaceship move: 5 on: aBoard.
	Spaceship initialize.
	self assert: (aSpaceship position at: 1) equals: 1
]

{ #category : #fuelTests }
SpaceshipTest >> test015WhenSpaceshipLoadsFuelAfterLosingAllOfItThenFuelEqualsAmountLoaded [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	aSpaceship move: 5 on: aBoard.
	aSpaceship loadFuel: 5.
	Spaceship initialize.
	self assert: (aSpaceship getFuel) equals: 5
]

{ #category : #fuelTests }
SpaceshipTest >> test016WhenSpaceshipMovesAfterLoadingFuelThenMoves [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 10.
	aBoard := Board
		          ofCells: 20
		          numberOfLaps: 1
		          withWormholeBeginning: 18
		          andEnding: 19.
	aSpaceship move: 10 on: aBoard.
	aSpaceship loadFuel: 10.
	Spaceship initialize.
	self assert: ((aSpaceship move: 8 on: aBoard) at: 1) equals: 9
]

{ #category : #fuelTests }
SpaceshipTest >> test017WhenSpaceshipMovesMoreThanAmountOfCellsThenPositionGoesToAnotherLap [

	| aSpaceship aBoard finalPosition |
	aSpaceship := Spaceship launchWithFuel: 40.
	aBoard := Board
		          ofCells: 10
		          numberOfLaps: 2
		          withWormholeBeginning: 2
		          andEnding: 3.
	finalPosition := OrderedCollection with: 1 with: 2.
	Spaceship initialize.
	self assert: (aSpaceship move: 10 on: aBoard) equals: finalPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test018SpaceshipEntersBlackHoleThenReturnsMinusFourPositions [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: BlackHole new
		                                      with: 10.
	aSpaceship := Spaceship launchWithFuel: 40.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 15
		          numberOfLaps: 1
		          withWormholeSides: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	finalPosition := OrderedCollection with: 6 with: 1.
	Spaceship initialize.
	self assert: (aSpaceship move: 9 on: aBoard) equals: finalPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test019SpaceshipEnterOnBlackHoleThenLosesFuelNumberOfMovementsPlusFour [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: BlackHole new
		                                      with: 10.
	aSpaceship := Spaceship launchWithFuel: 40.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 15
		          numberOfLaps: 1
		          withWormholeSides: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	finalPosition := OrderedCollection with: 6 with: 1.
	aSpaceship move: 9 on: aBoard.
	Spaceship initialize.
	self assert: (aSpaceship getFuel) equals: 27
]

{ #category : #fuelTests }
SpaceshipTest >> test020SpaceshipMovesAfterLoadingFuelThenItMovesToThatPosition [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: BlackHole new
		                                      with: 4.
	aSpaceship := Spaceship launchWithFuel: 10.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 10
		          numberOfLaps: 2
		          withWormholeSides: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	aSpaceship move: 5 on: aBoard.
	aSpaceship move: 4 on: aBoard.
	aSpaceship loadFuel: 10.
	aSpaceship move: 1 on: aBoard.
	finalPosition := OrderedCollection with: 6 with: 2.
	Spaceship initialize.
	self assert: (aSpaceship move: 5 on: aBoard) equals: finalPosition
]
