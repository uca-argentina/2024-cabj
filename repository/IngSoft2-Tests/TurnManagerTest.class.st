Class {
	#name : #TurnManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TurnManagerTest >> testWhenRoundIsOverNextTurnIsTheFirstSpaceship [

| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
spaceshipOne:= Spaceship launchWithFuel: 5.
spaceshipTwo:= Spaceship launchWithFuel: 5.
collectionOfSpaceships:= OrderedCollection with: spaceshipOne with: spaceshipTwo .

aTurnManager:= TurnManager manage: (collectionOfSpaceships) .
aTurnManager nextTurn.
aTurnManager nextTurn.

self assert: (aTurnManager nextTurn) equals: spaceshipOne .
]

{ #category : #tests }
TurnManagerTest >> testWithTwoSpaceshipsReturnNextId [

| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
spaceshipOne:= Spaceship launchWithFuel: 5.
spaceshipTwo:= Spaceship launchWithFuel: 5.
collectionOfSpaceships:= OrderedCollection with: spaceshipOne with: spaceshipTwo .

aTurnManager:= TurnManager manage: (collectionOfSpaceships) .
aTurnManager nextTurn.

self assert: (aTurnManager nextTurn)  equals: spaceshipTwo .
]
