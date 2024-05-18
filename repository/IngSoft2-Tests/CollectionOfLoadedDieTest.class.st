Class {
	#name : #CollectionOfLoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CollectionOfLoadedDieTest >> test001WhenCollectionOfTwoLoadedDiceThrowThenReturnsSumOfFaces [

	| aCollectionOfLoadedDie |
	aCollectionOfLoadedDie := CollectionOfLoadedDie of: #(3 3).
	self assert: aCollectionOfLoadedDie throw equals: 6
]

{ #category : #tests }
CollectionOfLoadedDieTest >> test002CollectionInitializeWithOneDieThrowThenReturnsDiesFaces [

	| aCollectionOfLoadedDie |
	aCollectionOfLoadedDie := CollectionOfLoadedDie of: (3 asOrderedCollection).
	self assert: aCollectionOfLoadedDie throw equals: 3
]
