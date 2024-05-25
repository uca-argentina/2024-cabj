Class {
	#name : #BoardWithDefinedSpecialCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
BoardWithDefinedSpecialCellTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : #finishLine }
BoardWithDefinedSpecialCellTest >> test001WhenBoardInitializeWithThreeCellsThenFinishesOnThree [

	| aBoard finalPosition collectionSpecialCellAndPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 3.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 3
		          numberOfLaps: 1
		          withWormholeSides: #( 1 2 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.
	finalPosition := OrderedCollection with: 3 with: 1.
	self assert: aBoard finishLine equals: finalPosition
]

{ #category : #'tests - initialization' }
BoardWithDefinedSpecialCellTest >> test002BoardCannotBeCreatedWithOneCell [

	| aBoard collectionSpecialCellAndPosition |
	self
		should: [
			collectionSpecialCellAndPosition := OrderedCollection
				                                    with: RegularCell new
				                                    with: 1.
			aBoard := BoardWithDefinedSpecialCell
				          ofCells: 1
				          numberOfLaps: 1
				          withWormholeSides: #( 2 10 )
				          withSpecialCellOn: collectionSpecialCellAndPosition ]
		raise: Error
		withMessage: 'A Board must have more than one cell.'
]

{ #category : #'tests - initialization' }
BoardWithDefinedSpecialCellTest >> test003BoardCannotBeCreatedWithNegativeCells [

	| aBoard collectionSpecialCellAndPosition |
	self
		should: [
			collectionSpecialCellAndPosition := OrderedCollection
				                                    with: RegularCell new
				                                    with: 1.
			aBoard := BoardWithDefinedSpecialCell
				          ofCells: -1
				          numberOfLaps: 1
				          withWormholeSides: #( 2 10 )
				          withSpecialCellOn: collectionSpecialCellAndPosition ]
		raise: Error
		withMessage: 'A Board must have more than one cell.'
]

{ #category : #finishLine }
BoardWithDefinedSpecialCellTest >> test004BoardFinishLineEqualsAmountOfCellsInitializeWith [

	| aBoard collectionSpecialCellAndPosition lastPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 1.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 4
		          numberOfLaps: 1
		          withWormholeSides: #( 2 3 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.
	lastPosition := OrderedCollection with: 4 with: 1.
	self assert: aBoard finishLine equals: lastPosition
]

{ #category : #wormhole }
BoardWithDefinedSpecialCellTest >> test005BoardCreatedWithWormholeEntersOnTheEndReturnsBeginning [

	| aBoard collectionSpecialCellAndPosition enterPosition finalPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 1.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeSides: #( 2 10 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.
	enterPosition := OrderedCollection with: 10 with: 1.
	finalPosition := OrderedCollection with: 2 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]

{ #category : #wormhole }
BoardWithDefinedSpecialCellTest >> test006BoardCreatedWithWormholeEntersOnTheBeginningReturnsTheEnd [

	| aBoard collectionSpecialCellAndPosition enterPosition finalPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 1.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeSides: #( 2 10 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.
	enterPosition := OrderedCollection with: 2 with: 1.
	finalPosition := OrderedCollection with: 10 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]

{ #category : #wormhole }
BoardWithDefinedSpecialCellTest >> test007WhenPositionIsNotWormholeThenItStaysTheSame [

	| aBoard collectionSpecialCellAndPosition enterPosition finalPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 1.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeSides: #( 2 10 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.
	enterPosition := OrderedCollection with: 5 with: 1.
	finalPosition := OrderedCollection with: 5 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]

{ #category : #legalMove }
BoardWithDefinedSpecialCellTest >> test008BoardRecivesLegalMoveAndStaysTheSame [

	| aBoard collectionSpecialCellAndPosition aStartingPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 1.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeSides: #( 2 10 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.
	aStartingPosition := OrderedCollection with: 1 with: 1.

	self
		assert:
		(aBoard adjustMovementWithinBoundsFrom: aStartingPosition by: 8)
		equals: 8
]

{ #category : #legalMove }
BoardWithDefinedSpecialCellTest >> test009BoardRecivesIlegalPositionAndReturnsFinishLine [

	| aBoard collectionSpecialCellAndPosition aStartingPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 1.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeSides: #( 2 10 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.
	aStartingPosition := OrderedCollection with: 10 with: 1.

	self
		assert: (aBoard adjustMovementWithinBoundsFrom: aStartingPosition by: 3)
		equals: 1
]

{ #category : #legalMove }
BoardWithDefinedSpecialCellTest >> test010IlegalMoveIfThereWasOneLapIsNowLegalBeacuseThereIsMoreThanOneLap [

	| aBoard collectionSpecialCellAndPosition aStartingPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 1.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 2
		          withWormholeSides: #( 2 10 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.
	aStartingPosition := OrderedCollection with: 10 with: 1.

	self
		assert:
		(aBoard adjustMovementWithinBoundsFrom: aStartingPosition by: 3)
		equals: 3
]

{ #category : #'tests - initialization' }
BoardWithDefinedSpecialCellTest >> test011WormholeEndMustBeGreaterThanBeginning [

	| aBoard collectionSpecialCellAndPosition |
	self
		should: [
			collectionSpecialCellAndPosition := OrderedCollection
				                                    with: RegularCell new
				                                    with: 1.
			aBoard := BoardWithDefinedSpecialCell
				          ofCells: 8
				          numberOfLaps: 1
				          withWormholeSides: #( 7 2 )
				          withSpecialCellOn: collectionSpecialCellAndPosition ]
		raise: Error
		withMessage: 'The ending must be greater than the beginning'
]

{ #category : #finishLine }
BoardWithDefinedSpecialCellTest >> test012WhenABoardInitializesWithOneLapThenTheNumberOfLapsIsOne [

	| aBoard collectionSpecialCellAndPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 1.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 1
		          withWormholeSides: #( 2 10 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.

	self assert: ((aBoard finishLine) at:2) equals: 1
]

{ #category : #legalMove }
BoardWithDefinedSpecialCellTest >> test013WhenEnterRecivesNumberGreaterThanAmountOfCellsThenEnterOnNextLap [

	| aBoard collectionSpecialCellAndPosition enterPosition finalPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: RegularCell new
		                                    with: 1.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 2
		          withWormholeSides: #( 2 10 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.
	
	enterPosition := OrderedCollection with: 12 with: 1.
	finalPosition := OrderedCollection with: 1 with: 2.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]

{ #category : #legalMove }
BoardWithDefinedSpecialCellTest >> test014BoardWithBlackHoleEntersItThenReturnsPositionMinusFour [

	| aBoard enterPosition finalPosition collectionSpecialCellAndPosition |
	collectionSpecialCellAndPosition:= OrderedCollection with:( BlackHole new) with: 8.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 2
		          withWormholeSides: #( 2 3 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.

	enterPosition := OrderedCollection with: 8 with: 1.
	finalPosition := OrderedCollection with: 4 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]

{ #category : #legalMove }
BoardWithDefinedSpecialCellTest >> test015EnterOnBlackHoleFirstThreeCellsThenLooseOneLap [

	| aBoard enterPosition finalPosition collectionSpecialCellAndPosition |
	collectionSpecialCellAndPosition := OrderedCollection
		                                    with: BlackHole new
		                                    with: 13.
	aBoard := BoardWithDefinedSpecialCell
		          ofCells: 11
		          numberOfLaps: 2
		          withWormholeSides: #( 2 3 )
		          withSpecialCellOn: collectionSpecialCellAndPosition.

	enterPosition := OrderedCollection with: 2 with: 2.
	finalPosition := OrderedCollection with: 9 with: 1.
	self assert: (aBoard enter: enterPosition) equals: finalPosition
]
