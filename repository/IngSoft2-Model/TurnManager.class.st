Class {
	#name : #TurnManager,
	#superclass : #Object,
	#instVars : [
		'spaceships',
		'turn'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
TurnManager class >> manage: collectionOfSpaceships [ 
	^(self new) initializeManage: collectionOfSpaceships .
]

{ #category : #initialization }
TurnManager >> initializeManage: collectionOfSpaceships [ 
	spaceships:= collectionOfSpaceships .
	turn:=1.
	
]

{ #category : #action }
TurnManager >> nextTurn [
	| nextSpaceship |
	turn > spaceships size ifTrue: [ turn:= 1 ].
	nextSpaceship:=spaceships at: turn.
	turn:= turn+1.
	^nextSpaceship .
]
