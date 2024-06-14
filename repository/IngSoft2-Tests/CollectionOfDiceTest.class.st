Class {
	#name : #CollectionOfDiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CollectionOfDiceTest >> test001WhenCollectionThrowThenResultIsBetweenMinAndMaxOfSumOfFaces [

	| aCollectionOfDie  dice|
	dice:= OrderedCollection with: (Die of:3) with: (Die of: 3).
	aCollectionOfDie := Dice of: dice.
	self assert: (aCollectionOfDie throw between: 2 and: 6)
]

{ #category : #tests }
CollectionOfDiceTest >> test002WhenCollectionInitializeWithTwoDiceOfThreeFacesThenAmountOfFacesEqualsSix [

	| aCollectionOfDie dice |
	dice:= OrderedCollection with: (Die of:3) with: (Die of: 3).
	aCollectionOfDie := Dice of: dice.
	self assert: aCollectionOfDie amountOfFaces equals: 6
]
