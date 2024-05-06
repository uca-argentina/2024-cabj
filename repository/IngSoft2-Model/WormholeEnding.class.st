Class {
	#name : #WormholeEnding,
	#superclass : #Object,
	#instVars : [
		'ending',
		'begin'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
WormholeEnding class >> atPosition: aPosition [
	aPosition <= 0 ifTrue: [ Error signal: 'The ending must be greater than zero' ] .
	^(self new) initializeAtPosition: aPosition.
]

{ #category : #action }
WormholeEnding >> enter [
	^begin exit.
]

{ #category : #action }
WormholeEnding >> exit [
	^ending.
]

{ #category : #initialization }
WormholeEnding >> initializeAtPosition: aPosition [ 
	ending:=aPosition.
]

{ #category : #initialization }
WormholeEnding >> withBeginning: aWormholeBeginning [
	(aWormholeBeginning exit) >= ending ifTrue: [ Error signal: 'The ending must be greater than the beginning' ] .
	begin:= aWormholeBeginning .
]
