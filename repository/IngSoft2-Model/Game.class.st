Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'amountOfFuel',
		'collectionOfSpaceships',
		'turnManager',
		'dictionaryOfPositions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> numberOfSpaceships: anAmountOfSpaceships boardWithCellsAndLaps: numberOfCellsAndLaps wormholeStartAndEnd: beginningAndEnd playWithDice: aCollectionOfDice [

	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships
		  boardWithCellsAndLaps: numberOfCellsAndLaps
		  wormholeStartAndEnd: beginningAndEnd
		  playWithDice: aCollectionOfDice
]

{ #category : #action }
Game >> checkIf: nextSpaceship hasRunOutOfFuelAt: positionOfSpaceship [

	nextSpaceship getFuel = 0 ifTrue: [
		turnManager lostTurns: 2 by: nextSpaceship.
		nextSpaceship loadFuel: amountOfFuel ]
]

{ #category : #initialization }
Game >> collectSpaceships: anAmountOfSpaceships [

	collectionOfSpaceships := OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [
		collectionOfSpaceships add: (Spaceship launchWithFuel: amountOfFuel ) ].

	Spaceship initialize
]

{ #category : #accessing }
Game >> finalLapsOfSpaceships [
	| dictionaryOfLaps |
	dictionaryOfLaps := Dictionary new.
	collectionOfSpaceships do: [ :spaceship |
		dictionaryOfLaps at: spaceship getId put: (spaceship position at: 2) ].

	^ dictionaryOfLaps 
]

{ #category : #accessing }
Game >> finalPositionOfSpaceships [

	| dictionaryOfCellPositions |
	dictionaryOfCellPositions:= Dictionary new.
	collectionOfSpaceships  do: [ :spaceship |
		dictionaryOfCellPositions at: spaceship getId put: (spaceship position at: 1) ].

	^ dictionaryOfCellPositions
]

{ #category : #action }
Game >> finalResultsOfSpaceships [

	dictionaryOfPositions := Dictionary new.
	collectionOfSpaceships do: [ :spaceship |
		dictionaryOfPositions at: spaceship getId put: (spaceship position) ].

	^ dictionaryOfPositions
]

{ #category : #accessing }
Game >> getRankingOfSpaceships [

	| sortedSpaceships collectionOfRanking |
	sortedSpaceships := collectionOfSpaceships  asSortedCollection: [:a :b |
    | lapsA lapsB positionsA positionsB |
    lapsA := (a position at: 2 ).
    lapsB := (b position at: 2).
    positionsA := (a position at: 1 ).
    positionsB := (b position at: 1).
    lapsA = lapsB
        ifTrue: [positionsA > positionsB]
        ifFalse: [lapsA > lapsB]
].


	collectionOfRanking := OrderedCollection new.
	sortedSpaceships do: [ :spaceship |
		collectionOfRanking add: spaceship getId ].

	^ collectionOfRanking first: 3
]

{ #category : #accessing }
Game >> getWinner [

	| maxPosition maxLap winner |
	maxPosition := (dictionaryOfPositions values collect: [ :pair |
		                pair at: 1 ]) max.

	maxLap := (dictionaryOfPositions values collect: [ :pair |
		           (pair at: 1) = maxPosition
			           ifTrue: [ pair at: 2 ]
			           ifFalse: [ 0 ] ]) max.

	winner := dictionaryOfPositions keys detect: [ :key |
		          | pair |
		          pair := dictionaryOfPositions at: key.
		          (pair at: 1) = maxPosition and: (pair at: 2) = maxLap ].

	^ winner
]

{ #category : #initialization }
Game >> initializeNumberOfSpaceships: anAmountOfSpaceships boardWithCellsAndLaps: numberOfCellsAndLaps wormholeStartAndEnd: beginningAndEnd playWithDice: aCollectionOfDice [

	aBoard := Board
		          ofCells: (numberOfCellsAndLaps at: 1)
		          numberOfLaps: (numberOfCellsAndLaps at: 2)
		          withWormholeBeginning: (beginningAndEnd at: 1)
		          andEnding: (beginningAndEnd at: 2).

	collectionOfDice := aCollectionOfDice.
	amountOfFuel := collectionOfDice amountOfFaces * 2.

	self collectSpaceships: anAmountOfSpaceships.

	turnManager := TurnManager manage: collectionOfSpaceships
]

{ #category : #action }
Game >> moveSpaceship [

	| positionOfSpaceship nextSpaceship throwResult |
	nextSpaceship := turnManager nextTurn.

	throwResult := aBoard
		               adjustMovementWithinBoundsFrom:
		               nextSpaceship position
		               by: collectionOfDice throw.

	positionOfSpaceship := nextSpaceship move: throwResult on: aBoard.
	
	self checkIf: nextSpaceship hasRunOutOfFuelAt: (positionOfSpaceship at:1).

	positionOfSpaceship = aBoard finishLine ifTrue: [
		turnManager := GameOver new.
		^ self finalResultsOfSpaceships  ].

	^ positionOfSpaceship
]

{ #category : #action }
Game >> reloadSpaceship [
	| nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	nextSpaceship loadFuel: amountOfFuel.


]
