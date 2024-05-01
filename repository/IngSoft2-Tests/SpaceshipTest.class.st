Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
SpaceshipTest >> testSpaceship006 [
| aSpaceship |
aSpaceship:= Spaceship launch .
aSpaceship  move:2.
self assert: (aSpaceship move: 1) equals: 3.
]

{ #category : #tests }
SpaceshipTest >> testSpaceshipInitializeInPositionZero [

| aSpaceship |

aSpaceship:= Spaceship launch.

self assert: (aSpaceship move) equals: 1.
]

{ #category : #tests }
SpaceshipTest >> testSpaceshipMovesTwiceAndIsInPositionTwo [

| aSpaceship |

aSpaceship:= Spaceship launch.
aSpaceship move.

self assert: (aSpaceship move) equals: 2.
]

{ #category : #tests }
SpaceshipTest >> testWhenASpaceshipMovesTwiceWithTwoJumps [
| aSpaceship |
aSpaceship:= Spaceship launch.
self assert: (aSpaceship move:2) equals: 2.
]

{ #category : #tests }
SpaceshipTest >> testWhenSpaceshipMovesTwiceThenPositionReturnsTwo [
| aSpaceship |
aSpaceship:= Spaceship launch .
aSpaceship move .
aSpaceship move.
self assert: aSpaceship position equals: 2.
]

{ #category : #tests }
SpaceshipTest >> testWhenSpaceshipThenPositionReturnsZero [

| aSpaceship |
aSpaceship:= Spaceship launch .
self assert: aSpaceship position equals: 0.
]
