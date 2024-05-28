Class {
	#name : #AtomicBombCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AtomicBombCellTest >> test01WhenAnAtomicBombCellsEnterThenReturnsOne [

	| anAtomicBombCell aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.

	anAtomicBombCell := AtomicBombCell newOn: aGame withPostion: 5.

	self assert: anAtomicBombCell enter equals: 1
]
