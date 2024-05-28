Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

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
