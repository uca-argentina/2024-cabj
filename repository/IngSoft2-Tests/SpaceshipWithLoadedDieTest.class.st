Class {
	#name : #SpaceshipWithLoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testASpaceshipPlaysWithALoadedDieAndMovesThreePositions [

| aSpaceship aLoadedDie |
aSpaceship := Spaceship new. 

aLoadedDie := LoadedDie of: 3.

self assert: (aSpaceship playWith: aLoadedDie) equals: 3.
]
