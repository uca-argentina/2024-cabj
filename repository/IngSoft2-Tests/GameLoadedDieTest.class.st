Class {
	#name : #GameLoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
GameLoadedDieTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test00GameCreatedWithBoxesALoadedDieMovesSpaceshipSixPositions [

	| aGame aLoadedDie |
	aLoadedDie:= LoadedDie of:#(6).
	
	
	aGame := Game 
		         numberOfSpaceships: 1 
				   boardBoxes: 10
		         wormholeStartAndEnd: #(2 3)
		         playWithDice: aLoadedDie.

	self assert: aGame moveSpaceship equals: 7
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test01GameMovesSpaceshipTwiceWithLoadedDieOf6ThenReturnsThirteen [

	| aGame aLoadedDie|
	aLoadedDie := LoadedDie of:#(6).
	aGame := Game 
		         numberOfSpaceships: 1 
				   boardBoxes: 15
		         wormholeStartAndEnd: #(4 5)
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: 13
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test01GameMovesSpaceshipTwiceWithLoadedDieOf6ThenReturnsTwelve [

	| aGame aLoadedDie|
	aLoadedDie := LoadedDie of:#(6).
	aGame := Game 
		         numberOfSpaceships: 1 
				   boardBoxes: 15
		         wormholeStartAndEnd: #(4 7)
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: 12
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test02GameMovesSpaceshipFallsOnWormholeThenPositionIsTheOtherSide [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #(5).
	aGame := Game
		         numberOfSpaceships: 1
		         boardBoxes: 15
		         wormholeStartAndEnd: #( 6 8 )
		         playWithDice: aLoadedDie.

	self assert: aGame moveSpaceship equals: 8
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test03WhenSpaceshipReachesTheFinishLineThenIsGameLoadedDieOver [

	| aGame resultOfGame aLoadedDie |
	aLoadedDie := LoadedDie of: #(6).
	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: 12.
	aGame := Game
		         numberOfSpaceships: 1
		         boardBoxes: 12
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test04InitializeWithTwoSpaceshipsMovesThreeTimesThenTheFirstOnesPositionIsThirteen [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #(6).
	aGame := Game
		         numberOfSpaceships: 2
		         boardBoxes: 50
		         wormholeStartAndEnd: #( 40 45 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: 13
]

{ #category : #tests }
GameLoadedDieTest >> test04InitializeWithTwoSpaceshipsMovesThreeTimesThenTheFirstOnesPositionIsTwelve [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #(6).
	aGame := Game
		         numberOfSpaceships: 2
		         boardBoxes: 50
		         wormholeStartAndEnd: #( 40 45 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: 12
]

{ #category : #tests }
GameLoadedDieTest >> test05FirstSpaceshipWinsThenSecondSpaceshipCannotPlay [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #(6).
	aGame := Game
		         numberOfSpaceships: 2
		         boardBoxes: 12
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	self
		should: [ aGame moveSpaceship ]
		raise: Error
		withMessage: 'The Game is Over'
]

{ #category : #tests }
GameLoadedDieTest >> test06SpaceshipOneWinsThenResultOfGameShowsPositions [

	| aGame resultOfGame aLoadedDie |
	aLoadedDie := LoadedDie of: #(6).
	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: 12.
	resultOfGame at: 2 put: 7.
	aGame := Game
		         numberOfSpaceships: 2
		         boardBoxes: 12
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test07WhenOneSapeshipWinsThenGetWinnerReturnsItsID [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #(6).
	aGame := Game
		         numberOfSpaceships: 1
		         boardBoxes: 6
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	self assert: aGame getWinner equals: 1
]

{ #category : #tests }
GameLoadedDieTest >> test08WhenTwoSpaceshipsPlayAndTheSecondOneWinsThenGetWinnerReturnsTwo [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #(3 6).
	aGame := Game
		         numberOfSpaceships: 2
		         boardBoxes: 6
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame getWinner equals: 2
]
