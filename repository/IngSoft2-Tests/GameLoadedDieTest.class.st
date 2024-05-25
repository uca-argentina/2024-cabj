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

	| aGame aLoadedDie position |
	aLoadedDie := LoadedDie of: #( 6 ).


	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	position := OrderedCollection with: 7 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test01GameMovesSpaceshipTwiceWithLoadedDieSequenceSixAndFiveThenReturnsTwelve [

	| aGame aLoadedDie position |
	aLoadedDie := LoadedDie of: #( 6 5 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 15 1 )
		         wormholeStartAndEnd: #( 4 5 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	position := OrderedCollection with: 12 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test02GameMovesSpaceshipFallsOnWormholeThenPositionIsTheOtherSide [

	| aGame aLoadedDie position |
	aLoadedDie := LoadedDie of: #( 5 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 15 1 )
		         wormholeStartAndEnd: #( 6 8 )
		         playWithDice: aLoadedDie.

	position := OrderedCollection with: 8 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test03WhenSpaceshipReachesTheFinishLineThenIsGameLoadedDieOver [

	| aGame resultOfGame aLoadedDie |
	aLoadedDie := LoadedDie of: #( 6 ).
	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: 12.
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 12 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test04TwoSpaceshipsMovesThreeTimesThenTheFirstOnesPositionIsTwelve [

	| aGame aLoadedDie position |
	aLoadedDie := LoadedDie of: #( 6 6 5 ).
	aGame := Game
		         numberOfSpaceships: 2
		         boardWithCellsAndLaps: #( 50 1 )
		         wormholeStartAndEnd: #( 40 45 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	position := OrderedCollection with: 12 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameLoadedDieTest >> test05FirstSpaceshipWinsThenSecondSpaceshipCannotPlay [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 2
		         boardWithCellsAndLaps: #( 12 1 )
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
	aLoadedDie := LoadedDie of: #( 6 ).
	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: 12.
	resultOfGame at: 2 put: 7.
	aGame := Game
		         numberOfSpaceships: 2
		         boardWithCellsAndLaps: #( 12 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test07WhenOneSapeshipWinsThenGetWinnerReturnsItsID [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 6 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	self assert: aGame getWinner equals: 1
]

{ #category : #tests }
GameLoadedDieTest >> test08WhenTwoSpaceshipsPlayAndTheSecondOneWinsThenGetWinnerReturnsTwo [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #( 3 6 ).
	aGame := Game
		         numberOfSpaceships: 2
		         boardWithCellsAndLaps: #( 6 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame getWinner equals: 2
]

{ #category : #tests }
GameLoadedDieTest >> test09WhenASpaceshipLosesATurnThenGoesToStartingPosition [

	| aGame aLoadedDie position |
	aLoadedDie := LoadedDie of: #( 3 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 20 1 )
		         wormholeStartAndEnd: #( 16 18 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	position := OrderedCollection with: 1 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameLoadedDieTest >> test10WhenOneSpaceshipLosesFuelThenItMovesAfterTwoLostTurns [

	| aGame aLoadedDie position |
	aLoadedDie := LoadedDie of: #( 3 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 20 1 )
		         wormholeStartAndEnd: #( 16 18 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	
	position := OrderedCollection with: 4 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameLoadedDieTest >> test11WhenASpaceshipDecidestToLooseATurnThenRechargesTheFuel [

	| aGame aLoadedDie position |
	aLoadedDie := LoadedDie of: #( 3 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 20 1 )
		         wormholeStartAndEnd: #( 16 18 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame reloadSpaceship.

	position := OrderedCollection with: 7 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameLoadedDieTest >> test12WhenTheSpaceshipOneRunOutOfFuelThenTheSecondSpaceshipCanReloadTheFuelAndMove [

	| aGame aLoadedDie position |
	aLoadedDie := LoadedDie of: #( 3 ).
	aGame := Game
		         numberOfSpaceships: 2
		         boardWithCellsAndLaps: #( 20 1 )
		         wormholeStartAndEnd: #( 16 18 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.
	
	position := OrderedCollection with: 7 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameLoadedDieTest >> test13 [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #( 5 4 1 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 2 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: 1
]
