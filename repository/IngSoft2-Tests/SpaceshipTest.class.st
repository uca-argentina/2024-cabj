Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #board }
SpaceshipTest >> createdBoardOfCellsAndLaps: anAmountOfCellsAndLaps withWormhole: startAndEnd [

	| aBoard amountOfCells numberOfLaps start end adjustMovementByLap currentLap |
	amountOfCells := anAmountOfCellsAndLaps at: 1.
	numberOfLaps := anAmountOfCellsAndLaps at: 2.
	start := startAndEnd at: 1.
	end := startAndEnd at: 2.
	aBoard := OrderedCollection new.
	1 to: amountOfCells * numberOfLaps do: [ :index |
		currentLap := (index-1) // amountOfCells.
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
	^ aBoard
]

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
			at: (cellAndPosition at: 2)
			put:
			((cellAndPosition at: 1) initializePosition:
				 (cellAndPosition at: 2)) ].
	^ aBoard
]

{ #category : #move }
SpaceshipTest >> test001SpaceshipInitializeInPositionOneAndMovesOneTimeThenIsInPositionTwo [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	self assert: ((aSpaceship move: 1 on: aBoard of: 20) cell) equals: 2
]

{ #category : #move }
SpaceshipTest >> test002SpaceshipMovesTwiceAndIsInPositionThree [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard of: 20.

	self assert: ((aSpaceship move: 1 on: aBoard of: 20) cell) equals: 3
]

{ #category : #tests }
SpaceshipTest >> test004WhenSpaceshipMovesTwiceThenPositionIsCellThreeAndLap1 [

	| aSpaceship aBoard collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 5.
	collectionOfPosition := Position startGame.
	collectionOfPosition setCell: 3.
	collectionOfPosition setLap: 1.
	Spaceship initialize.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard of: 20.
	aSpaceship move: 1 on: aBoard of: 20.
	self assert: aSpaceship objectPosition getPosition equals: collectionOfPosition getPosition
]

{ #category : #move }
SpaceshipTest >> test005WhenASpaceshipMovesTwiceWithTwoJumps [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard of: 20.
	self assert: ((aSpaceship move: 1 on: aBoard of: 20) cell) equals: 3
]

{ #category : #move }
SpaceshipTest >> test006WhenSpaceshipMovesTwoTimesAndOneTimeThenPositionIsFour [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	Spaceship initialize.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 2 on: aBoard of: 20.
	self assert: ((aSpaceship move: 1 on: aBoard of: 20) cell) equals: 4
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test009WhenSpaceshipIsLaunchedThenStartsOnCellOneAndLapOne [

	| aSpaceship collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 5.
	collectionOfPosition := Position startGame.
	collectionOfPosition setCell: 1.
	collectionOfPosition setLap: 1.
	Spaceship initialize.
	self assert: aSpaceship objectPosition getPosition equals: collectionOfPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test011WhenSpaceshipMovesOnceThenFuelIsOneLessThanInitializeWith [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard of: 20.
	Spaceship initialize.
	self assert: aSpaceship getFuel equals: 4
]

{ #category : #fuelTests }
SpaceshipTest >> test012SpaceshipMovesMoreThanOneCellThenFuelWasteNumberOfMovements [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 10.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 7 on: aBoard of: 20.
	Spaceship initialize.
	self assert: aSpaceship getFuel equals: 3
]

{ #category : #fuelTests }
SpaceshipTest >> test013SpaceshipsTriesToMoveMoreThanFuelThenOnlyMovesTheFuelItHas [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 6 on: aBoard of: 20.
	Spaceship initialize.
	self assert: (aSpaceship objectPosition cell) equals: 1
]

{ #category : #fuelTests }
SpaceshipTest >> test014WhenSpaceshipMovesTheSameAsAmountOfFuelThenGoesBackToStart [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 5 on: aBoard of: 20.
	Spaceship initialize.
	self assert: (aSpaceship objectPosition cell) equals: 1
]

{ #category : #fuelTests }
SpaceshipTest >> test015WhenSpaceshipLoadsFuelAfterLosingAllOfItThenFuelEqualsAmountLoaded [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard of: 20.
	aSpaceship loadFuel: 5.
	Spaceship initialize.
	self assert: (aSpaceship getFuel) equals: 5
]

{ #category : #fuelTests }
SpaceshipTest >> test016WhenSpaceshipMovesAfterLoadingFuelThenMoves [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 10.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard of: 20.
	aSpaceship loadFuel: 10.
	Spaceship initialize.
	self assert: ((aSpaceship move: 8 on: aBoard of: 20) cell) equals: 10
]

{ #category : #fuelTests }
SpaceshipTest >> test017WhenSpaceshipMovesMoreThanAmountOfCellsThenPositionGoesToAnotherLap [

	| aSpaceship aBoard collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 40.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 10 2 )
		          withWormhole: #( 2 3 ).
	collectionOfPosition := Position startGame.
	collectionOfPosition setCell: 1.
	collectionOfPosition setLap: 2.
	Spaceship initialize.
	self assert: (aSpaceship move: 10 on: aBoard of: 10) getPosition equals: collectionOfPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test018SpaceshipEntersBlackHoleThenReturnsMinusFourPositions [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: BlackHoleCell new
		                                      with: 10.
	aSpaceship := Spaceship launchWithFuel: 40.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 15 1 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	finalPosition := Position startGame.
	finalPosition setCell: 6.
	finalPosition setLap: 1.
	Spaceship initialize.
	self assert: (aSpaceship move: 9 on: aBoard of: 15) getPosition equals: finalPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test019SpaceshipEnterOnBlackHoleThenLosesFuelNumberOfMovementsPlusFour [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: BlackHoleCell new
		                                      with: 10.
	aSpaceship := Spaceship launchWithFuel: 40.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 15 1 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	finalPosition := OrderedCollection with: 6 with: 1.
	aSpaceship move: 9 on: aBoard of: 15.
	Spaceship initialize.
	self assert: (aSpaceship getFuel) equals: 27
]

{ #category : #fuelTests }
SpaceshipTest >> test020SpaceshipMovesAfterLoadingFuelThenItMovesToThatPosition [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: BlackHoleCell new
		                                      with: 4.
	aSpaceship := Spaceship launchWithFuel: 10.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 10 2 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	aSpaceship move: 5 on: aBoard of: 10.
	aSpaceship move: 4 on: aBoard of: 10.
	aSpaceship loadFuel: 10.
	aSpaceship move: 1 on: aBoard of: 10.
	finalPosition := Position startGame.
	finalPosition setCell: 6.
	finalPosition setLap: 2.
	Spaceship initialize.
	self assert: (aSpaceship move: 5 on: aBoard of: 10) getPosition equals: finalPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test021WhenASpaceshipFallsInTheAtomicBombCellThenReturnsToThePositionOne [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: AtomicBombCell  new
		                                      with: 10.
	aSpaceship := Spaceship launchWithFuel: 60.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 2 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	
	finalPosition := Position startGame.
	finalPosition setCell: 1.
	finalPosition setLap: 1 .
	Spaceship initialize.
	self assert: (aSpaceship move: 9 on: aBoard of: 20) getPosition equals: finalPosition getPosition
]
