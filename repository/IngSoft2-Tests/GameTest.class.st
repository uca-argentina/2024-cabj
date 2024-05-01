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
aGame moveSpaceship.
aGame moveSpaceship.

self assert: (aGame moveSpaceship) equals:'Finished game'.
]

{ #category : #tests }
GameTest >> testGameInitializeWithAnAmountOfBoxes [

| aGame |
aGame:= Game begin: 4.
aGame moveSpaceship.
aGame moveSpaceship.

self assert: (aGame moveSpaceship) equals:3.
]

{ #category : #tests }
GameTest >> testTheGameBeginsWithOneSpaceshipAndItMovesOnce [

| aGame |
aGame:= Game begin:3.

self assert: (aGame moveSpaceship) equals:1.
]

{ #category : #tests }
GameTest >> testTheGameMovesTheSpaceshipTwice [

| aGame |
aGame:= Game begin:3.
aGame moveSpaceship.

self assert: (aGame moveSpaceship) equals:2.
]

{ #category : #tests }
GameTest >> testWhenTheGameFinishThenTheSpaceshipCannotMove [


| aGame |
self should: [aGame:= Game begin: 2.
					aGame moveSpaceship.
					aGame moveSpaceship.
					aGame moveSpaceship.] 
		raise:Error withMessage: 'The game has already finished.'.
]
