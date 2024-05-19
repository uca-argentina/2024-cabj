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

	| aBoard |
	aBoard := Board of: 3 withWormholeBeginning: 1 andEnding: 2.
	self assert: aBoard finishLine equals: 3
]

{ #category : #'tests - initialization' }
BoardTest >> test002BoardCannotBeCreatedWithOneCell [

	self
		should: [ Board of: 1 withWormholeBeginning: 2 andEnding: 10 ]
		raise: Error
		withMessage: 'A Board must have more than one box.'
]

{ #category : #'tests - initialization' }
BoardTest >> test003BoardCannotBeCreatedWithNegativeCells [

	self
		should: [ Board of: -1 withWormholeBeginning: 2 andEnding: 10 ]
		raise: Error
		withMessage: 'A Board must have more than one box.'
]

{ #category : #tests }
BoardTest >> test004BoardFinishLineEqualsAmountOfCellsInitializeWith [

	| aBoard |
	aBoard := Board of: 4 withWormholeBeginning: 2 andEnding: 3.

	self assert: aBoard finishLine equals: 4
]

{ #category : #wormhole }
BoardTest >> test005BoardCreatedWithWormholeEntersOnTheEndReturnsBeginning [

	| aBoard |
	aBoard := Board of: 11 withWormholeBeginning: 2 andEnding: 10.

	self assert: (aBoard enter: 10) equals: 2
]

{ #category : #wormhole }
BoardTest >> test006BoardCreatedWithWormholeEntersOnTheBeginningReturnsTheEnd [

	| aBoard |
	aBoard := Board of: 11 withWormholeBeginning: 2 andEnding: 10.

	self assert: (aBoard enter: 2) equals: 10
]

{ #category : #wormhole }
BoardTest >> test007WhenPositionIsNotWormholeThenItStaysTheSame [

	| aBoard |
	aBoard := Board of: 11 withWormholeBeginning: 2 andEnding: 10.

	self assert: (aBoard enter: 5) equals: 5
]

{ #category : #legalMove }
BoardTest >> test008BoardRecivesLegalMoveAndStaysTheSame [

	| aBoard |
	aBoard := Board of: 11 withWormholeBeginning: 2 andEnding: 10.

	self assert: (aBoard adjustMovementWithinBounsFrom: 1 by: 8) equals: 8
]

{ #category : #legalMove }
BoardTest >> test009BoardRecivesIlegalPositionAndReturnsFinishLine [

	| aBoard |
	aBoard := Board of: 11 withWormholeBeginning: 2 andEnding: 10.

	self assert: (aBoard adjustMovementWithinBounsFrom: 10 by: 3) equals: 1
]

{ #category : #legalMove }
BoardTest >> test010IlegalMoveFromPositionReturnsLegalMovement [

	| aBoard |
	aBoard := Board of: 11 withWormholeBeginning: 2 andEnding: 10.

	self assert: (aBoard adjustMovementWithinBounsFrom: 8 by: 5) equals: 3
]

{ #category : #legalMove }
BoardTest >> test011WormholeEndMustBeGreaterThanBeginning [

	| aBoard |
	self
		should: [
		aBoard := Board of: 8 withWormholeBeginning: 7 andEnding: 2 ]
		raise: Error
		withMessage: 'The ending must be greater than the beginning'
]
