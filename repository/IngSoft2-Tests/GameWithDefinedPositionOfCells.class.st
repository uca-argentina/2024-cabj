Class {
	#name : #GameWithDefinedPositionOfCells,
	#superclass : #Object,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'amountOfFuel',
		'collectionOfSpaceships',
		'turnManager',
		'finishLine',
		'boardCreator'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'as yet unclassified' }
GameWithDefinedPositionOfCells class >> numberOfSpaceships: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships
		  withBoardCreator: aBoardCreator
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

	| aSpaceship anAmountOfCells |
	anAmountOfCells := boardCreator getCells.
	collectionOfSpaceships := OrderedCollection new.
	anAmountOfSpaceships timesRepeat: [
		aSpaceship := Spaceship launchWithFuel: amountOfFuel.
		collectionOfSpaceships add: aSpaceship.
		aSpaceship objectPosition setIndexWith: anAmountOfCells ].

	Spaceship initialize
]

{ #category : #initialization }
GameWithDefinedPositionOfCells >> createCollectionOfRegularCells [

	| currentLap anAmountOfCells anAmountOfIndex collectionOfCells |
	aBoard := OrderedCollection new.
	anAmountOfCells := boardCreator getCells.
	anAmountOfIndex := anAmountOfCells * boardCreator getLaps.
	collectionOfCells := OrderedCollection new.
	
	1 to: 20 do: [ :index |
		currentLap := index - 1 // anAmountOfCells.
		aBoard add:
			(RegularCell position: index - (anAmountOfCells * currentLap)) ].

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
	1 to: boardCreator getLaps do: [ :lap |
		positionWithinLap := boardCreator getCells * (lap - 1).
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
GameWithDefinedPositionOfCells >> initializeNumberOfSpaceships: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [
	
	boardCreator := aBoardCreator .

	finishLine := OrderedCollection
		              with: boardCreator getCells
		              with: boardCreator getLaps.

	collectionOfDice := aCollectionOfDice.
	amountOfFuel := collectionOfDice amountOfFaces * 2.

	collectionOfSpaceships := CollectionOfSpaceships
		                          numberOfSpaceships: anAmountOfSpaceships
		                          withAmountOfFuel: amountOfFuel
		                          indexCalculateWith: boardCreator getCells.

	turnManager := TurnManager manage: collectionOfSpaceships.

	self createCollectionOfRegularCells.
	self
		createWormholeOn: (aBoardCreator getBeginning)
		and: (aBoardCreator getEnding)
]

{ #category : #action }
GameWithDefinedPositionOfCells >> moveSpaceship [

	| positionOfSpaceship nextSpaceship throwResult positionOfNextSpaceship currentPosition anAmountOfIndex |
	anAmountOfIndex := boardCreator getCells * boardCreator getLaps.
	nextSpaceship := turnManager nextTurn.

	throwResult := collectionOfDice throw.
	
	positionOfNextSpaceship := nextSpaceship objectPosition.
	currentPosition := positionOfNextSpaceship getIndex .

	currentPosition + throwResult > anAmountOfIndex ifTrue: [
		throwResult := anAmountOfIndex - currentPosition ].

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
