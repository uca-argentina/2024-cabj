Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'amountOfBoxes',
		'wormholeBeginning',
		'wormholeEnding',
		'wormhole'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> of: anAmountOfBoxes [
	anAmountOfBoxes < 2 ifTrue: [ Error signal: 'A Board must have more than one box.' ]. 
	^ (self new) initializeOf: anAmountOfBoxes 
]

{ #category : #'as yet unclassified' }
Board class >> of: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd [
	anAmountOfBoxes < 2 ifTrue: [ Error signal: 'A Board must have more than one box.' ]. 
	^(self new) initializeOf: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd.
]

{ #category : #'as yet unclassified' }
Board >> enterWormhole: aPosition [ 
	aPosition = wormholeBeginning ifTrue: [^wormhole enterBeginning ].
	aPosition = wormholeEnding  ifTrue: [^wormhole enterEnd ].
]

{ #category : #'as yet unclassified' }
Board >> finishLine [
	^amountOfBoxes .
]

{ #category : #toDelete }
Board >> initializeOf: anAmountOfBoxes [ 
	amountOfBoxes:= anAmountOfBoxes.
]

{ #category : #initialization }
Board >> initializeOf: anAmountOfBoxes withWormholeBeginning: aBeginning andEnding: anEnd [ 
	amountOfBoxes:= anAmountOfBoxes .
	wormholeBeginning:= aBeginning .
	wormholeEnding:= anEnd .
	wormhole:= Wormhole beginning:  wormholeBeginning end: wormholeEnding. 
]
