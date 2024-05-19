Class {
	#name : #WormholeEnd,
	#superclass : #Object,
	#instVars : [
		'oppositeEnd'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
WormholeEnd class >> withOpposite: wormholeEnd [

	wormholeEnd <= 0 ifTrue: [
		Error signal: 'WormholeEnd opposite must be greater than zero' ].
	^ self new initializeWithOpposite: wormholeEnd
]

{ #category : #action }
WormholeEnd >> enter [

	^ oppositeEnd
]

{ #category : #initialization }
WormholeEnd >> initializeWithOpposite: wormholeEnd [

	oppositeEnd := wormholeEnd
]
