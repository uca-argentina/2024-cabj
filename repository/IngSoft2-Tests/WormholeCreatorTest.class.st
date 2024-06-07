Class {
	#name : #WormholeCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
WormholeCreatorTest >> test00WhenAWormholeIsCreatedThenTheBegginingAndEndingOfTheWormholeEntersOnAPosition [

	| aWormholeCreator aWormholeBeginning |
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #( 2 3 ).
	aWormholeBeginning := Wormhole in: 2.
	self assert: ((aWormholeCreator beginning) enter) equals: (aWormholeBeginning enter).
]

{ #category : #tests }
WormholeCreatorTest >> test02 [

	| aWormholeCreator aWormholeEnding |
	aWormholeCreator := WormholeCreator withBeginningAndEnd: #( 2 3 ).
	aWormholeEnding := Wormhole in: 3.
	self assert: ((aWormholeCreator ending) enter) equals: (aWormholeEnding enter).
]
