Class {
	#name : #CollectionOfDie,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfDie'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
CollectionOfDie class >> of: aCollectionOfFaces [ 
	^ (self new) initializeOf: aCollectionOfFaces .
]

{ #category : #initialization }
CollectionOfDie >> initializeOf: aCollectionOfFaces [

	aCollectionOfDie := aCollectionOfFaces collect: [
		                          :amountOfFaces |
		                          Die of: amountOfFaces ]
]

{ #category : #action }
CollectionOfDie >> throw [
	^ aCollectionOfDie sum: [:die | die throw].
]
