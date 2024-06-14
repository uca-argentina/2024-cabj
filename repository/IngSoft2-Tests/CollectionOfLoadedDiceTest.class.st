Class {
	#name : #CollectionOfLoadedDiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CollectionOfLoadedDiceTest >> test001WhenCollectionOfTwoLoadedDiceThrowThenReturnsSumOfFaces [

	| aCollectionOfLoadedDie dice|	
	dice:=OrderedCollection with: (LoadedDie of:#(3)) with: (LoadedDie of:#(3)).
	aCollectionOfLoadedDie := Dice of: dice .
	self assert: aCollectionOfLoadedDie throw equals: 6
]

{ #category : #tests }
CollectionOfLoadedDiceTest >> test002CollectionInitializeWithOneDieThrowThenReturnsDiesFaces [

	| aCollectionOfLoadedDie dice |
	dice:=OrderedCollection with: (LoadedDie of:#(3)).
	aCollectionOfLoadedDie := Dice of: dice.
	self assert: aCollectionOfLoadedDie throw equals: 3
]

{ #category : #tests }
CollectionOfLoadedDiceTest >> test003WhenCollectionInitializeWithTwoDiceOfThreeThenAmountOfFacesEqualsSix [

	| aCollectionOfLoadedDie dice|
	dice:=OrderedCollection with: (LoadedDie of:#(3)) with: (LoadedDie of:#(3)).
	aCollectionOfLoadedDie := Dice of:dice.
	self assert: aCollectionOfLoadedDie amountOfFaces equals: 6
]
