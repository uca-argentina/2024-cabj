Class {
	#name : #GameWithDefinedPositionsOfCellsTest,
	#superclass : #TestCase,
	#instVars : [
		'aBoard',
		'collectionOfDice',
		'amountOfFuel',
		'collectionOfSpaceships',
		'turnManager',
		'dictionaryOfPositions',
		'amountOfIndex',
		'amountOfCells',
		'numberOfLaps',
		'finishLine'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test01GameMovesSpaceshipWhichEntersAtomicBombThenEveryoneGoesBackToCellOne [

	| result aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 9 8 4 ).


	aGame := GameWithDefinedPositionOfCells
		         numberOfSpaceships: 3
		         boardWithCellsAndLaps: #( 10 2 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.
	result at: 3 put: 1.

	self assert: aGame finalPositionOfSpaceships equals: result
]

{ #category : #tests }
GameWithDefinedPositionsOfCellsTest >> test02 [

	| result aLoadedDie aGame |
	aLoadedDie := LoadedDie of: #( 9 8 5 ).


	aGame := GameWithDefinedPositionOfCells
		         numberOfSpaceships: 3
		         boardWithCellsAndLaps: #( 10 2 )
		         wormholeStartAndEnd: #( 2 3 )
		         playWithDice: aLoadedDie.

	aGame moveSpaceship.
	aGame moveSpaceship.
	aGame moveSpaceship.

	result := Dictionary new.
	result at: 1 put: 10.
	result at: 2 put: 3.
	result at: 3 put: 6.

	self assert: aGame finalPositionOfSpaceships equals: result
]
