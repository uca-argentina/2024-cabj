Class {
	#name : #Game,
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
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> numberOfSpaceships: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [

	^ self new
		  initializeNumberOfSpaceships: anAmountOfSpaceships
		  withBoardCreator: aBoardCreator
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
Game >> createCollectionOfRegularCells [

	| currentLap anAmountOfCells anAmountOfLaps anAmountOfIndex|
	anAmountOfCells := boardCreator getCells.
	anAmountOfLaps := boardCreator getLaps.
	anAmountOfIndex := anAmountOfLaps * anAmountOfCells .
	aBoard := OrderedCollection new.

	1 to: anAmountOfIndex do: [ :index |
		currentLap := index - 1 // anAmountOfCells.
		aBoard add:
			(RegularCell position: index - (anAmountOfCells * currentLap)) ]
]

{ #category : #initialization }
Game >> createWormholeOn: aBeginning and: anEnd [

	| positionWithinLap anAmountOfCells anAmountOfLaps |
	anAmountOfCells := boardCreator getCells.
	anAmountOfLaps := boardCreator getLaps.

	1 to: anAmountOfLaps do: [ :lap |
		positionWithinLap := anAmountOfCells * (lap - 1).
		aBoard
			at: aBeginning + positionWithinLap
			put: (RegularCell position: anEnd + positionWithinLap).
		aBoard
			at: anEnd + positionWithinLap
			put: (RegularCell position: aBeginning + positionWithinLap) ]
]

{ #category : #results }
Game >> finalLapsOfSpaceships [

	^ collectionOfSpaceships lapsOfSpaceships
]

{ #category : #results }
Game >> finalPositionOfSpaceships [

	^ collectionOfSpaceships cellsOfSpaceships
]

{ #category : #results }
Game >> finalResultsOfSpaceships [

	^ collectionOfSpaceships positionsOfSpaceships
]

{ #category : #results }
Game >> getRankingOfSpaceships [

	^ collectionOfSpaceships getRanking
]

{ #category : #results }
Game >> getWinner [

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
Game >> initializeNumberOfSpaceships: anAmountOfSpaceships withBoardCreator: aBoardCreator playWithDice: aCollectionOfDice [
	
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
Game >> moveSpaceship [

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
Game >> reloadSpaceship [
	| nextSpaceship |
	nextSpaceship := turnManager nextTurn.
	nextSpaceship loadFuel: amountOfFuel.


]
