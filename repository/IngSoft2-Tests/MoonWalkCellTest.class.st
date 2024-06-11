Class {
	#name : #MoonWalkCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #board }
MoonWalkCellTest >> createdBoardOfCellsAndLaps: anAmountOfCellsAndLaps withWormhole: startAndEnd withSpecialCellOn: cellAndPosition [

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
			at: ((cellAndPosition at: 2) )
			put:
			((cellAndPosition at: 1) initializePosition:
				( (cellAndPosition at: 2)  )) ].
	^ aBoard
]

{ #category : #tests }
MoonWalkCellTest >> test01MoonWalkEnterThenReturnsPositionOfCell [

	| aMoonWalkCell aCollectionOfSpaceships collectionOfSpecialCellAndPosition aBoard aTurnManager |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 3
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.

	aTurnManager := TurnManager manage: aCollectionOfSpaceships.

	aMoonWalkCell := MoonWalkCell
		                 withValueToMove: 4
		                 inPosition: 5
		                 andSpaceships: aCollectionOfSpaceships
		                 managedBy: aTurnManager.

	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: aMoonWalkCell
		                                      with: 5.

	(aCollectionOfSpaceships at: 1) move: 9.
	(aCollectionOfSpaceships at: 2) move: 7.

	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.
	(aCollectionOfSpaceships at: 3) move: 4.

	self assert: ((aCollectionOfSpaceships at: 3) objectPosition) cell equals: 5
]

{ #category : #tests }
MoonWalkCellTest >> test02SpaceshipThreeEntersMoonWalkThenEverySpaceshipExceptThreeMovesBackwards [

	| aMoonWalkCell aCollectionOfSpaceships collectionOfSpecialCellAndPosition aBoard result aTurnManager |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 3
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.

	aTurnManager := TurnManager manage: aCollectionOfSpaceships.

	aMoonWalkCell := MoonWalkCell
		                 withValueToMove: 4
		                 inPosition: 5
		                 andSpaceships: aCollectionOfSpaceships
		                 managedBy: aTurnManager.

	collectionOfSpecialCellAndPosition := OrderedCollection
		                                      with: aMoonWalkCell
		                                      with: 5.

	(aCollectionOfSpaceships at: 1) move: 9.
	(aCollectionOfSpaceships at: 2) move: 7.

	aBoard := self
		          createdBoardOfCellsAndLaps: #( 20 1 )
		          withWormhole: #( 2 3 )
		          withSpecialCellOn: collectionOfSpecialCellAndPosition.

	result := Dictionary new.
	result at: 1 put: 6.
	result at: 2 put: 4.
	result at: 3 put: 5.

	aTurnManager nextTurn.
	aTurnManager nextTurn.
	aTurnManager nextTurn.

	(aCollectionOfSpaceships at: 3) move: 4.

	self assert: aCollectionOfSpaceships cellsOfSpaceships equals: result
]
