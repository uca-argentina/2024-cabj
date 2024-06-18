Class {
	#name : #UserInterfaceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
UserInterfaceTest >> test01UserInterfaceMovesSpaceshipThenGetsFinalPositions [

	| result aLoadedDie aUserInterface aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 9 8 4 ).
	
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreatorWithDefinedCellPositions
		                 withCellsAndLaps: #( 10 2 )
		                 wormholeCreator: aWormholeCreator.

	aUserInterface := UserInterface
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aUserInterface moveSpaceship.
	aUserInterface moveSpaceship.
	aUserInterface moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.
	result at: 3 put: 1.

	self assert: aUserInterface finalPositionOfSpaceships equals: result
]

{ #category : #tests }
UserInterfaceTest >> test02UserInterfaceUsesBothPermanentAndInstantCardsThenGamePlaysNormally [

	| aLoadedDie aWormholeCreator aBoardCreator aUserInterFace result |
	aLoadedDie := LoadedDie of: #( 7 7 7 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 30 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).
	aUserInterFace := UserInterface
		         numberOfSpaceshipsPlayingWithAllCards: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aUserInterFace activatePermanentCard: (OverloadCard reduceThrowOf: 2).
	aUserInterFace
		spaceshipId: 1
		activateInstantCard:
		(RedoCard forSpaceshipId: 3 orCardToCancel: nil).
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 6.
	result at: 3 put: 6.

	self assert: aUserInterFace finalPositionOfSpaceships equals: result
]

{ #category : #tests }
UserInterfaceTest >> test03UserInterfaceReloadFuelThenGameFunctionsNormally [

	| aUserInterFace aLoadedDie position aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 3 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aUserInterFace := UserInterface
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aUserInterFace moveSpaceship.
	aUserInterFace reloadSpaceship.

	position := OrderedCollection with: 7 with: 1.
	self assert: aUserInterFace moveSpaceship equals: position
]

{ #category : #tests }
UserInterfaceTest >> test04UserInterfacesPlaysThenRankingOfSpaceshipsShowTheRanking [

	| aUserInterFace aLoadedDie aBoardCreator aWormholeCreator rankingOfSpaceships idRanking |
	aLoadedDie := LoadedDie of: #( 12 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aUserInterFace := UserInterface
		         numberOfSpaceships: 4
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	rankingOfSpaceships := OrderedCollection with: 2 with: 1 with: 3.
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.
	
	idRanking := (aUserInterFace rankingOfSpaceships) collect: [ :spaceship |
		             spaceship id ].
	
	self
		assert: idRanking
		equals: rankingOfSpaceships
]

{ #category : #tests }
UserInterfaceTest >> test05UserInterfacePlaysThenGetsWinnerId [

	| aUserInterFace aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 6 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aUserInterFace := UserInterface
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aUserInterFace moveSpaceship.

	self assert: aUserInterFace winner equals: 1
]

{ #category : #tests }
UserInterfaceTest >> test06UserInterfacePlaysThenGetsFinalLapsOfSpaceships [

	| aUserInterFace aLoadedDie resultOfLaps aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 6 3 12 6 1 6 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aUserInterFace := UserInterface
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	resultOfLaps := Dictionary new.
	resultOfLaps at: 1 put: 2.
	resultOfLaps at: 2 put: 1.
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.

	self assert: aUserInterFace finalLapsOfSpaceships equals: resultOfLaps
]

{ #category : #tests }
UserInterfaceTest >> test07userInterfacePlaysThenGetsFinalResultsOfSpaceships [

	| aUserInterFace aLoadedDie resultOfGame aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 20 5 4 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 12 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aUserInterFace := UserInterface
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 12 with: 2).
	resultOfGame at: 2 put: (OrderedCollection with: 6 with: 1).
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.

	self assert: aUserInterFace finalResultsOfSpaceships equals: resultOfGame
]
