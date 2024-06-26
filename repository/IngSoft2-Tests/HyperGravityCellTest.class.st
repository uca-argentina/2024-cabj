Class {
	#name : #HyperGravityCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
HyperGravityCellTest >> test01WhenAValueIsLessThanTheConfiguredInTheHyperGravityCellThenThePositionIsTheSame [

	| aHyperGravityCell aGame aLoadedDie aBoardCreator aWormholeCreator |
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
	aHyperGravityCell := HyperGravityCell
		                     withValueToMove: 6
		                     inPosition: 5.

	self assert: (aHyperGravityCell enterOn:aGame) equals: 5
]

{ #category : #tests }
HyperGravityCellTest >> test02WhenAValueIsGreaterThanTheConfiguredInTheHyperGravityCellThenTrue [

	| aHyperGravityCell |
	aHyperGravityCell := HyperGravityCell
		                     withValueToMove: 6
		                     inPosition: 5.

	self assert: (aHyperGravityCell exit: 10)
]

{ #category : #tests }
HyperGravityCellTest >> test03WhenAValueIsLessThanTheConfiguredInTheHyperGravityCellThenFalse [

	| aHyperGravityCell |
	aHyperGravityCell := HyperGravityCell
		                     withValueToMove: 6
		                     inPosition: 5.

	self deny: (aHyperGravityCell exit: 4)
]
