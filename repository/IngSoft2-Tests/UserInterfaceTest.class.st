Class {
	#name : #UserInterfaceTest,
	#superclass : #TestCase,
	#instVars : [
		'aLoadedDie',
		'aWormholeCreator',
		'collectionOfCells',
		'aBoardCreator'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
UserInterfaceTest >> setUp [

	aLoadedDie := LoadedDie of: #( 6 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	collectionOfCells := OrderedCollection new.

	10 timesRepeat: [ collectionOfCells add: Cell ].
	
	collectionOfCells at: 5 put: AtomicBombCell.
	collectionOfCells at: 6 put: BlackHoleCell.
	collectionOfCells at: 4 put: CardDispenserCell.
	collectionOfCells at: 8 put: HyperGravityCell.
	collectionOfCells at: 9 put: HyperJumpCell.
	collectionOfCells at: 7 put: MoonWalkCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.
]

{ #category : #tests }
UserInterfaceTest >> test01UserInterfaceMovesSpaceshipThenGetsFinalPositions [

	| result aUserInterface |
	aLoadedDie := LoadedDie of: #( 9 8 4 ).

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

	| aUserInterFace result |
	aLoadedDie := LoadedDie of: #( 9 9 9 ).
	
	collectionOfCells := OrderedCollection new.

	10 timesRepeat: [ collectionOfCells add: Cell ].
	
	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.
	
	aUserInterFace := UserInterface
		         numberOfSpaceshipsPlayingWithAllCards: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aUserInterFace activatePermanentCard: (OverloadCard toDoEffectFor: 2).
	aUserInterFace
		spaceshipId: 1
		activateInstantCard:
		(RedoCard forCardWith: 3).
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 10.
	result at: 2 put: 8.
	result at: 3 put: 8.

	self assert: aUserInterFace finalPositionOfSpaceships equals: result
]

{ #category : #tests }
UserInterfaceTest >> test03UserInterfaceReloadFuelThenGameFunctionsNormally [

	| aUserInterFace result |
	aLoadedDie := LoadedDie of: #( 3 ).

	aUserInterFace := UserInterface
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aUserInterFace moveSpaceship.
	aUserInterFace reloadSpaceship.
	aUserInterFace  moveSpaceship .	
	result:=Dictionary new.
	result at:1 put:7.
	self assert: aUserInterFace finalPositionOfSpaceships   equals: result.
]

{ #category : #tests }
UserInterfaceTest >> test04UserInterfacesPlaysThenRankingOfSpaceshipsShowTheRanking [

	| aUserInterFace rankingOfSpaceships idRanking |
	aLoadedDie := LoadedDie of: #( 12 15 5 1 ).
	
	collectionOfCells := OrderedCollection new.

	10 timesRepeat: [ collectionOfCells add: Cell ].
	
	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

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

	| aUserInterFace  |

	aUserInterFace := UserInterface
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
	aUserInterFace moveSpaceship.

	self assert: aUserInterFace winner equals: 1
]

{ #category : #tests }
UserInterfaceTest >> test06UserInterfacePlaysThenGetsFinalLapsOfSpaceships [

	| aUserInterFace resultOfLaps |
	aLoadedDie := LoadedDie of: #( 6 3 12 6 1 6 ).
	
	collectionOfCells := OrderedCollection new.

	10 timesRepeat: [ collectionOfCells add: Cell ].
	
	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

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

	| aUserInterFace resultOfGame |
	aLoadedDie := LoadedDie of: #( 15 5 4 ).
	
	collectionOfCells := OrderedCollection new.

	10 timesRepeat: [ collectionOfCells add: Cell ].
	
	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	aUserInterFace := UserInterface
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	resultOfGame := Dictionary new.
	resultOfGame at: 1 put: (OrderedCollection with: 10 with: 2).
	resultOfGame at: 2 put: (OrderedCollection with: 6 with: 1).
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.
	aUserInterFace moveSpaceship.

	self assert: aUserInterFace finalResultsOfSpaceships equals: resultOfGame
]
