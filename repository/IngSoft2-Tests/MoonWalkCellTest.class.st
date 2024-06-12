Class {
	#name : #MoonWalkCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkCellTest >> test01MoonWalkEnterThenReturnsPositionOfCell [

	| aMoonWalkCell aCollectionOfSpaceships aTurnManager |
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
	aTurnManager nextTurn.
	(aCollectionOfSpaceships at: 1) move: 9.
	aTurnManager nextTurn.
	(aCollectionOfSpaceships at: 2) move: 7.
	aTurnManager nextTurn.
	(aCollectionOfSpaceships at: 3) move: 4.

	self assert: ((aCollectionOfSpaceships at: 3) objectPosition) cell equals: 5
]

{ #category : #tests }
MoonWalkCellTest >> test02SpaceshipThreeEntersMoonWalkThenEverySpaceshipExceptThreeMovesBackwards [

	| aMoonWalkCell aCollectionOfSpaceships result aTurnManager |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 3
		                           withAmountOfFuel: 50
		                           indexCalculateWith: 20.

	aTurnManager := TurnManager manage: aCollectionOfSpaceships.

	aMoonWalkCell := MoonWalkCell
		                 withValueToMove: 4
		                 inPosition: 5
		                 andSpaceships: aCollectionOfSpaceships
		                 managedBy: aTurnManager.
	aTurnManager nextTurn.
	(aCollectionOfSpaceships at: 1) move: 9.
	aTurnManager nextTurn.
	(aCollectionOfSpaceships at: 2) move: 7.
	aTurnManager nextTurn.
	(aCollectionOfSpaceships at: 3) move: 4.
	
	aMoonWalkCell enter.
	result := Dictionary new.
	result at: 1 put: 6.
	result at: 2 put: 4.
	result at: 3 put: 5.


	self assert: aCollectionOfSpaceships cellsOfSpaceships equals: result
]
