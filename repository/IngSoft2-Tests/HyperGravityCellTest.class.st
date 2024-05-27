Class {
	#name : #HyperGravityCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
HyperGravityCellTest >> test01WhenAValueIsLessThanTheConfiguredInTheHyperGravityCellThenThePositionIsTheSame [

	| aHyperGravityCell aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.

	aHyperGravityCell := HyperGravityCell
		                     newOn: aGame
		                     withValueToMove: 6
		                     inPosition: 5.

	self assert: aHyperGravityCell enter equals: 5
]

{ #category : #tests }
HyperGravityCellTest >> test02WhenAValueIsGreaterThanTheConfiguredInTheHyperGravityCellThenTrue [

	| aHyperGravityCell aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.

	aHyperGravityCell := HyperGravityCell
		                     newOn: aGame
		                     withValueToMove: 6
		                     inPosition: 5.

	self assert: (aHyperGravityCell exit: 10)
]

{ #category : #tests }
HyperGravityCellTest >> test03WhenAValueIsLessThanTheConfiguredInTheHyperGravityCellThenFalse [

	| aHyperGravityCell aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.

	aHyperGravityCell := HyperGravityCell
		                     newOn: aGame
		                     withValueToMove: 6
		                     inPosition: 5.

	self deny: (aHyperGravityCell exit: 4)
]
