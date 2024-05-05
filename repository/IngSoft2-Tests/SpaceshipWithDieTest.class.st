Class {
	#name : #SpaceshipWithDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipWithDieTest >> testSpaceshipPlaysWithTwoDiceThenPositionIsBetweenMinAndMax [

| aSpaceship aDieOne aDieTwo aBoard |
aSpaceship := Spaceship launch. 
aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19.
aDieOne := Die of: 4.
aDieTwo := Die of: 10.

self assert: ((aSpaceship playWith: (OrderedCollection with: aDieOne with: aDieTwo)  on: aBoard)between: 2 and: 14).
]

{ #category : #tests }
SpaceshipWithDieTest >> testWhenSpaceshipPlaysWithADieThenMovesBetweenOneAndTheAmountOfFaces [ 

| aDie aSpaceship aBoard |
aDie := Die of: 4. 
aSpaceship := Spaceship launch.
aBoard:= Board of: 20 withWormholeBeginning: 18 andEnding: 19. 

self assert: ((aSpaceship playWith: (OrderedCollection with: aDie) on: aBoard) between: 1 and:  4).
]
