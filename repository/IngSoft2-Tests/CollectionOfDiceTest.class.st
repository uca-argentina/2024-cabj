Class {
	#name : #CollectionOfDiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CollectionOfDiceTest >> test001WhenCollectionThrowThenResultIsBetweenMinAndMaxOfSumOfFaces [

	| aCollectionOfDie |
	aCollectionOfDie := CollectionOfDice of: #( 3 3 ).
	self assert: (aCollectionOfDie throw between: 2 and: 6)
]

{ #category : #tests }
CollectionOfDiceTest >> test002WhenCollectionInitializeWithTwoDiceOfThreeFacesThenAmountOfFacesEqualsSix [

	| aCollectionOfDie |
	aCollectionOfDie := CollectionOfDice of: #( 3 3 ).
	self assert: aCollectionOfDie amountOfFaces equals: 6
]
