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
BoardTest >> testBoardCannotBeCreatedWithNegativeBoxes [

self 
	should: [Board of: -1 withWormholeBeginning: 2 andEnding: 10] 
	raise: Error 
	withMessage: 'A Board must have more than one box.'.
]

{ #category : #tests }
BoardTest >> testBoardCannotBeCreatedWithOneBox [

self 
	should: [Board of: 1 withWormholeBeginning: 2 andEnding: 10] 
	raise: Error 
	withMessage: 'A Board must have more than one box.'.
]

{ #category : #tests }
BoardTest >> testBoardCreatedWithWormholeEntersOnTheBeginningReturnsTheEnd [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard enterWormhole: 2) equals: 10.
]

{ #category : #tests }
BoardTest >> testBoardCreatedWithWormholeEntersOnTheEndReturnsBeginning [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard enterWormhole: 10) equals: 2.
]

{ #category : #tests }
BoardTest >> testBoardFinishLineEqualsAmountOfBoxesInitializeWith [

| aBoard |
aBoard:= Board of: 4 withWormholeBeginning: 2 andEnding: 10.

self assert: (aBoard finishLine) equals: 4.
]

{ #category : #tests }
BoardTest >> testBoardRecivesIlegalPositionAndReturnsFinishLine [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard legalMove: 14) equals: 11.
]

{ #category : #tests }
BoardTest >> testBoardRecivesLegalMoveAndStaysTheSame [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard legalMove: 8) equals: 8.
]

{ #category : #tests }
BoardTest >> testWhenBoardInitializeWithThreeBoxesThenFinishesOnThree [

| aBoard |
aBoard:= Board of: 3 withWormholeBeginning: 2 andEnding: 10.

self assert: (aBoard finishLine) equals: 3.
]

{ #category : #tests }
BoardTest >> testWhenPositionIsnotWormholeThenItStaysTheSame [

| aBoard |
aBoard:= Board of: 11 withWormholeBeginning: 2 andEnding: 10 .

self assert: (aBoard enterWormhole: 5) equals: 5.
]
