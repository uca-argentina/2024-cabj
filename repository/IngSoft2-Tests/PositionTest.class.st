Class {
	#name : #PositionTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PositionTest >> test01PositioninitializeThenCellEqualsOne [

	| aPosition |
	aPosition := Position startGame.

	self assert: aPosition cell equals: 1
]

{ #category : #tests }
PositionTest >> test02PositioninitializeThenLapEqualsOne [

	| aPosition |
	aPosition := Position startGame.

	self assert: aPosition lap equals: 1
]

{ #category : #tests }
PositionTest >> test03PositioninitializeSetCellTwoThenCellEqualsTwo [

	| aPosition |
	aPosition := Position startGame.
	aPosition updateIndexWith: 10.
	aPosition updateCellAndLapWith: 2.

	self assert: aPosition cell equals: 2
]

{ #category : #tests }
PositionTest >> test04PositioninitializeSetLapTwoThenLapEqualsTwo [

	| aPosition |
	aPosition := Position startGame.
	aPosition updateIndexWith: 10.
	aPosition updateCellAndLapWith: 11.

	self assert: aPosition lap equals: 2
]

{ #category : #tests }
PositionTest >> test05PositionInitializeThenGetPositionEqualsOrderedCollectionWithCellAndLap [

	| aPosition position |
	aPosition := Position startGame.
	position := OrderedCollection with: 1 with: 1.

	self assert: aPosition position equals: position
]

{ #category : #tests }
PositionTest >> test06PositionInitializeThenGetIndexWithEqualsOne [

	| aPosition |
	aPosition := Position startGame.

	self assert: (aPosition updateIndexWith: 10) equals: 1
]

{ #category : #tests }
PositionTest >> test07PositionCellOneLapTwoWithTenCellsThenIndexEqualsEleven [

	| aPosition |
	aPosition := Position startGame.
	aPosition updateIndexWith: 10.
	aPosition updateCellAndLapWith: 11.

	self assert: aPosition index equals: 11
]

{ #category : #tests }
PositionTest >> test08PositionInitializeThenCompletedLapsEqualsZero [

	| aPosition |
	aPosition := Position startGame.

	self assert: (aPosition completedLapsWith: 10) equals: 0
]

{ #category : #tests }
PositionTest >> test09PositionLapSetOnTwoThenCompletedLapsEqualsAmountOfCells [

	| aPosition |
	aPosition := Position startGame.
	aPosition updateIndexWith: 10.
	aPosition updateCellAndLapWith: 11.

	self assert: (aPosition completedLaps) equals: 10
]

{ #category : #tests }
PositionTest >> test10CalculateLapWithNewIndexElevenThenCompletedOneLap [

	| aPosition |
	aPosition := Position startGame.
	aPosition updateIndexWith: 10.
	aPosition updateCellAndLapWith: 11.
	self assert: aPosition completedLaps equals: 10
]

{ #category : #tests }
PositionTest >> test11DoOneLapThenCellEqualsOne [

	| aPosition |
	aPosition := Position startGame.
	aPosition updateIndexWith: 10.
	aPosition updateCellAndLapWith: 11.
	self assert: aPosition cell equals: 1
]
