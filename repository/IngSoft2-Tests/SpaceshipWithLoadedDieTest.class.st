Class {
	#name : #SpaceshipWithLoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testASpaceshipPlaysWithALoadedDieThenReturnsThree [

| aSpaceship aLoadedDie |
aSpaceship := Spaceship new. 

aLoadedDie := LoadedDie of: 3.

self assert: (aSpaceship playWith: aLoadedDie) equals: 3.
]

{ #category : #tests }
SpaceshipWithLoadedDieTest >> testWhenSpaceshipPlaysWithALoadedDieThenReturnsTheAmountOfFaces [

| aSpaceship aLoadedDie |
aSpaceship := Spaceship new. 

aLoadedDie := LoadedDie of: 4.

self assert: (aSpaceship playWith: aLoadedDie) equals: 4.
]
