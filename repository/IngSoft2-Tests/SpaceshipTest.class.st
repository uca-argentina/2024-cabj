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
			at: ((cellAndPosition at: 2) )
			put:
			((cellAndPosition at: 1) initializePosition:
				( (cellAndPosition at: 2)  )) ].
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
	aSpaceship objectPosition setIndexWith: 20.
	self assert: ((aSpaceship move: 1 on: aBoard) cell) equals: 2
]

{ #category : #move }
SpaceshipTest >> test002SpaceshipMovesTwiceAndIsInPositionThree [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition setIndexWith: 20.
	Spaceship initialize.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard.
	self assert: (aSpaceship move: 1 on: aBoard) cell equals: 3
]

{ #category : #tests }
SpaceshipTest >> test004WhenSpaceshipMovesTwiceThenPositionIsCellThreeAndLap1 [

	| aSpaceship aBoard collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition setIndexWith: 20.
	collectionOfPosition := Position startGame.
	collectionOfPosition setCell: 3.
	collectionOfPosition setLap: 1.
	Spaceship initialize.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard.
	aSpaceship move: 1 on: aBoard.
	self assert: aSpaceship objectPosition getPosition equals: collectionOfPosition getPosition
]

{ #category : #move }
SpaceshipTest >> test005WhenASpaceshipMovesTwiceWithTwoJumps [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition setIndexWith: 20.
	Spaceship initialize.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard.
	self assert: ((aSpaceship move: 1 on: aBoard) cell) equals: 3
]

{ #category : #move }
SpaceshipTest >> test006WhenSpaceshipMovesTwoTimesAndOneTimeThenPositionIsFour [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition setIndexWith: 20.
	Spaceship initialize.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 2 on: aBoard.
	self assert: ((aSpaceship move: 1 on: aBoard) cell) equals: 4
]

{ #category : #'tests - initialization' }
SpaceshipTest >> test007WhenOneSpaceshipIsInitializeThenTheIdIsOne [ 

	| aSpaceshipOne |
	aSpaceshipOne := Spaceship launchWithFuel: 4.
	Spaceship initialize.
	self assert: aSpaceshipOne getId equals: 1
]

{ #category : #'tests - initialization' }
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
	aSpaceship objectPosition setIndexWith: 20.
	collectionOfPosition := Position startGame.
	collectionOfPosition setCell: 1.
	collectionOfPosition setLap: 1.
	Spaceship initialize.
	self assert: aSpaceship objectPosition getPosition equals: collectionOfPosition getPosition
]

{ #category : #'tests - initialization' }
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
	aSpaceship objectPosition setIndexWith: 20.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard.
	Spaceship initialize.
	self assert: aSpaceship getFuel equals: 4
]

{ #category : #fuelTests }
SpaceshipTest >> test012SpaceshipMovesMoreThanOneCellThenFuelWasteNumberOfMovements [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 10.
	aSpaceship objectPosition setIndexWith: 20.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 7 on: aBoard.
	Spaceship initialize.
	self assert: aSpaceship getFuel equals: 3
]

{ #category : #fuelTests }
SpaceshipTest >> test013SpaceshipsTriesToMoveMoreThanFuelThenOnlyMovesTheFuelItHas [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition setIndexWith: 20.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 6 on: aBoard.
	Spaceship initialize.
	self assert: (aSpaceship objectPosition cell) equals: 1
]

{ #category : #fuelTests }
SpaceshipTest >> test014WhenSpaceshipMovesTheSameAsAmountOfFuelThenGoesBackToStart [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition setIndexWith: 20.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 5 on: aBoard.
	Spaceship initialize.
	self assert: (aSpaceship objectPosition cell) equals: 1
]

{ #category : #fuelTests }
SpaceshipTest >> test015WhenSpaceshipLoadsFuelAfterLosingAllOfItThenFuelEqualsAmountLoaded [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition setIndexWith: 20.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard.
	aSpaceship loadFuel: 5.
	Spaceship initialize.
	self assert: (aSpaceship getFuel) equals: 5
]

{ #category : #fuelTests }
SpaceshipTest >> test016WhenSpaceshipMovesAfterLoadingFuelThenMoves [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 10.
	aSpaceship objectPosition setIndexWith: 20.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 1 on: aBoard.
	aSpaceship loadFuel: 10.
	Spaceship initialize.
	self assert: ((aSpaceship move: 8 on: aBoard) cell) equals: 10
]

{ #category : #fuelTests }
SpaceshipTest >> test017WhenSpaceshipMovesMoreThanAmountOfCellsThenPositionGoesToAnotherLap [

	| aSpaceship aBoard collectionOfPosition |
	aSpaceship := Spaceship launchWithFuel: 40.
	aSpaceship objectPosition setIndexWith: 10.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 10 2 )
		          withWormhole: #( 2 3 ).
	collectionOfPosition := Position startGame.
	collectionOfPosition setCell: 1.
	collectionOfPosition setLap: 2.
	Spaceship initialize.
	self assert: (aSpaceship move: 10 on: aBoard) getPosition equals: collectionOfPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test018SpaceshipEntersBlackHoleThenReturnsMinusFourPositions [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: BlackHoleCell new
		                                      with: 10.
	aSpaceship := Spaceship launchWithFuel: 40.
	aSpaceship objectPosition setIndexWith: 15.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 15 1 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	finalPosition := Position startGame.
	finalPosition setCell: 6.
	finalPosition setLap: 1.
	Spaceship initialize.
	self assert: (aSpaceship move: 9 on: aBoard) getPosition equals: finalPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test019SpaceshipEnterOnBlackHoleThenLosesFuelNumberOfMovementsPlusFour [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: BlackHoleCell new
		                                      with: 10.
	aSpaceship := Spaceship launchWithFuel: 40.
	aSpaceship objectPosition setIndexWith: 15.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 15 1 )
		          withWormhole: #( 2 3 )
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
		                                      with: BlackHoleCell new
		                                      with: 4.
	aSpaceship := Spaceship launchWithFuel: 10.
	aSpaceship objectPosition setIndexWith: 10.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 10 2 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	aSpaceship move: 5 on: aBoard.
	aSpaceship move: 4 on: aBoard.
	aSpaceship loadFuel: 10.
	aSpaceship move: 1 on: aBoard.
	finalPosition := Position startGame.
	finalPosition setCell: 6.
	finalPosition setLap: 2.
	Spaceship initialize.
	self
		assert: (aSpaceship move: 5 on: aBoard) getPosition
		equals: finalPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test024SpaceshipGoesBackToStartReloadsFuelAndMovesThenCellEqualsMovement [

	| aSpaceship aBoard |
	aSpaceship := Spaceship launchWithFuel: 5.
	aSpaceship objectPosition setIndexWith: 20.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 18 19 ).
	aSpaceship move: 3 on: aBoard.
	aSpaceship move: 2 on: aBoard.
	aSpaceship loadFuel: 5.
	aSpaceship move: 4 on: aBoard.
	Spaceship initialize.
	self assert: (aSpaceship objectPosition cell) equals: 5
]

{ #category : #fuelTests }
SpaceshipTest >> test025SpaceshipEnterHyperGravityAndDoesntRollValueThenStaysThere [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: (HyperGravityCell withValueToMove: 5 inPosition: 10)
		                                      with: 10.
	aSpaceship := Spaceship launchWithFuel: 60.
	aSpaceship objectPosition setIndexWith: 20.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 3 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	
	finalPosition := Position startGame.
	finalPosition setCell: 10.
	finalPosition setLap: 1 .
	aSpaceship move: 9 on: aBoard.
	Spaceship initialize.
	self assert: (aSpaceship move: 4 on: aBoard) getPosition equals: finalPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test026SpaceshipEntersHyperGravityAndRollsValueTheLeaves [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: (HyperGravityCell withValueToMove: 5 inPosition: 10)
		                                      with: 10.
	aSpaceship := Spaceship launchWithFuel: 60.
	aSpaceship objectPosition setIndexWith: 20.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 3 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	
	finalPosition := Position startGame.
	finalPosition setCell: 16.
	finalPosition setLap: 1 .
	aSpaceship move: 9 on: aBoard.
	Spaceship initialize.
	self assert: (aSpaceship move: 6 on: aBoard) getPosition equals: finalPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test027SpacceshipEntersHyperJumpThenPositionEqulasParsecMovement [

	| aSpaceship aBoard finalPosition collectionOfSpecialCellAndPosition |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: (HyperJumpCell
				                                       withPosition: 5
				                                       Parsecs:
				                                       (Parsecs
					                                        totalCells: 10
					                                        convertionValue: 5)
				                                       andValues: #( 2 1 ))
		                                      with: 5.
	aSpaceship := Spaceship launchWithFuel: 60.
	aSpaceship objectPosition setIndexWith: 10.
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 10 3 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.

	finalPosition := Position startGame.
	finalPosition setCell: 9.
	finalPosition setLap: 1.
	Spaceship initialize.
	self
		assert: (aSpaceship move: 4 on: aBoard) getPosition
		equals: finalPosition getPosition
]

{ #category : #fuelTests }
SpaceshipTest >> test028SpaceshipEntersHyperJumpAfterAnotherOneThenMovesSecondValueAndCompletesOneLap [

	| aBoard finalPosition collectionOfSpecialCellAndPosition aSpaceshipOne aSpaceshipTwo |
	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: (HyperJumpCell
				                                       withPosition: 9
				                                       Parsecs:
				                                       (Parsecs
					                                        totalCells: 10
					                                        convertionValue: 100)
				                                       andValues: #( 50 40 ))
		                                      with: 9.
		
	aSpaceshipOne := Spaceship launchWithFuel: 60.
	aSpaceshipTwo := Spaceship launchWithFuel: 60.
	aSpaceshipOne objectPosition setIndexWith: 10.
	aSpaceshipTwo objectPosition setIndexWith: 10.
	
	aBoard := self
		          createdBoardOfCellsAndLaps: #( 10 3 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	
	aSpaceshipOne move: 8 on: aBoard.

	finalPosition := Position startGame.
	finalPosition setCell: 3.
	finalPosition setLap: 2.
	Spaceship initialize.
	self
		assert: (aSpaceshipTwo move: 8 on: aBoard) getPosition
		equals: finalPosition getPosition
]
