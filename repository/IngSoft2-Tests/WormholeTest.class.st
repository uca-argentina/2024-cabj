Class {
	#name : #WormholeTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
WormholeTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [:error | self assert: error messageText equals: anErrorMessage].
]

{ #category : #tests }
WormholeTest >> testOnEnteringOnThEndItReturnsTheBeginning [

| aWormhole |
aWormhole:= Wormhole beginning: 2 end: 8.

self assert: aWormhole enterEnd equals: 2.
]

{ #category : #tests }
WormholeTest >> testOnEnteringOnTheBeginningItReturnsTheEnd [

| aWormhole |
aWormhole:= Wormhole beginning: 2 end: 10.

self assert: aWormhole enterBeginning equals: 10.
]

{ #category : #tests }
WormholeTest >> testWormhole006 [

self 
	should: [Wormhole beginning: 6 end: 2] 
	raise: Error 
	withMessage: 'The end must be greater than the beginning'.
]

{ #category : #tests }
WormholeTest >> testWormholeCannotBeCreatedWithBeginningNegative [

self 
	should: [Wormhole beginning: -1 end: 10] 
	raise: Error 
	withMessage: 'The beginnig must be greater than zero'.
]

{ #category : #tests }
WormholeTest >> testWormholeCannotBeCreatedWithBeginningZero [

self 
	should: [Wormhole beginning: 0 end: 10] 
	raise: Error 
	withMessage: 'The beginnig must be greater than zero'.
]
