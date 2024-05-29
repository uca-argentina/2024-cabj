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

	| aGame aDie aBoardCreator |
	aDie := Die of: 5.
	
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).
	
	aGame := GameOldVersion
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aDie.

	self assert: ((aGame moveSpaceship at: 1) between: 2 and: 6)
]

{ #category : #tests }
GameTest >> testSpaceshipOnesWinThenSpaceshipsTwoPlaysAndGameOver [

	| aGame aCollectionOfDice aBoardCreator |
	aCollectionOfDice := CollectionOfDice of: #( 10 10 10 10 10 ).
	
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).
	
	aGame := GameOldVersion
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.
	aGame moveSpaceship.
	self
		should: [ aGame moveSpaceship ]
		raise: Error
		withMessage: 'The Game is Over'
]

{ #category : #tests }
GameTest >> testTwoSpaceshipsFirstOneMovesTwiceWithDieOfSixThenMinTwoMaxTwelvePosition [

	| aGame aDie aBoardCreator |
	aDie := Die of: 6.
	
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).
	
	aGame := GameOldVersion
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: ((aGame moveSpaceship at: 1) between: 1 and: 13)
]

{ #category : #tests }
GameTest >> testWhenSpaceshipWinsThenReturnsItsPosition [

	| aGame resultOfGame aCollectionOfDice aBoardCreator |
	
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 4 1 )
		                 wormholeBeginningAndEnding: #( 2 3 )
		                 andSpecialCellsDistruibution: #( 40 20 20 10 8 2 ).
	
	aCollectionOfDice := CollectionOfDice of: #( 10 10 10 10 10 10 ).
	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 4 with: 1).
	aGame := GameOldVersion
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aCollectionOfDice.

	self assert: aGame moveSpaceship equals: resultOfGame
]
