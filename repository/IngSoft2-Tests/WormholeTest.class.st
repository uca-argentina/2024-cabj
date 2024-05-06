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

{ #category : #wormhole2 }
WormholeTest >> testWormHoleBeginningEnterTheReturnWormHoleEndingPosition [

| aWormholeBeginning aWormholeEnding |
aWormholeBeginning := WormholeBeginning atPosition: 2.
aWormholeEnding := WormholeEnding atPosition: 3.
aWormholeBeginning withEnd: aWormholeEnding.

self assert: aWormholeBeginning enter equals: 3.
]

{ #category : #'tests - initialization' }
WormholeTest >> testWormholeBeginnigCannotBeGreaterThanTheEnd [

self 
	should: [Wormhole beginning: 6 end: 2] 
	raise: Error 
	withMessage: 'The end must be greater than the beginning'.
]

{ #category : #wormhole2 }
WormholeTest >> testWormholeBeginningCannotBeGreaterThanEnding [

self 
	should: [| aWormholeBeginning aWormholeEnding |
				aWormholeBeginning := WormholeBeginning atPosition: 6.
				aWormholeEnding := WormholeEnding atPosition: 3.
				aWormholeEnding withBeginning: aWormholeBeginning  .] 
	raise: Error 
	withMessage: 'The ending must be greater than the beginning'.
]

{ #category : #wormhole2 }
WormholeTest >> testWormholeBeginningCannotbeZeroOrLess [

self 
	should: [WormholeBeginning atPosition: 0] 
	raise: Error 
	withMessage: 'The beginnig must be greater than zero'.
]

{ #category : #wormhole2 }
WormholeTest >> testWormholeBeginningCreatedWithEndEnterThenReturnsEnd [

| aWormholeBeginning aWormholeEnding |
aWormholeBeginning := WormholeBeginning atPosition: 2.
aWormholeEnding := WormholeEnding atPosition: 6.
aWormholeBeginning withEnd: aWormholeEnding.

self assert: aWormholeBeginning enter equals: 6.
]

{ #category : #'tests - initialization' }
WormholeTest >> testWormholeCannotBeCreatedWithBeginningNegative [

self 
	should: [Wormhole beginning: -1 end: 10] 
	raise: Error 
	withMessage: 'The beginnig must be greater than zero'.
]

{ #category : #'tests - initialization' }
WormholeTest >> testWormholeCannotBeCreatedWithBeginningZero [

self 
	should: [Wormhole beginning: 0 end: 10] 
	raise: Error 
	withMessage: 'The beginnig must be greater than zero'.
]

{ #category : #wormhole2 }
WormholeTest >> testWormholeEndingCannotBeLessThanBeginning [

self 
	should: [| aWormholeBeginning aWormholeEnding |
				aWormholeBeginning := WormholeBeginning atPosition: 6.
				aWormholeEnding := WormholeEnding atPosition: 3.
				aWormholeBeginning withEnd: aWormholeEnding  .] 
	raise: Error 
	withMessage: 'The ending must be greater than the beginning'.
]

{ #category : #wormhole2 }
WormholeTest >> testWormholeEndingCannotBeZeroOrLess [

self 
	should: [WormholeEnding atPosition: 0] 
	raise: Error 
	withMessage: 'The ending must be greater than zero'.
]

{ #category : #wormhole2 }
WormholeTest >> testWormholeEndingEnterThenReturnWormholeBeginningPosition [

| aWormholeBeginning aWormholeEnding |
aWormholeBeginning := WormholeBeginning atPosition: 2.
aWormholeEnding := WormholeEnding atPosition: 6.
aWormholeEnding withBeginning: aWormholeBeginning .

self assert: aWormholeEnding enter equals: 2.
]
