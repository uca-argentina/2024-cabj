Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
BoardTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
BoardTest >> test001WhenBoardInitializeWithThreeCellsThenFinishesOnThree [

	| aBoard lastPosition |
	aBoard := Board
		          ofCells: 3
		          numberOfLaps: 1
		          withWormholeBeginning: 1
		          andEnding: 2.
	lastPosition := OrderedCollection with: 3 with: 1.
	self assert: aBoard finishLine equals: lastPosition
]

{ #category : #'tests - initialization' }
BoardTest >> test002BoardCannotBeCreatedWithOneCell [

	self
		should: [
			Board
				ofCells: 1
				numberOfLaps: 1
				withWormholeBeginning: 2
				andEnding: 10 ]
		raise: Error
		withMessage: 'A Board must have more than one cell.'
]

{ #category : #'tests - initialization' }
BoardTest >> test003BoardCannotBeCreatedWithNegativeCells [

	self
		should: [
			Board
				ofCells: -1
				numberOfLaps: 1
				withWormholeBeginning: 2
				andEnding: 10 ]
		raise: Error
		withMessage: 'A Board must have more than one cell.'
]

{ #category : #tests }
BoardTest >> test004BoardFinishLineEqualsAmountOfCellsInitializeWith [

	| aBoard lastPosition |
	aBoard := Board
		          ofCells: 4
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 3.
	lastPosition := OrderedCollection with: 4 with: 1.
	self assert: aBoard finishLine equals: lastPosition 
]

{ #category : #wormhole }
BoardTest >> test005BoardCreatedWithWormholeEntersOnTheEndReturnsBeginning [

	| aBoard |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.

	self assert: (aBoard enter: 10) equals: 2
]

{ #category : #wormhole }
BoardTest >> test006BoardCreatedWithWormholeEntersOnTheBeginningReturnsTheEnd [

	| aBoard |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.

	self assert: (aBoard enter: 2) equals: 10
]

{ #category : #wormhole }
BoardTest >> test007WhenPositionIsNotWormholeThenItStaysTheSame [

	| aBoard |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.

	self assert: (aBoard enter: 5) equals: 5
]

{ #category : #legalMove }
BoardTest >> test008BoardRecivesLegalMoveAndStaysTheSame [

	| aBoard aStartingPosition |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.
	aStartingPosition := OrderedCollection with: 1 with: 1.

	self
		assert: (aBoard adjustMovementWithinBoundsFrom: aStartingPosition by: 8)
		equals: 8
]

{ #category : #legalMove }
BoardTest >> test009BoardRecivesIlegalPositionAndReturnsFinishLine [

	| aBoard aStartingPosition |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.
	aStartingPosition := OrderedCollection with: 10 with: 1.

	self
		assert: (aBoard adjustMovementWithinBoundsFrom: aStartingPosition by: 3)
		equals: 1
]

{ #category : #legalMove }
BoardTest >> test010IlegalMoveIfThereWasOneLapIsNowLegalBeacuseThereIsMoreThanOneLap [

	| aBoard aStartingPosition |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 2
		          withWormholeBeginning: 2
		          andEnding: 10.
	aStartingPosition := OrderedCollection with: 10 with: 1.

	self
		assert:
		(aBoard adjustMovementWithinBoundsFrom: aStartingPosition by: 3)
		equals: 3
]

{ #category : #legalMove }
BoardTest >> test011WormholeEndMustBeGreaterThanBeginning [

	| aBoard |
	self
		should: [
			aBoard := Board
				          ofCells: 8
				          numberOfLaps: 1
				          withWormholeBeginning: 7
				          andEnding: 2 ]
		raise: Error
		withMessage: 'The ending must be greater than the beginning'
]

{ #category : #legalMove }
BoardTest >> test012WhenABoardInitializesWithOneLapThenTheNumberOfLapsIsOne [

	| aBoard |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.

	self assert: aBoard getLap equals: 1
]

{ #category : #legalMove }
BoardTest >> test013WhenEnterRecivesNumberGreaterThanAmountOfCellsThenEnterOnNextLap [

	| aBoard |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 2
		          withWormholeBeginning: 2
		          andEnding: 10.

	self assert: (aBoard enter: 12) equals: 1
]
