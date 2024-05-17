Class {
	#name : #SpaceshipWithLoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testASpaceshipPlaysWithALoadedDieThenReturnsThree [

	| aSpaceship aLoadedDie aBoard |
	aSpaceship := Spaceship launch.
	aBoard := Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aLoadedDie := LoadedDie of: 3.

	self
		assert:
		(aSpaceship
			 playWith: (OrderedCollection with: aLoadedDie)
			 on: aBoard)
		equals: 3
]

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testSpaceshipPlaysWithCollectionOfLoadedDiceThenItMovesTheSumOfFaces [

	| aSpaceship loadedDice aBoard aLoadedDie |
	aSpaceship := Spaceship launch.
	aBoard := Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aLoadedDie := LoadedDie of: 4.
	loadedDice := OrderedCollection with: aLoadedDie with: aLoadedDie.

	self assert: (aSpaceship playWith: loadedDice on: aBoard) equals: 8
]

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testSpaceshipTriesToMoveIlegallyButGoesToLegalPosition [

	| aSpaceship aLoadedDie aBoard |
	aSpaceship := Spaceship launch.
	aBoard := Board of: 5 withWormholeBeginning: 2 andEnding: 3.
	aLoadedDie := LoadedDie of: 8.

	self
		assert:
		(aSpaceship
			 playWith: (OrderedCollection with: aLoadedDie)
			 on: aBoard)
		equals: 5
]

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testWhenSpaceshipInPositionOnePlaysWithLoadedDieOfFourThenThePositionIsFive [

	| aSpaceship aLoadedDie aBoard |
	aSpaceship := Spaceship launch.
	aBoard := Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aSpaceship move: 1 on: aBoard.
	aLoadedDie := LoadedDie of: 4.

	self
		assert:
		(aSpaceship
			 playWith: (OrderedCollection with: aLoadedDie)
			 on: aBoard)
		equals: 5
]

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testWhenSpaceshipPlaysWithALoadedDieThenReturnsTheAmountOfFaces [

	| aSpaceship aLoadedDie aBoard |
	aSpaceship := Spaceship launch.
	aBoard := Board of: 20 withWormholeBeginning: 18 andEnding: 19.
	aLoadedDie := LoadedDie of: 4.

	self
		assert:
		(aSpaceship
			 playWith: (OrderedCollection with: aLoadedDie)
			 on: aBoard)
		equals: 4
]
