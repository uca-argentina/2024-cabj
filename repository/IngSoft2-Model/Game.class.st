Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'amountOfFuel',
		'collectionOfSpaceships',
		'turnManager',
		'dictionaryOfPositions',
		'amountOfIndex',
		'amountOfCells',
		'numberOfLaps'
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

{ #category : #initialization }
Game >> createCollectionOfRegularCells [

	| currentLap |
	aBoard := OrderedCollection new.

	1 to: amountOfIndex do: [ :index |
		currentLap := index - 1 // amountOfCells.
		aBoard add:
			(RegularCell position: index - (amountOfCells * currentLap)) ]
]

{ #category : #initialization }
Game >> createWormholeOn: aBeginning and: anEnd [

	| positionWithinLap |
	1 to: numberOfLaps do: [ :lap |
		positionWithinLap := amountOfCells * (lap - 1).
		aBoard
			at: aBeginning + positionWithinLap
			put: (RegularCell position: anEnd + positionWithinLap).
		aBoard
			at: anEnd + positionWithinLap
			put: (RegularCell position: aBeginning + positionWithinLap) ]
]

{ #category : #results }
Game >> finalLapsOfSpaceships [
	| dictionaryOfLaps |
	dictionaryOfLaps := Dictionary new.
	collectionOfSpaceships do: [ :spaceship |
		dictionaryOfLaps at: spaceship getId put: (spaceship objectPosition lap) ].

	^ dictionaryOfLaps 
]

{ #category : #results }
Game >> finalPositionOfSpaceships [

	| dictionaryOfCellPositions |
	dictionaryOfCellPositions:= Dictionary new.
	collectionOfSpaceships  do: [ :spaceship |
		dictionaryOfCellPositions at: spaceship getId put: (spaceship objectPosition cell) ].

	^ dictionaryOfCellPositions
]

{ #category : #results }
Game >> finalResultsOfSpaceships [

	dictionaryOfPositions := Dictionary new.
	collectionOfSpaceships do: [ :spaceship |
		dictionaryOfPositions at: spaceship getId put: (spaceship objectPosition getPosition) ].

	^ dictionaryOfPositions
]

{ #category : #results }
Game >> getRankingOfSpaceships [

	| sortedSpaceships collectionOfRanking |
	sortedSpaceships := collectionOfSpaceships  asSortedCollection: [:a :b |
    | lapsA lapsB positionsA positionsB |
    lapsA := (a objectPosition lap ).
    lapsB := (b objectPosition lap).
    positionsA := (a objectPosition cell ).
    positionsB := (b objectPosition cell).
    lapsA = lapsB
        ifTrue: [positionsA > positionsB]
        ifFalse: [lapsA > lapsB]
].


	collectionOfRanking := OrderedCollection new.
	sortedSpaceships do: [ :spaceship |
		collectionOfRanking add: spaceship getId ].

	^ collectionOfRanking first: 3
]

{ #category : #results }
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

	amountOfCells := numberOfCellsAndLaps at: 1.
	numberOfLaps := numberOfCellsAndLaps at: 2.
	amountOfIndex := amountOfCells * numberOfLaps.
	self createCollectionOfRegularCells.
	self createWormholeOn: (beginningAndEnd at: 1) and: (beginningAndEnd at: 2).

	collectionOfDice := aCollectionOfDice.
	amountOfFuel := collectionOfDice amountOfFaces * 2.

	self collectSpaceships: anAmountOfSpaceships.

	turnManager := TurnManager manage: collectionOfSpaceships
]

{ #category : #action }
Game >> moveSpaceship [

	| positionOfSpaceship nextSpaceship throwResult finishLine currentPosition |
	nextSpaceship := turnManager nextTurn.

	throwResult := collectionOfDice throw.

	currentPosition := nextSpaceship objectPosition getIndexWith:
		                   amountOfCells.

	currentPosition + throwResult > amountOfIndex ifTrue: [
		throwResult := amountOfIndex - currentPosition ].

	positionOfSpaceship := (nextSpaceship
		                        move: throwResult
		                        on: aBoard
		                        of: amountOfCells) getPosition.

	self
		checkIf: nextSpaceship
		hasRunOutOfFuelAt: (positionOfSpaceship at: 1).

	finishLine := OrderedCollection
		              with: amountOfCells
		              with: numberOfLaps.
	positionOfSpaceship = finishLine ifTrue: [
		turnManager := GameOver new.
		^ self finalResultsOfSpaceships ].

	^ positionOfSpaceship
]

{ #category : #action }
Game >> reloadSpaceship [
	| nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	nextSpaceship loadFuel: amountOfFuel.


]
