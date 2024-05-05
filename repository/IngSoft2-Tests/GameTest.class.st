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
GameTest >> test04GameCreatedWithDieMovesSpaceshipInBetweenOneAndTheAmountOfFaces [

| aGame |
aGame:= Game withBoardBoxes: 50 wormholeStartAndEnd: #(48 49) playWithDice: #(5).

self assert: ((aGame moveSpaceship) between: 1 and: 5). 


]
