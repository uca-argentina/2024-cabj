Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testGame004 [

| aGame |
aGame:= Game begin: 4.
aGame moveSpaceship.
aGame moveSpaceship.

self assert: (aGame moveSpaceship) equals:3.
]

{ #category : #tests }
GameTest >> testGameFinishWhenTheSpaceshipIsInPositionThree [

| aGame |
aGame:= Game begin:3.
aGame moveSpaceship.
aGame moveSpaceship.

self assert: (aGame moveSpaceship) equals:'Finished game'.
]

{ #category : #tests }
GameTest >> testTheGameBeginsWithOneSpaceshipAndItMovesOnce [

| aGame |
aGame:= Game begin:3.

self assert: (aGame moveSpaceship) equals:1.
]

{ #category : #tests }
GameTest >> testTheGameMovesTheSpaceshipTwice [

| aGame |
aGame:= Game begin:3.
aGame moveSpaceship.

self assert: (aGame moveSpaceship) equals:2.
]
