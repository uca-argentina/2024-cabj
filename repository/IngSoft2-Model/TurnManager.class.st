Class {
	#name : #TurnManager,
	#superclass : #Object,
	#instVars : [
		'spaceships'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
TurnManager class >> collectionSpaceships: aSpaceshipWithId [ 
	self shouldBeImplemented.
]

{ #category : #'as yet unclassified' }
TurnManager class >> manage: collectionOfSpaceships [ 
	^(self new) initializeManage: collectionOfSpaceships .
]

{ #category : #'as yet unclassified' }
TurnManager class >> spaceships: aSpaceshipWithId [ 
	self shouldBeImplemented.
]

{ #category : #initialization }
TurnManager >> initializeManage: collectionOfSpaceships [ 
	spaceships:= collectionOfSpaceships .
]

{ #category : #'as yet unclassified' }
TurnManager >> nextTurn [
	^1.
]
