Class {
	#name : #GameWithDefinedPositionsOfCellsTest,
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
GameWithDefinedPositionsOfCellsTest >> setUp [
	
	super setUp.
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

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test01GameMovesSpaceshipWhichEntersAtomicBombThenEveryoneGoesBackToCellOne [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 9 8 4 ).

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.
	result at: 3 put: 1.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test02GameMovesSpaceshipEntersHyperJumpThenReturnsNewPositionAdjustedByParsecs [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 9 8 3 ).

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 10.
	result at: 2 put: 4.
	result at: 3 put: 4.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test03SpaceshipThreeEntersMoonWalkThenEveryOtherSpaceshipGoesBackAValue [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 9 9 6 ).

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 6.
	result at: 2 put: 6.
	result at: 3 put: 7.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test04GameMovesSpaceshipsOneEntersBlackHoleThenPositionIsMinusFour [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 5 9 9 ).

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 2.
	result at: 2 put: 10.
	result at: 3 put: 10.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test05SpaceshipOneEntersHyperGravityAndRollsLessThanMinuminValueThenStaysThere [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 9 2 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 8.
	result at: 2 put: 10.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test06SpaceshipEntersHyperGravityAndRollsValueThenSpaceshipCanMove [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 7 9 6 ).

	aGame := Game
		         numberOfSpaceships: 2
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 4.
	result at: 2 put: 10.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test07SecondSpaceshipAndThirdSpaceshipEnterHyperJumpThenThirdMovesLessParsecsThanSecond [

	| result aGame |
	aLoadedDie := LoadedDie of: #( 9 8 8 ).

	aGame := Game
		         numberOfSpaceships: 3
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 10.
	result at: 2 put: 4.
	result at: 3 put: 3.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test08SpaceshipEntersCardDispenserThenItCanUseTwoAccelerationCards [

	| aGame result |
	aLoadedDie := LoadedDie of: #( 3 3 3 50 ).

	collectionOfCells := OrderedCollection new.
	10 timesRepeat: [ collectionOfCells add: Cell ].
	collectionOfCells at: 4 put: CardDispenserCell.

	aBoardCreator := BoardCreator
		                 with: collectionOfCells
		                 ofLaps: 2
		                 withWormholeCreator: aWormholeCreator.

	gameDeck := EffectManager manage:
		            (OrderedCollection with: AccelerationCard new).

	aGame := Game
		         numberOfSpaceships: 1
		         with: aBoardCreator
		         playWith: aLoadedDie
		         andGameDeck: gameDeck.

	aGame moveSpaceship.
	aGame usePermanentCard: AccelerationCard new.
	aGame usePermanentCard: AccelerationCard new.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 9.

	self assert: aGame spaceships cellsOfSpaceships equals: result
]
