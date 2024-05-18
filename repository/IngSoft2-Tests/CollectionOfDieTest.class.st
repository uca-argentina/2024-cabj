Class {
	#name : #CollectionOfDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CollectionOfDieTest >> test001WhenCollectionThrowThenResultIsBetweenMinAndMaxOfSumOfFaces [

	| aCollectionOfDie |
	aCollectionOfDie := CollectionOfDie of: #( 3 3 ).
	self assert: (aCollectionOfDie throw between: 2 and: 6)
]
