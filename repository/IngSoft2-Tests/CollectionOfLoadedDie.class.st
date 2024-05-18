Class {
	#name : #CollectionOfLoadedDie,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfLoadedDie'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
CollectionOfLoadedDie class >> of: aCollectionOfFaces [ 
	^ (self new) initializeOf: aCollectionOfFaces .
]

{ #category : #initialization }
CollectionOfLoadedDie >> initializeOf: aCollectionOfFaces [

	aCollectionOfLoadedDie := aCollectionOfFaces collect: [
		                          :amountOfFaces |
		                          LoadedDie of: amountOfFaces ]
]

{ #category : #action }
CollectionOfLoadedDie >> throw [
	^ aCollectionOfLoadedDie sum: [:die | die throw].
]
