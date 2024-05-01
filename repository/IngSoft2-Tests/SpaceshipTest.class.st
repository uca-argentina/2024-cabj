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
