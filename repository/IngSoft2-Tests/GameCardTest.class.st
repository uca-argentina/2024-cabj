Class {
	#name : #GameCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameCardTest >> test01GameActivatesAOverloadCardThenActiveCardsEqualsOne [

	| aLoadedDie aWormholeCreator aBoardCreator aGame |
	
	aLoadedDie := LoadedDie of: #( 6 ).

	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).
	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.
		
	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 2).

	self assert: aGame activeCards equals: 1.
]

{ #category : #tests }
GameCardTest >> test02GameActivatesAAccelerationCardThenActiveCardsEqualsOne [

	| aLoadedDie aWormholeCreator aBoardCreator aGame |
	
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
		
	aGame activatePermanentCard: AccelerationCard new.

	self assert: aGame activeCards equals: 1.
]

{ #category : #tests }
GameCardTest >> test03WhenOneAccelerationCardIsActiveThenSpaceshipMovesOneMoreThenThrowResult [

	| aLoadedDie aWormholeCreator aBoardCreator aGame position |
	aLoadedDie := LoadedDie of: #( 6 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).
	aGame := Game
		         numberOfSpaceships: 1
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: AccelerationCard new.

	position := OrderedCollection with: 8 with: 1.
	self assert: aGame moveSpaceship equals: position
]

{ #category : #tests }
GameCardTest >> test04SpaceshipPlaysAllCardsThenActiveDeckActiveCardsEqualsTwo [

	| aLoadedDie aWormholeCreator aBoardCreator aGame |
	
	aLoadedDie := LoadedDie of: #( 3 ).

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
		
	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 2).
	aGame moveSpaceship .
	aGame activatePermanentCard: AccelerationCard new.
	aGame moveSpaceship .
	aGame activatePermanentCard: AccelerationCard new.

	self assert: aGame activeCards equals: 2.
]

{ #category : #tests }
GameCardTest >> test05SpaceshipOnePlaysOverloadToSpaceshipTwoThenTwoMovesLessTwo [

	| aLoadedDie aWormholeCreator aBoardCreator aGame position |
	aLoadedDie := LoadedDie of: #( 6 ).

	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).
	aGame := Game
		         numberOfSpaceships: 2
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.

	aGame activatePermanentCard: (OverloadCard reduceThrowOf: 2).
	aGame moveSpaceship.

	position := OrderedCollection with: 5 with: 1.
	self assert: aGame moveSpaceship equals: position
]
