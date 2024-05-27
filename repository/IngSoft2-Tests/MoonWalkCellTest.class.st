Class {
	#name : #MoonWalkCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkCellTest >> test01WhenTheSpaceshipItsNotPlayingThenTheMoonWalkCellReturnsItsPositionMinusTheValueConfigured [

	| aMoonWalkCell aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aMoonWalkCell := MoonWalkCell
		                 newOn: aGame
		                 withValueToMove: 3
		                 inPosition: 6.

	self assert: aMoonWalkCell enterWithOtherSpaceship equals: 3
]

{ #category : #tests }
MoonWalkCellTest >> test02WhenTheSpaceshipItsPlayingThenTheMoonWalkCellDoesntChangeItsPosition [

	| aMoonWalkCell aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aMoonWalkCell := MoonWalkCell
		                 newOn: aGame
		                 withValueToMove: 3
		                 inPosition: 6.

	self assert: aMoonWalkCell enterWithSpaceshipPlaying equals: 6
]

{ #category : #tests }
MoonWalkCellTest >> test03WhenTheSpaceshipItsPlayingStaysTheSame [

	| aMoonWalkCell aLoadedDie aGame aSpaceship |
	aLoadedDie := LoadedDie of: #( 6 ).
	aGame := Game
		         numberOfSpaceships: 1
		         boardWithCellsAndLaps: #( 10 1 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.
	aMoonWalkCell := MoonWalkCell
		                 newOn: aGame
		                 withValueToMove: 3
		                 inPosition: 6.
	aSpaceship := Spaceship launchWithFuel: 10.
	self assert: (aMoonWalkCell enterWithSpaceship: aSpaceship) equals: 6
]
