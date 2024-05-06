Class {
	#name : #WormholeBeginning,
	#superclass : #Object,
	#instVars : [
		'beginning',
		'end'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
WormholeBeginning class >> atPosition: aPosition [
	aPosition <= 0 ifTrue: [ Error signal: 'The beginnig must be greater than zero' ] .
	^(self new) initializeAtPosition: aPosition.
]

{ #category : #action }
WormholeBeginning >> enter [
	^end exit.
]

{ #category : #action }
WormholeBeginning >> exit [
	^beginning .
]

{ #category : #initialization }
WormholeBeginning >> initializeAtPosition: aPosition [ 
	beginning:=aPosition.
]

{ #category : #initialization }
WormholeBeginning >> withEnd: aWormholeEnding [ 
	(aWormholeEnding exit) <= beginning  ifTrue: [ Error signal: 'The ending must be greater than the beginning' ] .
	end:= aWormholeEnding .
]
