Class {
	#name : #TurnManagerWithIdTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
TurnManagerWithIdTest >> testTurnManagerWithSpaceshipWithIdNextTurnReturnsId [

| aTurnManager |
aTurnManager:= TurnManagerWithId manage: (SpaceshipWithId launch: 1)asOrderedCollection .

self assert: aTurnManager nextTurn equals: 1.
]

{ #category : #tests }
TurnManagerWithIdTest >> testWhenRoundIsOverNextTurnIsTheFirstSpaceship [

| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
spaceshipOne:= SpaceshipWithId launch: 1.
spaceshipTwo:= SpaceshipWithId launch: 2.
collectionOfSpaceships:= OrderedCollection with: spaceshipOne with: spaceshipTwo .

aTurnManager:= TurnManagerWithId manage: (collectionOfSpaceships) .
aTurnManager nextTurn.
aTurnManager nextTurn.

self assert: aTurnManager nextTurn equals: 1.
]

{ #category : #tests }
TurnManagerWithIdTest >> testWithTwoSpaceshipsReturnNextId [

| aTurnManager spaceshipOne spaceshipTwo collectionOfSpaceships |
spaceshipOne:= SpaceshipWithId launch: 1.
spaceshipTwo:= SpaceshipWithId launch: 2.
collectionOfSpaceships:= OrderedCollection with: spaceshipOne with: spaceshipTwo .

aTurnManager:= TurnManagerWithId manage: (collectionOfSpaceships) .
aTurnManager nextTurn.

self assert: aTurnManager nextTurn equals: 2.
]
