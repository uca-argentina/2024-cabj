Class {
	#name : #WormholeTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
WormholeTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [:error | self assert: error messageText equals: anErrorMessage].
]

{ #category : #wormhole }
WormholeTest >> test002WormholeSecondSideMustBeGreaterThanFirst [

self 
	should: [| aWormhole |
				aWormhole:= Wormhole withSides: 5 and: 3] 
	raise: Error 
	withMessage: 'The ending must be greater than the beginning'.
]
