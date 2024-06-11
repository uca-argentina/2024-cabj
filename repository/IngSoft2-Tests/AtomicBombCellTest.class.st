Class {
	#name : #AtomicBombCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AtomicBombCellTest >> test01WhenAnAtomicBombCellsEnterThenReturnsOne [

	| anAtomicBombCell aCollectionOfSpaceships |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 3
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.

	anAtomicBombCell := AtomicBombCell
		                    withPostion: 5
		                    andSpaceships: aCollectionOfSpaceships.

	self assert: anAtomicBombCell enter equals: 1
]

{ #category : #tests }
AtomicBombCellTest >> test02AtomicBombEnterThenMoveEverySpaceshipToOne [

	| anAtomicBombCell aCollectionOfSpaceships result |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 3
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.

	(aCollectionOfSpaceships at: 1) move: 9.
	(aCollectionOfSpaceships at: 2) move: 7.
	(aCollectionOfSpaceships at: 3) move: 4.

	anAtomicBombCell := AtomicBombCell
		                    withPostion: 5
		                    andSpaceships: aCollectionOfSpaceships.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.
	result at: 3 put: 1.

	anAtomicBombCell enter.
	self assert: aCollectionOfSpaceships cellsOfSpaceships equals: result
]
