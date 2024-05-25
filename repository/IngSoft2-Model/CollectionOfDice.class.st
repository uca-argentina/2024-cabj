Class {
	#name : #CollectionOfDice,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfDie'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CollectionOfDice class >> of: aCollectionOfFaces [ 
	^ (self new) initializeOf: aCollectionOfFaces .
]

{ #category : #'set and get' }
CollectionOfDice >> amountOfFaces [
	^ aCollectionOfDie sum: [:die | die amountOfFaces].
]

{ #category : #initialization }
CollectionOfDice >> initializeOf: aCollectionOfFaces [

	aCollectionOfDie := aCollectionOfFaces collect: [
		                          :amountOfFaces |
		                          Die of: amountOfFaces ]
]

{ #category : #action }
CollectionOfDice >> throw [
	^ aCollectionOfDie sum: [:die | die throw].
]
