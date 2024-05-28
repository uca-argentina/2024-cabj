Class {
	#name : #CollectionOfLoadedDice,
	#superclass : #Object,
	#instVars : [
		'aCollectionOfLoadedDie'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
CollectionOfLoadedDice class >> of: aCollectionOfFaces [ 
	^ (self new) initializeOf: aCollectionOfFaces .
]

{ #category : #initialization }
CollectionOfLoadedDice >> initializeOf: aCollectionOfFaces [

	aCollectionOfLoadedDie := aCollectionOfFaces collect: [
		                          :amountOfFaces |
		                          LoadedDie of: amountOfFaces ]
]

{ #category : #action }
CollectionOfLoadedDice >> throw [

	^ aCollectionOfLoadedDie sum: [ :die | die throw ]
]
