Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #board }
SpaceshipTest >> createdBoardOfCellsAndLaps: anAmountOfCellsAndLaps withWormhole: startAndEnd withSpecialCellOn: cellAndPosition [

	| aBoard amountOfCells numberOfLaps start end adjustMovementByLap currentLap |
	amountOfCells := anAmountOfCellsAndLaps at: 1.
	numberOfLaps := anAmountOfCellsAndLaps at: 2.
	start := startAndEnd at: 1.
	end := startAndEnd at: 2.
	aBoard := OrderedCollection new.
	1 to: amountOfCells * numberOfLaps do: [ :index |
		currentLap := index - 1 // amountOfCells.
		aBoard add:
			(RegularCell position: index - (amountOfCells * currentLap)) ].

	1 to: numberOfLaps do: [ :lap |
		adjustMovementByLap := amountOfCells * (lap - 1).
		aBoard
			at: start + adjustMovementByLap
			put: (RegularCell position: end + adjustMovementByLap).
		aBoard
			at: end + adjustMovementByLap
			put: (RegularCell position: start + adjustMovementByLap) ].

	1 to: numberOfLaps do: [ :lap |
		aBoard
			at: ((cellAndPosition at: 2) )
			put:
			((cellAndPosition at: 1) initializePosition:
				( (cellAndPosition at: 2)  )) ].
	^ aBoard
]

