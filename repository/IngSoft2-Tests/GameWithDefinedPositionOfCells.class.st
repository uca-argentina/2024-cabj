Class {
	#name : #GameWithDefinedPositionOfCells,
	#superclass : #Object,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'amountOfFuel',
		'collectionOfSpaceships',
		'turnManager',
		'amountOfIndex',
		'amountOfCells',
		'numberOfLaps',
		'finishLine'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
GameWithDefinedPositionOfCells class >> numberOfSpaceships: anAmountOfSpaceships boardWithCellsAndLaps: numberOfCellsAndLaps wormholeStartAndEnd: beginningAndEnd playWithDice: aCollectionOfDice [

	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships
		  boardWithCellsAndLaps: numberOfCellsAndLaps
		  wormholeStartAndEnd: beginningAndEnd
		  playWithDice: aCollectionOfDice
]

{ #category : #action }
GameWithDefinedPositionOfCells >> checkIf: nextSpaceship hasRunOutOfFuelAt: positionOfSpaceship [

	nextSpaceship getFuel = 0 ifTrue: [
		turnManager lostTurns: 2 by: nextSpaceship.
		nextSpaceship loadFuel: amountOfFuel ]
]

{ #category : #initialization }
GameWithDefinedPositionOfCells >> collectSpaceships: anAmountOfSpaceships [

	| aSpaceship |
	collectionOfSpaceships := OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [
		aSpaceship := Spaceship launchWithFuel: amountOfFuel.
		collectionOfSpaceships add: aSpaceship.
		aSpaceship objectPosition setIndexWith: amountOfCells ].

	Spaceship initialize
]

{ #category : #initialization }
GameWithDefinedPositionOfCells >> createCollectionOfRegularCells [

	| currentLap |
	aBoard := OrderedCollection new.

	1 to: amountOfIndex do: [ :index |
		currentLap := index - 1 // amountOfCells.
		aBoard add:
			(RegularCell position: index - (amountOfCells * currentLap)) ].

	aBoard
		at: 5
		put:
		(AtomicBombCell withPostion: 5 andSpaceships: collectionOfSpaceships).

	aBoard at: 6 put: (BlackHoleCell position: 6).

	aBoard at: 7 put: (MoonWalkCell
			 withValueToMove: 4
			 inPosition: 7
			 andSpaceships: collectionOfSpaceships
			 managedBy: turnManager).

	aBoard at: 8 put: (HyperGravityCell withValueToMove: 3 inPosition: 8).

	aBoard at: 9 put: (HyperJumpCell
			 withPosition: 9
			 Parsecs: (Parsecs totalCells: 10 convertionValue: 5)
			 andValues: #( 2 1 ))
]

{ #category : #initialization }
GameWithDefinedPositionOfCells >> createWormholeOn: aBeginning and: anEnd [

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
GameWithDefinedPositionOfCells >> finalLapsOfSpaceships [

	^ collectionOfSpaceships lapsOfSpaceships
]

{ #category : #results }
GameWithDefinedPositionOfCells >> finalPositionOfSpaceships [

	^ collectionOfSpaceships cellsOfSpaceships
]

{ #category : #results }
GameWithDefinedPositionOfCells >> finalResultsOfSpaceships [

	^ collectionOfSpaceships positionsOfSpaceships
]

{ #category : #results }
GameWithDefinedPositionOfCells >> getRankingOfSpaceships [

	^ collectionOfSpaceships getRanking
]

{ #category : #results }
GameWithDefinedPositionOfCells >> getWinner [

	| maxPosition maxLap winner aDictionaryOfPositions |
	aDictionaryOfPositions := self finalResultsOfSpaceships.
	maxPosition := (aDictionaryOfPositions values collect: [ :pair |
		                pair at: 1 ]) max.

	maxLap := (aDictionaryOfPositions values collect: [ :pair |
		           (pair at: 1) = maxPosition
			           ifTrue: [ pair at: 2 ]
			           ifFalse: [ 0 ] ]) max.

	winner := aDictionaryOfPositions keys detect: [ :key |
		          | pair |
		          pair := aDictionaryOfPositions at: key.
		          (pair at: 1) = maxPosition and: (pair at: 2) = maxLap ].

	^ winner
]

{ #category : #initialization }
GameWithDefinedPositionOfCells >> initializeNumberOfSpaceships: anAmountOfSpaceships boardWithCellsAndLaps: numberOfCellsAndLaps wormholeStartAndEnd: beginningAndEnd playWithDice: aCollectionOfDice [

	amountOfCells := numberOfCellsAndLaps at: 1.
	numberOfLaps := numberOfCellsAndLaps at: 2.
	amountOfIndex := amountOfCells * numberOfLaps.

	finishLine := OrderedCollection
		              with: amountOfCells
		              with: numberOfLaps.

	collectionOfDice := aCollectionOfDice.
	amountOfFuel := collectionOfDice amountOfFaces * 2.

	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: anAmountOfSpaceships
		                          withAmountOfFuel: amountOfFuel
		                          indexCalculateWith: amountOfCells.
		
	self createCollectionOfRegularCells.
	self
		createWormholeOn: (beginningAndEnd at: 1)
		and: (beginningAndEnd at: 2).

	turnManager := TurnManager manage: collectionOfSpaceships
]

{ #category : #action }
GameWithDefinedPositionOfCells >> moveSpaceship [

	| positionOfSpaceship nextSpaceship throwResult positionOfNextSpaceship currentPosition |
	nextSpaceship := turnManager nextTurn.

	throwResult := collectionOfDice throw.
	
	positionOfNextSpaceship := nextSpaceship objectPosition.
	currentPosition := positionOfNextSpaceship getIndex .

	currentPosition + throwResult > amountOfIndex ifTrue: [
		throwResult := amountOfIndex - currentPosition ].

	positionOfSpaceship := (nextSpaceship
		                        move: throwResult
		                        on: aBoard) getPosition.

	self
		checkIf: nextSpaceship
		hasRunOutOfFuelAt: (positionOfSpaceship at: 1).

	positionOfSpaceship = finishLine ifTrue: [
		turnManager := GameOver new.
		^ self finalResultsOfSpaceships ].

	^ positionOfSpaceship
]

{ #category : #action }
GameWithDefinedPositionOfCells >> reloadSpaceship [
	| nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	nextSpaceship loadFuel: amountOfFuel.


]
