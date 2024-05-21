Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
GameTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #testsGame002 }
GameTest >> testGameCreatedWithDieMovesSpaceshipInBetweenOneAndTheAmountOfFaces [

	| aGame aDie |
	aDie := Die of: 5.
	aGame := Game
		         numberOfSpaceships: 1
		         boardBoxes: 50
		         wormholeStartAndEnd: #( 48 49 )
		         playWithDice: aDie.

	self assert: (aGame moveSpaceship between: 2 and: 6)
]

{ #category : #tests }
GameTest >> testSpaceshipOnesWinThenSpaceshipsTwoPlaysAndGameOver [

	| aGame aCollectionOfDice |
	aCollectionOfDice := CollectionOfDice of: #( 10 10 10 10 10 ).
	aGame := Game
		         numberOfSpaceships: 2
		         boardBoxes: 4
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aCollectionOfDice.
	aGame moveSpaceship.
	self
		should: [ aGame moveSpaceship ]
		raise: Error
		withMessage: 'The Game is Over'
]

{ #category : #tests }
GameTest >> testTwoSpaceshipsFirstOneMovesTwiceWithDieOfSixThenMinTwoMaxTwelvePosition [

	| aGame aDie |
	aDie := Die of: 6.
	aGame := Game
		         numberOfSpaceships: 2
		         boardBoxes: 50
		         wormholeStartAndEnd: #( 40 45 )
		         playWithDice: aDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: (aGame moveSpaceship between: 3 and: 13)
]

{ #category : #tests }
GameTest >> testWhenSpaceshipWinsThenReturnsItsPosition [

	| aGame resultOfGame aCollectionOfDice |
	aCollectionOfDice := CollectionOfDice of: #( 10 10 10 10 10 10 ).
	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: 4.
	aGame := Game
		         numberOfSpaceships: 1
		         boardBoxes: 4
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aCollectionOfDice.

	self assert: aGame moveSpaceship equals: resultOfGame
]
