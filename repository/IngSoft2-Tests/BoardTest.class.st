Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
BoardTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : #finishLine }
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

{ #category : #finishLine }
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

	| aBoard enterPosition finalPosition |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.
	enterPosition := OrderedCollection with: 10 with: 1.
	finalPosition := OrderedCollection with: 2 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]

{ #category : #wormhole }
BoardTest >> test006BoardCreatedWithWormholeEntersOnTheBeginningReturnsTheEnd [

	| aBoard enterPosition finalPosition |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.
	enterPosition := OrderedCollection with: 2 with: 1.
	finalPosition := OrderedCollection with: 10 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]

{ #category : #wormhole }
BoardTest >> test007WhenPositionIsNotWormholeThenItStaysTheSame [

	| aBoard enterPosition finalPosition |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.
	enterPosition := OrderedCollection with: 5 with: 1.
	finalPosition := OrderedCollection with: 5 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
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

{ #category : #'tests - initialization' }
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

{ #category : #finishLine }
BoardTest >> test012WhenABoardInitializesWithOneLapThenTheNumberOfLapsIsOne [

	| aBoard |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeBeginning: 2
		          andEnding: 10.

	self assert: ((aBoard finishLine) at:2) equals: 1
]

{ #category : #legalMove }
BoardTest >> test013WhenEnterRecivesNumberGreaterThanAmountOfCellsThenEnterOnNextLap [

	| aBoard enterPosition finalPosition |
	aBoard := Board
		          ofCells: 11
		          numberOfLaps: 2
		          withWormholeBeginning: 2
		          andEnding: 10.
	
	enterPosition := OrderedCollection with: 12 with: 1.
	finalPosition := OrderedCollection with: 1 with: 2.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]

{ #category : #legalMove }
BoardTest >> test014BoardWithBlackHoleEntersItThenReturnsPositionMinusFour [

	| aBoard enterPosition finalPosition |
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 2
		          withSpecialCell: BlackHole new
		          On: 8.

	enterPosition := OrderedCollection with: 8 with: 1.
	finalPosition := OrderedCollection with: 4 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]

{ #category : #legalMove }
BoardTest >> test015EnterOnBlackHoleFirstThreeCellsThenLooseOneLap [

	| aBoard enterPosition finalPosition |
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 2
		          withSpecialCell: BlackHole new
		          On: 13.

	enterPosition := OrderedCollection with: 2 with: 2.
	finalPosition := OrderedCollection with: 9 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]
