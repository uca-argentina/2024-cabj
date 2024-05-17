Class {
	#name : #TurnManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TurnManagerTest >> testWhenRoundIsOverNextTurnIsTheFirstSpaceship [

| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
spaceshipOne:= Spaceship launch.
spaceshipTwo:= Spaceship launch.
collectionOfSpaceships:= OrderedCollection with: spaceshipOne with: spaceshipTwo .

aTurnManager:= TurnManager manage: (collectionOfSpaceships) .
aTurnManager nextTurn.
aTurnManager nextTurn.

self assert: (aTurnManager nextTurn) equals: spaceshipOne .
]

{ #category : #tests }
TurnManagerTest >> testWithSpaceshipWithoutIdReturnsTheSpaceship [

| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
spaceshipOne:= Spaceship launch.
spaceshipTwo:= Spaceship launch.
collectionOfSpaceships:= OrderedCollection with: spaceshipOne with: spaceshipTwo .

aTurnManager:= TurnManager manage: (collectionOfSpaceships) .
aTurnManager nextTurn.
aTurnManager nextTurn.

self assert: aTurnManager nextTurn equals: spaceshipOne.
]

{ #category : #tests }
TurnManagerTest >> testWithTwoSpaceshipsReturnNextId [

| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
spaceshipOne:= Spaceship launch.
spaceshipTwo:= Spaceship launch.
collectionOfSpaceships:= OrderedCollection with: spaceshipOne with: spaceshipTwo .

aTurnManager:= TurnManager manage: (collectionOfSpaceships) .
aTurnManager nextTurn.

self assert: (aTurnManager nextTurn)  equals: spaceshipTwo .
]
