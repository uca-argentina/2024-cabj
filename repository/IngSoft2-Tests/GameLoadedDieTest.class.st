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
	resultOfGame at: 1 put: (OrderedCollection with:12 with:1).
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
	resultOfGame at: 1 put: (OrderedCollection with:12 with:1).
	resultOfGame at: 2 put: (OrderedCollection with: 7 with:1).
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
GameLoadedDieTest >> test13SpaceshipMovesOneLapAroundTheBoardThenMoveSpaceshipReturnsLapTwo [

	| aGame aLoadedDie |
	aLoadedDie := LoadedDie of: #( 5 4 2 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 2 )
		         wormholeStartAndEnd: #( 3 4 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.

	self assert: (aGame moveSpaceship at: 2) equals: 2
]

{ #category : #tests }
GameLoadedDieTest >> test14WhenASpaceshipFallsInTheFirstCellThenDoesntLooseTwoTurns [

	| aGame aLoadedDie position |
	aLoadedDie := LoadedDie of: #( 5 4 1 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 2 )
		         wormholeStartAndEnd: #( 3 4 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.
	aGame moveSpaceship .
	position:= OrderedCollection with:6 with: 2.
	self assert: (aGame moveSpaceship ) equals: position 
]

{ #category : #tests }
GameLoadedDieTest >> test15WhenTheGameFinishThenWeGetThePositionsOfTheSpaceships [

	| aGame resultOfPositions aLoadedDie |
	aLoadedDie := LoadedDie of: #( 6 ).
	resultOfPositions := Dictionary new.
	resultOfPositions at: 1 put: 12.
	resultOfPositions at: 2 put: 7.
	aGame := Game
		         numberOfSpaceships: 2
		         boardWithCellsAndLaps: #( 12 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self
		assert: aGame finalPositionOfSpaceships
		equals: resultOfPositions
]

{ #category : #tests }
GameLoadedDieTest >> test16WhenTheGameFinishThenWeGetTeLapsOfTheSpaceships [

	| aGame resultOfLaps aLoadedDie |
	aLoadedDie := LoadedDie of: #( 6 3 12 1 6 1 ).
	resultOfLaps := Dictionary new.
	resultOfLaps at: 1 put: 2.
	resultOfLaps at: 2 put: 1.
	aGame := Game
		         numberOfSpaceships: 2
		         boardWithCellsAndLaps: #( 12 2 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self
		assert: aGame finalLapsOfSpaceships
		equals: resultOfLaps
]

{ #category : #tests }
GameLoadedDieTest >> test17WhenTheGameEndsThenReturnsThePositionWithTheLapOfEachSpaceship [

	| aGame resultOfGame aLoadedDie |
	aLoadedDie := LoadedDie of: #( 20 5 4 ).
	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 12 with: 2).
	resultOfGame at: 2 put: (OrderedCollection with:6 with:1).
	aGame := Game
		         numberOfSpaceships: 2
		         boardWithCellsAndLaps: #( 12 2 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test18WhenTheSpaceshipTwoIsInTheFirstPlaceTheSpaceshipOneIsInTheSecondPlaceAndTheSpaceshipIsInTheThirdPlaceThenTheRankingIsTwoOneThree [

	| aGame aLoadedDie rankingOfSpaceships |
	aLoadedDie := LoadedDie of: #( 12 24 5  ).
	rankingOfSpaceships:= OrderedCollection with: 2 with: 1 with: 3.
	aGame := Game
		         numberOfSpaceships: 3
		         boardWithCellsAndLaps: #( 12 2 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	self assert: aGame getRankingOfSpaceships equals: rankingOfSpaceships 
]
