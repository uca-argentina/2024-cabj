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
GameTest >> testGameCreatedWithDieMovesSpaceshipInBetweenOneAndTheAmountOfFaces [

| aGame |
aGame:= Game numberOfSpaceships: 1 boardBoxes: 50 wormholeStartAndEnd: #(48 49) playWithDice: #(5).

self assert: ((aGame moveSpaceship) between: 1 and: 5). 


]

{ #category : #tests }
GameTest >> testTwoSpaceshipsFirstOneMovesTwiceWithDieOfSixThenMinTwoMaxTwelvePosition [

| aGame |
aGame:= Game numberOfSpaceships: 2 boardBoxes: 50 wormholeStartAndEnd: #(40 45) playWithDice: #(6).
aGame moveSpaceship .
aGame moveSpaceship .

self assert: ((aGame moveSpaceship)between: 2 and: 12).
]
