Class {
	#name : #SpaceshipWithDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipWithDieTest >> testWhenSpaceshipPlaysWithADieThenMovesBetweenOneAndTheAmountOfFaces [ 

| aDie aSpaceship aBoard |
aDie := Die of: 4. 
aSpaceship := Spaceship launch.
aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19. 

self assert: ((aSpaceship playWith: aDie on: aBoard) between: 1 and:  4).
]
