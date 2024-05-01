Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

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
