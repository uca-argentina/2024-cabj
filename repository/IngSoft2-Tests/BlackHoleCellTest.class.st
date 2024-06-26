Class {
	#name : #BlackHoleCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BlackHoleCellTest >> test01BlackHoleEnterThenReturnsPositionMinusFour [

	| aBlackHole aLoadedDie aBoardCreator aWormholeCreator aGame|
	aBlackHole := BlackHoleCell position: 5.

	aLoadedDie := LoadedDie of: #( 10 20 5 1 ).
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.

	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 20 2 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 0 0 0 0 0 0 ).

	aGame := Game
		         numberOfSpaceships: 3
		         withBoardCreator: aBoardCreator
		         playWithDice: aLoadedDie.



	self assert:( aBlackHole enterOn:aGame )equals: 1
]

{ #category : #tests }
BlackHoleCellTest >> test02BlackHoleExitThenReturnsTrue [

	| aBlackHole |
	aBlackHole := BlackHoleCell position: 5.

	self assert: (aBlackHole exit:5)
]
