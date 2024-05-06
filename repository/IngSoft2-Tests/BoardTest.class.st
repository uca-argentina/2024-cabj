Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
BoardTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : #'tests - initialization' }
BoardTest >> testBoardCannotBeCreatedWithNegativeBoxes [

self 
	should: [Board of: -1 withWormholeBeginning: 2 andEnding: 10] 
	raise: Error 
	withMessage: 'A Board must have more than one box.'.
]

{ #category : #'tests - initialization' }
BoardTest >> testBoardCannotBeCreatedWithOneBox [

self 
	should: [Board of: 1 withWormholeBeginning: 2 andEnding: 10] 
	raise: Error 
	withMessage: 'A Board must have more than one box.'.
]

{ #category : #wormhole }
BoardTest >> testBoardCreatedWithWormholeEntersOnTheBeginningReturnsTheEnd [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard enter: 2) equals: 10.
]

{ #category : #wormhole }
BoardTest >> testBoardCreatedWithWormholeEntersOnTheEndReturnsBeginning [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard enter: 10) equals: 2.
]

{ #category : #tests }
BoardTest >> testBoardFinishLineEqualsAmountOfBoxesInitializeWith [

| aBoard |
aBoard:= Board of: 4 withWormholeBeginning: 2 andEnding: 10.

self assert: (aBoard finishLine) equals: 4.
]

{ #category : #legalMove }
BoardTest >> testBoardRecivesIlegalPositionAndReturnsFinishLine [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard legalMoveFrom: 10 move: 3) equals: 1.
]

{ #category : #legalMove }
BoardTest >> testBoardRecivesLegalMoveAndStaysTheSame [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard legalMoveFrom: 1 move: 8) equals: 8.
]

{ #category : #legalMove }
BoardTest >> testIlegalMoveFromPositionReturnsLegalMovement [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard legalMoveFrom: 8 move: 5) equals: 3.
]

{ #category : #tests }
BoardTest >> testWhenBoardInitializeWithThreeBoxesThenFinishesOnThree [

| aBoard |
aBoard:= Board of: 3 withWormholeBeginning: 2 andEnding: 10.

self assert: (aBoard finishLine) equals: 3.
]

{ #category : #wormhole }
BoardTest >> testWhenPositionIsnotWormholeThenItStaysTheSame [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard enter: 5) equals: 5.
]
