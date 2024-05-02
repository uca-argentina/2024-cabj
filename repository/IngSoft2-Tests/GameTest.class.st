Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
GameTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [:error | self assert: error messageText equals: anErrorMessage ].
]

{ #category : #tests }
GameTest >> testGameFinishWhenTheSpaceshipIsInPositionThree [

| aGame |
aGame:= Game begin:3.
aGame moveSpaceship:1.
aGame moveSpaceship:1.

self assert: (aGame moveSpaceship:1) equals:'Finished game'.
]

{ #category : #tests }
GameTest >> testGameInitializeWithAnAmountOfBoxes [

| aGame |
aGame:= Game begin: 4.
aGame moveSpaceship:1.
aGame moveSpaceship:1.

self assert: (aGame moveSpaceship:1) equals:3.
]

{ #category : #tests }
GameTest >> testTheGameBeginsWithOneSpaceshipAndItMovesOnce [

| aGame |
aGame:= Game begin:3.

self assert: (aGame moveSpaceship:1) equals:1.
]

{ #category : #tests }
GameTest >> testTheGameMovesTheSpaceshipTwice [

| aGame |
aGame:= Game begin:3.
aGame moveSpaceship:1.

self assert: (aGame moveSpaceship:1) equals:2.
]

{ #category : #tests }
GameTest >> testWhenTheGameFinishThenTheSpaceshipCannotMove [


| aGame |
self should: [aGame:= Game begin: 2.
					aGame moveSpaceship:1.
					aGame moveSpaceship:1.
					aGame moveSpaceship:1.] 
		raise:Error withMessage: 'The game has already finished.'.
]

{ #category : #tests }
GameTest >> testWhenTheGameIsInitializedAndMovesTwiceWithTwoJumpsThenIsInThePositionTwo [
|aGame|
aGame:= Game begin:3.
self assert: (aGame moveSpaceship:2) equals:2.
]
