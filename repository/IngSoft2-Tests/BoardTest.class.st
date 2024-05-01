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

self should: [Board of: -1] raise: Error withMessage: 'A Board must have more than one box.'.
]

{ #category : #tests }
BoardTest >> testBoardCannotBeCreatedWithOneBox [

self should: [Board of: 1] raise: Error withMessage: 'A Board must have more than one box.'.
]

{ #category : #tests }
BoardTest >> testWhenBoardInitializeWithThreeBoxesThenFinishesOnThree [

| aBoard |
aBoard:= Board of: 3.

self assert: (aBoard finishLine) equals: 3.
]
