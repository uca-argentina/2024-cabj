Class {
	#name : #CollectionOfLoadedDiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CollectionOfLoadedDiceTest >> test001WhenCollectionOfTwoLoadedDiceThrowThenReturnsSumOfFaces [

	| aCollectionOfLoadedDie |
	aCollectionOfLoadedDie := CollectionOfLoadedDice of: #(3 3).
	self assert: aCollectionOfLoadedDie throw equals: 6
]

{ #category : #tests }
CollectionOfLoadedDiceTest >> test002CollectionInitializeWithOneDieThrowThenReturnsDiesFaces [

	| aCollectionOfLoadedDie |
	aCollectionOfLoadedDie := CollectionOfLoadedDice of: (3 asOrderedCollection).
	self assert: aCollectionOfLoadedDie throw equals: 3
]
