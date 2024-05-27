Class {
	#name : #BlackHoleCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BlackHoleCellTest >> test01BlackHoleEnterThenReturnsPositionMinusFour [

	| aBlackHole aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.

	aBlackHole := BlackHoleCell newOn: aGame withPostion: 10 .

	self assert: aBlackHole enter equals: 6
]
