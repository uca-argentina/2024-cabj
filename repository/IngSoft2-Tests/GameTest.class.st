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
		         withBoardBoxes: 10
		         wormholeStartAndEnd: #(2 3)
		         playWithDice: #(6).

	self assert: aGame moveSpaceship equals: 6
]

{ #category : #testsGame002 }
GameTest >> test01GameMovesSpaceshipTwiceWithLoadedDieOf6ThenReturnsTwelve [

	| aGame |
	aGame := GameLoadedDie 
		         withBoardBoxes: 15
		         wormholeStartAndEnd: #(4 7)
		         playWithDice: #(6).
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: 12
]

{ #category : #testsGame002 }
GameTest >> test02GameMovesSpaceshipFallsOnWormholeThenPositionIsTheOtherSide [

| aGame |
aGame:= GameLoadedDie withBoardBoxes: 15 wormholeStartAndEnd: #(6 8) playWithDice: #(6) .

self assert: aGame moveSpaceship equals: 8. 


]

{ #category : #testsGame002 }
GameTest >> test03WhenSpaceshipReachesTheFinishLineThenIsGameLoadedDieOver [

| aGame |
aGame:= GameLoadedDie withBoardBoxes: 12 wormholeStartAndEnd: #(6 8) playWithDice: 6 asOrderedCollection.
aGame moveSpaceship.

self assert: aGame moveSpaceship equals: 'Game Over'. 


]

{ #category : #testsGame002 }
GameTest >> test04GameCreatedWithDieMovesSpaceshipInBetweenOneAndTheAmountOfFaces [

| aGame |
aGame:= Game withBoardBoxes: 50 wormholeStartAndEnd: #(48 49) playWithDice: #(5).

self assert: ((aGame moveSpaceship) between: 1 and: 5). 


]
