Class {
	#name : #WormholeTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
WormholeTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [:error | self assert: error messageText equals: anErrorMessage].
]

{ #category : #wormholeEnd }
WormholeTest >> test001WormholeEndEnterThenReturnsOppositeSide [

| aWormholeEnd |
aWormholeEnd := WormholeEnd withOpposite: 3.

self assert: aWormholeEnd enter equals: 3.
]

{ #category : #wormhole }
WormholeTest >> test002WormholeSecondSideMustBeGreaterThanFirst [

self 
	should: [| aWormhole |
				aWormhole:= Wormhole withSides: 5 and: 3] 
	raise: Error 
	withMessage: 'The ending must be greater than the beginning'.
]

{ #category : #wormholeEnd }
WormholeTest >> test003WormholeEndOppositeMustBeGreaterThanZero [

self 
	should: [WormholeEnd withOpposite: 0] 
	raise: Error 
	withMessage: 'WormholeEnd opposite must be greater than zero'.
]
