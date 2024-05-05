Class {
	#name : #TurnManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TurnManagerTest >> testTurnManagerWithSpaceshipWithIdNextTurnReturnsId [

| aTurnManager |
aTurnManager:= TurnManager manage: (SpaceshipWithId launch: 1).

self assert: aTurnManager nextTurn equals: 1.
]
