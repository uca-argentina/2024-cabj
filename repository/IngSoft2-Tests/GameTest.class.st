Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
GameTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [:error | self assert: error messageText equals: anErrorMessage ].
]

{ #category : #testsGame002 }
GameTest >> test00GameCreatedWithBoxesALoadedDieMovesSpaceshipSixPositions [

	| aGame |
	aGame := GameLoadedDie 
		         withBoardBoxes: 5
		         wormholeStartAndEnd: #(2 3)
		         playWithDieOf: 6.

	self assert: aGame moveSpaceship equals: 6
]

{ #category : #testsGame002 }
GameTest >> test01GameMovesSpaceshipTwiceWithLoadedDieOf6ThenReturnsTwelve [

	| aGame |
	aGame := GameLoadedDie 
		         withBoardBoxes: 15
		         wormholeStartAndEnd: #(4 7)
		         playWithDieOf: 6.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: 12
]

{ #category : #testsGame002 }
GameTest >> test02GameMovesSpaceshipFallsOnWormholeThenPositionIsTheOtherSide [

| aGame |
aGame:= GameLoadedDie withBoardBoxes: 15 wormholeStartAndEnd: #(6 8) playWithDieOf: 6.

self assert: aGame moveSpaceship equals: 8. 


]

{ #category : #testsGame001 }
GameTest >> testGameFinishWhenTheSpaceshipIsInPositionThree [

| aGame |
aGame:= Game begin:3.
aGame moveSpaceship:1.
aGame moveSpaceship:1.

self assert: (aGame moveSpaceship:1) equals:'Finished game'.
]

{ #category : #testsGame001 }
GameTest >> testGameInitializeWithAnAmountOfBoxes [

| aGame |
aGame:= Game begin: 4.
aGame moveSpaceship:1.
aGame moveSpaceship:1.

self assert: (aGame moveSpaceship:1) equals:3.
]

{ #category : #testsGame001 }
GameTest >> testTheGameBeginsWithOneSpaceshipAndItMovesOnce [

| aGame |
aGame:= Game begin:3.

self assert: (aGame moveSpaceship:1) equals:1.
]

{ #category : #testsGame001 }
GameTest >> testTheGameMovesTheSpaceshipTwice [

| aGame |
aGame:= Game begin:3.
aGame moveSpaceship:1.

self assert: (aGame moveSpaceship:1) equals:2.
]

{ #category : #testsGame001 }
GameTest >> testWhenAGameIsBeingPlayedWithADieThenItMovesBetweenOneAndTheAmountOfFaces [

| aGame aDie |
aGame:= Game begin:6.
aDie := Die of: 5.


self assert: ((aGame isPlayedWith: aDie) between: 1  and: 5).
]

{ #category : #testsGame001 }
GameTest >> testWhenAGameIsPlayedWithASpaceshipAndALoadedDieOfFourFacesThenItReturnsFour [

| aGame aLoadedDie |
aGame:= Game begin:3.
aLoadedDie := LoadedDie of: 4.


self assert: (aGame isPlayedWith: aLoadedDie) equals:4.
]

{ #category : #testsGame001 }
GameTest >> testWhenAGameIsPlayedWithASpaceshipAndLoadedDieThenReturnsTheAmountOfFaces [

| aGame aLoadedDie |
aGame:= Game begin:3.
aLoadedDie := LoadedDie of: 5.


self assert: (aGame isPlayedWith: aLoadedDie) equals:5.
]

{ #category : #testsGame001 }
GameTest >> testWhenASpaceshipMovesInTheGameThenItReturnsItsPosition [

| aGame aLoadedDie |
aGame:= Game begin:3.
aLoadedDie := LoadedDie of: 5.

aGame moveSpaceship: 1.
self assert: (aGame isPlayedWith: aLoadedDie) equals:6.
]

{ #category : #testsGame001 }
GameTest >> testWhenTheGameFinishThenTheSpaceshipCannotMove [


| aGame |
self should: [aGame:= Game begin: 2.
					aGame moveSpaceship:1.
					aGame moveSpaceship:1.
					aGame moveSpaceship:1.] 
		raise:Error withMessage: 'The game has already finished.'.
]

{ #category : #testsGame001 }
GameTest >> testWhenTheGameIsInitializedAndMovesTwiceWithTwoJumpsThenIsInThePositionTwo [
|aGame|
aGame:= Game begin:3.
self assert: (aGame moveSpaceship:2) equals:2.
]
