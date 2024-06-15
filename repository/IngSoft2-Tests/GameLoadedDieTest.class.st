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

	| aGame aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 ).

	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.


	position := OrderedCollection with: 7 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test01GameMovesSpaceshipTwiceWithLoadedDieSequenceSixAndFiveThenReturnsTwelve [

	| aGame aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 5 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 15 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	position := OrderedCollection with: 12 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test02GameMovesSpaceshipFallsOnWormholeThenPositionIsTheOtherSide [

	| aGame aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 5 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 6
		                    andEnd: 8.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 15 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	position := OrderedCollection with: 8 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test03WhenSpaceshipReachesTheFinishLineThenIsGameLoadedDieOver [

	| aGame aLoadedDie resultOfGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.


	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 12 with: 1).
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test04TwoSpaceshipsMovesThreeTimesThenTheFirstOnesPositionIsTwelve [

	| aGame aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 6 5 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 50 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	position := OrderedCollection with: 12 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameLoadedDieTest >> test05FirstSpaceshipWinsThenSecondSpaceshipCannotPlay [

	| aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
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

	| aGame aLoadedDie resultOfGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 12 with: 1).
	resultOfGame at: 2 put: (OrderedCollection with: 7 with: 1).
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test07WhenOneSapeshipWinsThenGetWinnerReturnsItsID [

	| aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 6 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.

	self assert: aGame winner equals: 1
]

{ #category : #tests }
GameLoadedDieTest >> test08WhenTwoSpaceshipsPlayAndTheSecondOneWinsThenGetWinnerReturnsTwo [

	| aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 3 6 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 6 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame winner equals: 2
]

{ #category : #tests }
GameLoadedDieTest >> test09WhenASpaceshipLosesATurnThenGoesToStartingPosition [

	| aGame aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 3 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.


	position := OrderedCollection with: 1 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameLoadedDieTest >> test10WhenOneSpaceshipLosesFuelThenItMovesAfterTwoLostTurns [

	| aGame aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 3 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
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

	| aGame aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 3 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame reloadSpaceship.

	position := OrderedCollection with: 7 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameLoadedDieTest >> test12WhenTheSpaceshipOneRunOutOfFuelThenTheSecondSpaceshipCanReloadTheFuelAndMove [

	| aGame aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 3 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
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

	| aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 5 4 2 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.

	self assert: (aGame moveSpaceship at: 2) equals: 2
]

{ #category : #tests }
GameLoadedDieTest >> test14WhenASpaceshipFallsInTheFirstCellThenDoesntLooseTwoTurns [

	| aGame aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 5 4 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.
	aGame moveSpaceship.
	position := OrderedCollection with: 6 with: 2.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameLoadedDieTest >> test15WhenTheGameFinishThenWeGetThePositionsOfTheSpaceships [

	| aGame aLoadedDie resultOfPositions aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	resultOfPositions := Dictionary new.
	resultOfPositions at: 1 put: 12.
	resultOfPositions at: 2 put: 7.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self
		assert: aGame finalPositionOfSpaceships
		equals: resultOfPositions
]

{ #category : #tests }
GameLoadedDieTest >> test16WhenTheGameFinishThenWeGetTeLapsOfTheSpaceships [

	| aGame aLoadedDie resultOfLaps aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 3 12 6 1 6 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	resultOfLaps := Dictionary new.
	resultOfLaps at: 1 put: 2.
	resultOfLaps at: 2 put: 1.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame finalLapsOfSpaceships equals: resultOfLaps
]

{ #category : #tests }
GameLoadedDieTest >> test17WhenTheGameEndsThenReturnsThePositionWithTheLapOfEachSpaceship [

	| aGame aLoadedDie resultOfGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 20 5 4 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 12 with: 2).
	resultOfGame at: 2 put: (OrderedCollection with: 6 with: 1).
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test18WhenTheSpaceshipTwoIsInTheFirstPlaceTheSpaceshipOneIsInTheSecondPlaceAndTheSpaceshipIsInTheThirdPlaceThenTheRankingIsTwoOneThree [

	| aGame aLoadedDie rankingOfSpaceships aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 12 18 5 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	rankingOfSpaceships := OrderedCollection with: 2 with: 1 with: 3.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	self
		assert: aGame rankingOfSpaceships
		equals: #( 2 1 3 ) asOrderedCollection
]

{ #category : #tests }
GameLoadedDieTest >> test19WhenSpaceshipsArePlayingTheyGetACollectionOfTheIdsOfTheThreeFirstsSpaceships [

	| aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 12 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 4
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	self
		assert: aGame rankingOfSpaceships
		equals: #( 2 1 3 ) asOrderedCollection
]
