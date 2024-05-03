Class {
	#name : #SpaceshipWithDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipWithDieTest >> testWhenSpaceshipPlaysWithADieThenMovesBetweenOneAndTheAmountOfFaces [ 

| aDie aSpaceship |
aDie := Die of: 4. 
aSpaceship := Spaceship launch. 

self assert: ((aSpaceship playWith: aDie) between: 1 and:  4).
]
