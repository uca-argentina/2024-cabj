Class {
	#name : #TurnManagerWithId,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'turn'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #'instance creation' }
TurnManagerWithId class >> manage: collectionOfSpaceships [ 
	^(self new) initializeManage: collectionOfSpaceships .
]

{ #category : #initialization }
TurnManagerWithId >> initializeManage: collectionOfSpaceships [ 
	spaceships:= collectionOfSpaceships .
	turn:= 1.
	
]

{ #category : #action }
TurnManagerWithId >> nextTurn [
	| nextSpaceship |
	turn > spaceships size ifTrue: [ turn:= 1 ].
	nextSpaceship:=spaceships at: turn.
	turn:= turn+1.
	^nextSpaceship spaceshipName .
]