{ #category : #move }
SpaceshipTest >> test001SpaceshipInitializeInPositionOneAndMovesOneTimeThenIsInPositionTwo [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	aSpaceship objectPosition updateIndexWith: 20.
	aSpaceship move: 1.
	self assert: aSpaceship objectPosition cell equals: 2
]

{ #category : #move }
SpaceshipTest >> test002SpaceshipMovesTwiceAndIsInPositionThree [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	Spaceship initialize.
	aSpaceship move: 2.
	self assert: aSpaceship objectPosition cell equals: 3
]

{ #category : #tests }
SpaceshipTest >> test004WhenSpaceshipMovesTwiceThenPositionIsCellThreeAndLap1 [

	| aSpaceship collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	collectionOfPosition := OrderedCollection with: 3 with: 1.
	Spaceship initialize.
	aSpaceship move: 2.
	self
		assert: aSpaceship objectPosition position
		equals: collectionOfPosition
]

{ #category : #move }
SpaceshipTest >> test005WhenASpaceshipMovesTwiceWithTwoJumps [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	Spaceship initialize.
	aSpaceship move: 1.
	aSpaceship move: 1.
	self assert: aSpaceship objectPosition cell equals: 3
]

{ #category : #move }
SpaceshipTest >> test006WhenSpaceshipMovesTwoTimesAndOneTimeThenPositionIsFour [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	Spaceship initialize.
	aSpaceship move: 2.
	aSpaceship move: 1.
	self assert: aSpaceship objectPosition cell equals: 4
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test007WhenOneSpaceshipIsInitializeThenTheIdIsOne [ 

	| aSpaceshipOne |
	aSpaceshipOne := Spaceship launchWithFuel: 4.
	Spaceship initialize.
	self assert: aSpaceshipOne id equals: 1
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test008WhenTwoSpaceshipsAreLaunchedThenSpaceshipTwoIdEqualsTwo [ 

	| aSpaceshipOne aSpaceshipTwo |
	aSpaceshipOne := Spaceship launchWithFuel: 4.
	aSpaceshipTwo := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	self assert: aSpaceshipTwo id equals: 2
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test009WhenSpaceshipIsLaunchedThenStartsOnCellOneAndLapOne [

	| aSpaceship collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	collectionOfPosition := Position startGame.
	Spaceship initialize.
	self assert: aSpaceship objectPosition position equals: collectionOfPosition position
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test010WhenSpaceshipIsInitializeWithFuelThenAmountOfFuelStaysTheSame [ 

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 6.
	Spaceship initialize.
	self assert: aSpaceship amountOfFuel equals: 6
]

{ #category : #fuelTests }
SpaceshipTest >> test011WhenSpaceshipMovesOnceThenFuelIsOneLessThanInitializeWith [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	aSpaceship move: 1.
	Spaceship initialize.
	self assert: aSpaceship amountOfFuel equals: 4
]

{ #category : #fuelTests }
SpaceshipTest >> test012SpaceshipMovesMoreThanOneCellThenFuelWasteNumberOfMovements [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 10.
	aSpaceship objectPosition updateIndexWith: 20.
	aSpaceship move: 7.
	Spaceship initialize.
	self assert: aSpaceship amountOfFuel equals: 3
]

{ #category : #fuelTests }
SpaceshipTest >> test013SpaceshipsTriesToMoveMoreThanFuelThenOnlyMovesTheFuelItHas [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	aSpaceship move: 6.
	Spaceship initialize.
	self assert: aSpaceship objectPosition cell equals: 1
]

{ #category : #fuelTests }
SpaceshipTest >> test014WhenSpaceshipMovesTheSameAsAmountOfFuelThenGoesBackToStart [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	aSpaceship move: 5.
	Spaceship initialize.
	self assert: aSpaceship objectPosition cell equals: 1
]

{ #category : #fuelTests }
SpaceshipTest >> test015WhenSpaceshipLoadsFuelAfterLosingAllOfItThenFuelEqualsAmountLoaded [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	aSpaceship move: 1.
	aSpaceship loadFuel: 1.
	Spaceship initialize.
	self assert: aSpaceship amountOfFuel equals: 5
]

{ #category : #fuelTests }
SpaceshipTest >> test016WhenSpaceshipMovesAfterLoadingFuelThenMoves [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 10.
	aSpaceship objectPosition updateIndexWith: 20.
	aSpaceship move: 1.
	aSpaceship loadFuel: 10.
	aSpaceship move: 8.
	Spaceship initialize.
	self assert: aSpaceship objectPosition cell equals: 10
]

{ #category : #move }
SpaceshipTest >> test017WhenSpaceshipMovesMoreThanAmountOfCellsThenPositionGoesToAnotherLap [

	| aSpaceship collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 40.
	aSpaceship objectPosition updateIndexWith: 10.
	collectionOfPosition := OrderedCollection with: 1 with: 2.

	aSpaceship move: 10.
	Spaceship initialize.
	self
		assert: aSpaceship objectPosition position
		equals: collectionOfPosition
]

{ #category : #specialCells }
SpaceshipTest >> test018SpaceshipMovesBackwardsThenPositionIsEqualToMovement [

	| aSpaceship finalPosition |
	finalPosition := OrderedCollection with: 6 with: 1.

	aSpaceship := Spaceship launchWithFuel: 40.
	aSpaceship objectPosition updateIndexWith: 15.

	aSpaceship move: 9.
	aSpaceship move: -4.
	Spaceship initialize.
	self
		assert: aSpaceship objectPosition position
		equals: finalPosition
]

{ #category : #specialCells }
SpaceshipTest >> test019SpaceshipMoveBackwardsThenUsesFuel [

	| aSpaceship |

	aSpaceship := Spaceship launchWithFuel: 40.
	aSpaceship objectPosition updateIndexWith: 15.

	aSpaceship move: 9.
	aSpaceship move: -4.
	Spaceship initialize.
	self assert: aSpaceship amountOfFuel equals: 27
]

{ #category : #fuelTests }
SpaceshipTest >> test020SpaceshipMovesAfterLoadingFuelThenItMovesToThatPosition [

	| aSpaceship finalPosition |

	aSpaceship := Spaceship launchWithFuel: 10.
	aSpaceship objectPosition updateIndexWith: 10.

	aSpaceship move: 5.
	aSpaceship move: 4.
	aSpaceship loadFuel: 10.
	aSpaceship move: 1.
	finalPosition := OrderedCollection with:6 with: 2.
	aSpaceship move: 5.
	Spaceship initialize.
	self
		assert: aSpaceship objectPosition position
		equals: finalPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test024SpaceshipGoesBackToStartReloadsFuelAndMovesThenCellEqualsMovement [

	| aSpaceship |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition updateIndexWith: 20.
	aSpaceship move: 3.
	aSpaceship move: 2.
	aSpaceship loadFuel: 5.
	aSpaceship move: 4.
	Spaceship initialize.
	self assert: aSpaceship objectPosition cell equals: 5
]

{ #category : #specialCells }
SpaceshipTest >> test025SpaceshipMovesBackwardsThenGoesBackOneLap [

	| aSpaceship finalPosition |

	aSpaceship := Spaceship launchWithFuel: 40.
	aSpaceship objectPosition updateIndexWith: 10.
	finalPosition := OrderedCollection with: 10 with: 1.
	aSpaceship move: 10.
	aSpaceship move: -1.
	Spaceship initialize.
	self assert: aSpaceship objectPosition position equals: finalPosition
]
