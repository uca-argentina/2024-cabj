Class {
	#name : #GameLoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #testsGame002 }
GameLoadedDieTest >> test00GameCreatedWithBoxesALoadedDieMovesSpaceshipSixPositions [

	| aGame |
	aGame := GameLoadedDie 
		         withBoardBoxes: 10
		         wormholeStartAndEnd: #(2 3)
		         playWithDice: #(6).

	self assert: aGame moveSpaceship equals: 6
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test01GameMovesSpaceshipTwiceWithLoadedDieOf6ThenReturnsTwelve [

	| aGame |
	aGame := GameLoadedDie 
		         withBoardBoxes: 15
		         wormholeStartAndEnd: #(4 7)
		         playWithDice: #(6).
	aGame moveSpaceship.

	self assert: aGame moveSpaceship equals: 12
]

{ #category : #testsGame002 }
GameLoadedDieTest >> test02GameMovesSpaceshipFallsOnWormholeThenPositionIsTheOtherSide [

| aGame |
aGame:= GameLoadedDie withBoardBoxes: 15 wormholeStartAndEnd: #(6 8) playWithDice: #(6) .

self assert: aGame moveSpaceship equals: 8. 


]

{ #category : #testsGame002 }
GameLoadedDieTest >> test03WhenSpaceshipReachesTheFinishLineThenIsGameLoadedDieOver [

| aGame |
aGame:= GameLoadedDie withBoardBoxes: 12 wormholeStartAndEnd: #(6 8) playWithDice: 6 asOrderedCollection.
aGame moveSpaceship.

self assert: aGame moveSpaceship equals: 'Game Over'. 


]

{ #category : #testsGame002 }
GameLoadedDieTest >> test04 [

| aGame |
aGame:= GameLoadedDie numberOfSpaceships: 2 boardBoxes: 50 wormholeStartAndEnd: #(40 45) playWithDice: #(6).
aGame moveSpaceship .
aGame moveSpaceship .

self assert: aGame moveSpaceship equals: 12 . 


]
