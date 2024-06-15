Class {
	#name : #WormholeCreator,
	#superclass : #Object,
	#instVars : [
		'beginningWormhole',
		'endingWormhole'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
WormholeCreator class >> withBeginningAndEnd: aCollectionOfBeginningAndEnd [ 
	^(self new) initializeWithBeginningAndEnd: aCollectionOfBeginningAndEnd .
]

{ #category : #accessing }
WormholeCreator >> beginning [
	^ beginningWormhole .
]

{ #category : #accessing }
WormholeCreator >> ending [
	^ endingWormhole .
]

{ #category : #initialization }
WormholeCreator >> initializeWithBeginningAndEnd: aCollectionOfBeginningAndEnd [

	beginningWormhole := Wormhole in:
		                     (aCollectionOfBeginningAndEnd at: 1).
	endingWormhole := Wormhole in: (aCollectionOfBeginningAndEnd at: 2)
]
