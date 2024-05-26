Class {
	#name : #SpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #board }
SpaceshipTest >> createdBoardOfCellsAndLaps: anAmountOfCellsAndLaps withWormhole: startAndEnd [

	| aBoard amountOfCells numberOfLaps start end adjustMovementByLap currentLap |
	amountOfCells := anAmountOfCellsAndLaps at: 1.
	numberOfLaps := anAmountOfCellsAndLaps at: 2.
	start := startAndEnd at: 1.
	end := startAndEnd at: 2.
	aBoard := OrderedCollection new.
	1 to: amountOfCells * numberOfLaps do: [ :index |
		currentLap := (index-1) // amountOfCells.
		aBoard add:
			(RegularCell position: index - (amountOfCells * currentLap)) ].

	1 to: numberOfLaps do: [ :lap |
		adjustMovementByLap := amountOfCells * (lap - 1).
		aBoard
			at: start + adjustMovementByLap
			put: (RegularCell position: end + adjustMovementByLap).
		aBoard
			at: end + adjustMovementByLap
			put: (RegularCell position: start + adjustMovementByLap) ].
	^ aBoard
]

{ #category : #board }
SpaceshipTest >> createdBoardOfCellsAndLaps: anAmountOfCellsAndLaps withWormhole: startAndEnd withSpecialCellOn: cellAndPosition [

	| aBoard amountOfCells numberOfLaps start end adjustMovementByLap currentLap |
	amountOfCells := anAmountOfCellsAndLaps at: 1.
	numberOfLaps := anAmountOfCellsAndLaps at: 2.
	start := startAndEnd at: 1.
	end := startAndEnd at: 2.
	aBoard := OrderedCollection new.
	1 to: amountOfCells * numberOfLaps do: [ :index |
		currentLap := index - 1 // amountOfCells.
		aBoard add:
			(RegularCell position: index - (amountOfCells * currentLap)) ].

	1 to: numberOfLaps do: [ :lap |
		adjustMovementByLap := amountOfCells * (lap - 1).
		aBoard
			at: start + adjustMovementByLap
			put: (RegularCell position: end + adjustMovementByLap).
		aBoard
			at: end + adjustMovementByLap
			put: (RegularCell position: start + adjustMovementByLap) ].

	1 to: numberOfLaps do: [ :lap |
		aBoard
			at: (cellAndPosition at: 2)
			put:
			((cellAndPosition at: 1) initializePosition:
				 (cellAndPosition at: 2)) ].
	^ aBoard
]
