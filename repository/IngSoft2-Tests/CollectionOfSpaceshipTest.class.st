Class {
	#name : #CollectionOfSpaceshipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CollectionOfSpaceshipTest >> test01CollectionOfSpaceshipsInitializeThenCellsEqualsOne [

	| aCollectionOfSpaceships result |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 2
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.

	self
		assert: aCollectionOfSpaceships cellsOfSpaceships
		equals: result
]

{ #category : #tests }
CollectionOfSpaceshipTest >> test02LapsOfSpaceshipsThenReturnsDictionaryWithLapOfEachSpaceship [

	| aCollectionOfSpaceships result |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 2
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.

	result := Dictionary new.
	result at: 1 put: 1.
	result at: 2 put: 1.

	self assert: aCollectionOfSpaceships lapsOfSpaceships equals: result
]

{ #category : #tests }
CollectionOfSpaceshipTest >> test03PositionsOfSpaceshipsThenReturnEachPositionForEverySpaceship [

	| aCollectionOfSpaceships result |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 2
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.

	result := Dictionary new.
	result at: 1 put: #( 1 1 )asOrderedCollection .
	result at: 2 put: #( 1 1 )asOrderedCollection.

	self
		assert: aCollectionOfSpaceships positionsOfSpaceships
		equals: result
]

{ #category : #tests }
CollectionOfSpaceshipTest >> test04GetRankingThenReturnsRankingOfSpaceships [

	| aCollectionOfSpaceships result |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 3
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.

	(aCollectionOfSpaceships at: 1) move: 2.
	(aCollectionOfSpaceships at: 2) move: 1.
	result := #( 1 2 3 ) asOrderedCollection.

	self assert: aCollectionOfSpaceships getRanking equals: result
]

{ #category : #tests }
CollectionOfSpaceshipTest >> test07MoveBackwardsExpectSpaceshipThreeThenEverySpaceshipExceptThreeMoves [

	| aCollectionOfSpaceships result |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 3
		                           withAmountOfFuel: 50
		                           indexCalculateWith: 20.

	(aCollectionOfSpaceships at: 1) move: 9.
	(aCollectionOfSpaceships at: 2) move: 7.
	(aCollectionOfSpaceships at: 3) move: 4.

	result := Dictionary new.
	result at: 1 put: 6.
	result at: 2 put: 4.
	result at: 3 put: 5.

	aCollectionOfSpaceships
		move: 4 negated
		except: (aCollectionOfSpaceships at: 3).
	self assert: aCollectionOfSpaceships cellsOfSpaceships equals: result
]

{ #category : #tests }
CollectionOfSpaceshipTest >> test08SizeThenReturnsSizeOfCollection [

	| aCollectionOfSpaceships |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 3
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.

	self assert: aCollectionOfSpaceships size equals: 3
]

{ #category : #tests }
CollectionOfSpaceshipTest >> test09IndexOfSpaceshipTwoThenReturnsTwo [

	| aCollectionOfSpaceships aSpaceshipTwo |
	aCollectionOfSpaceships := CollectionOfSpaceships
		                           numberOfSpaceships: 3
		                           withAmountOfFuel: 10
		                           indexCalculateWith: 20.
	aSpaceshipTwo := aCollectionOfSpaceships at: 2.

	self
		assert: (aCollectionOfSpaceships indexOf: aSpaceshipTwo)
		equals: 2
]
