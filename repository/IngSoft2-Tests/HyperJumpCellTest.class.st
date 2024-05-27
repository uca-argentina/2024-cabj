Class {
	#name : #HyperJumpCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
HyperJumpCellTest >> test01HyperJumpCreatedOnPositionFiveThenEnterReturnsNine [

	| aParsecsObject aHyperJumpCell aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aParsecsObject := Parsecs totalCells: 10 convertionValue: 5.
	aHyperJumpCell := HyperJumpCell
		                  newOn: aGame
		                  withPosition: 5
		                  Parsecs: aParsecsObject
		                  andValues: #( 2 1 ).

	self assert: aHyperJumpCell enter equals: 9
]

{ #category : #tests }
HyperJumpCellTest >> test02HyperJumpCellEntersASecondTimeThenReturnsSecondeValueOfCollection [

	| aParsecsObject aHyperJumpCell aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aParsecsObject := Parsecs totalCells: 10 convertionValue: 100.
	aHyperJumpCell := HyperJumpCell
		                  newOn: aGame
		                  withPosition: 5
		                  Parsecs: aParsecsObject
		                  andValues: #( 20 10 ).
	aHyperJumpCell enter.
	self assert: aHyperJumpCell enter equals: 6
]
