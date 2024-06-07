Class {
	#name : #WormholeCreator,
	#superclass : #Object,
	#instVars : [
		'beginningWormhole'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
WormholeCreator class >> withBeginningAndEnd: aCollectionOfBeginningAndEnd [ 
	^(self new) initializeWithBeginningAndEnd: aCollectionOfBeginningAndEnd .
]

{ #category : #'as yet unclassified' }
WormholeCreator >> beginning [
	^ beginningWormhole .
]

{ #category : #initialization }
WormholeCreator >> initializeWithBeginningAndEnd: aCollectionOfBeginningAndEnd [ 
	beginningWormhole:= Wormhole in: (aCollectionOfBeginningAndEnd at:1).
]
