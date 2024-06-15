Class {
	#name : #AtomicBombCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AtomicBombCellTest >> test01WhenAnAtomicBombCellsEnterThenReturnsOne [

	| anAtomicBombCell aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.


	anAtomicBombCell := AtomicBombCell withPostion: 5 onTheGame: aGame.

	self assert: anAtomicBombCell enter equals: 1
]

{ #category : #tests }
AtomicBombCellTest >> test02AtomicBombExitThenReturnsTrue [

	| anAtomicBombCell aGame aLoadedDie aBoardCreator aWormholeCreator |
	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 100 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.


	anAtomicBombCell := AtomicBombCell withPostion: 5 onTheGame: aGame.

	self assert: (anAtomicBombCell exit: 10)
]
