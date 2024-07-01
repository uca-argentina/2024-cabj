Class {
	#name : #GameLoadedDieTest,
	#superclass : #TestCase,
	#instVars : [
		'aLoadedDie',
		'aWormholeCreator',
		'collectionOfCells',
		'aBoardCreator',
		'gameDeck'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
GameLoadedDieTest >> setUp [

	super setUp.
	aLoadedDie := LoadedDie of: #( 6 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.

	15 timesRepeat: [ collectionOfCells add: Cell new ].

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	gameDeck := EffectManager
		            manage: (OrderedCollection
				             with: AccelerationCard new
				             with: AllyCard new
				             with: OverloadCard new
				             with: RedoCard new
				             with: RepeatCard new
				             with: CancellationCard new)
		            withProbabilitiesDistribution: #( 16 16 17 17 17 17 )
]

{ #category : #asserting }
GameLoadedDieTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test00GameCreatedWithBoxesALoadedDieMovesSpaceshipSixPositions [

	| aGame result |
	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 7.
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test01GameMovesSpaceshipTwiceWithLoadedDieSequenceSixAndFiveThenReturnsTwelve [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 6 5 ).

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 12.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test02GameMovesSpaceshipFallsOnWormholeThenPositionIsTheOtherSide [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 5 ).
	aWormholeCreator := WormholeCreator withBeginning: 6 andEnd: 8.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 1
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 8.
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test03WhenSpaceshipReachesTheFinishLineThenIsGameLoadedDieOver [

	| aGame resultOfGame |
	aLoadedDie := LoadedDie of: #( 14 ).

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.


	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 15 with: 1).
	aGame moveSpaceship.

	self
		assert: aGame spaceships positionsOfSpaceships
		equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test04TwoSpaceshipsMovesThreeTimesThenTheFirstOnesPositionIsTwelve [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 6 6 5 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 12.
	result at: 2 put: 7.
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameLoadedDieTest >> test05FirstSpaceshipWinsThenSecondSpaceshipCannotPlay [

	| aGame |
	aLoadedDie := LoadedDie of: #( 13 2 1 3 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
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

	| aGame resultOfGame |
	aLoadedDie := LoadedDie of: #( 13 6 1 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 15 with: 1).
	resultOfGame at: 2 put: (OrderedCollection with: 7 with: 1).
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test07WhenOneSapeshipWinsThenGetWinnerReturnsItsID [

	| aGame |
	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.

	self assert: aGame winner equals: 1
]

{ #category : #tests }
GameLoadedDieTest >> test08WhenTwoSpaceshipsPlayAndTheSecondOneWinsThenGetWinnerReturnsTwo [

	| aGame |
	aLoadedDie := LoadedDie of: #( 3 6 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame winner equals: 2
]

{ #category : #tests }
GameLoadedDieTest >> test09WhenASpaceshipLosesATurnThenGoesToStartingPosition [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 3 ).

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 1.
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameLoadedDieTest >> test10WhenOneSpaceshipLosesFuelThenItMovesAfterTwoLostTurns [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 3 ).

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 4.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameLoadedDieTest >> test11WhenASpaceshipDecidestToLooseATurnThenRechargesTheFuel [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 3 ).

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame reloadSpaceship.

	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 7.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameLoadedDieTest >> test12WhenTheSpaceshipOneRunOutOfFuelThenTheSecondSpaceshipCanReloadTheFuelAndMove [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 3 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.

	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 7.
	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameLoadedDieTest >> test13SpaceshipMovesOneLapAroundTheBoardThenMoveSpaceshipReturnsLapTwo [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 5 4 7 ).

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 2.

	self assert: aGame spaceships lapsOfSpaceships equals: result
]

{ #category : #tests }
GameLoadedDieTest >> test14WhenASpaceshipFallsInTheFirstCellThenDoesntLooseTwoTurns [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 5 4 6 ).

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: (OrderedCollection with: 6 with: 2).
	self assert: aGame spaceships positionsOfSpaceships equals: result
]

{ #category : #tests }
GameLoadedDieTest >> test15WhenTheGameFinishThenWeGetThePositionsOfTheSpaceships [

	| aGame resultOfPositions |
	aLoadedDie := LoadedDie of: #( 13 6 1 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	resultOfPositions := Dictionary new.
	resultOfPositions at: 1 put: 15.
	resultOfPositions at: 2 put: 7.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self
		assert: aGame spaceships cellsOfSpaceships
		equals: resultOfPositions
]

{ #category : #tests }
GameLoadedDieTest >> test16WhenTheGameFinishThenWeGetTeLapsOfTheSpaceships [

	| aGame resultOfLaps |
	aLoadedDie := LoadedDie of: #( 15 3 14 ).

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	resultOfLaps := Dictionary new.
	resultOfLaps at: 1 put: 2.
	resultOfLaps at: 2 put: 1.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame spaceships lapsOfSpaceships equals: resultOfLaps
]

{ #category : #tests }
GameLoadedDieTest >> test17WhenTheGameEndsThenReturnsThePositionWithTheLapOfEachSpaceship [

	| aGame resultOfGame |
	aLoadedDie := LoadedDie of: #( 24 5 5 ).

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 15 with: 2).
	resultOfGame at: 2 put: (OrderedCollection with: 6 with: 1).
	aGame moveSpaceship.
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: resultOfGame
]

{ #category : #tests }
GameLoadedDieTest >> test18WhenTheSpaceshipTwoIsInTheFirstPlaceTheSpaceshipOneIsInTheSecondPlaceAndTheSpaceshipIsInTheThirdPlaceThenTheRankingIsTwoOneThree [

	| aGame rankingOfSpaceships idRanking |
	aLoadedDie := LoadedDie of: #( 12 13 5 ).

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	rankingOfSpaceships := OrderedCollection with: 2 with: 1 with: 3.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	idRanking := aGame spaceships ranking collect: [ :spaceship |
		             spaceship id ].

	self assert: idRanking equals: rankingOfSpaceships
]

{ #category : #tests }
GameLoadedDieTest >> test19WhenSpaceshipsArePlayingTheyGetACollectionOfTheIdsOfTheThreeFirstsSpaceships [

	| aGame rankingOfSpaceships idRanking |
	aLoadedDie := LoadedDie of: #( 12 13 5 1 ).

	aGame := Game
		         numberOfSpaceships: 4
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	rankingOfSpaceships := OrderedCollection with: 2 with: 1 with: 3.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	idRanking := (aGame spaceships ranking first: 3) collect: [
		             :spaceship | spaceship id ].

	self assert: idRanking equals: rankingOfSpaceships
]

{ #category : #tests }
GameLoadedDieTest >> test20SpaceshipGainsCapacityOfFuelBeacuseOfThrowingMaxResultOfDice [

	| aGame spaceship |
	aLoadedDie := LoadedDie of: #( 4 ).

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame reloadSpaceship.

	spaceship := aGame spaceships ranking at: 1.

	self assert: (spaceship amountOfFuel between: 7 and: 9)
]

{ #category : #tests }
GameLoadedDieTest >> test21SpacshipOneLoadsFuelSpaceshipTwoLoosesTurnsThenOneMovesOnTwosTurn [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 3 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.
	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame reloadSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.
	result := Dictionary new.
	result at: 1 put: 7.
	result at: 2 put: 1.
	self assert: aGame spaceships cellsOfSpaceships equals: result
]
