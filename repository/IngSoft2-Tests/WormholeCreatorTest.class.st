Class {
	#name : #WormholeCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
WormholeCreatorTest >> test00WhenAWormholeIsCreatedThenTheBegginingOfTheWormholeCanEnterOnAPosition [

	| aWormholeCreator aWormholeBeginning |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aWormholeBeginning := Wormhole in: 2.
	self
		assert: aWormholeCreator beginning enter
		equals: aWormholeBeginning enter
]

{ #category : #tests }
WormholeCreatorTest >> test01WhenAWormholeIsCreatedThenTheEndingCanEnterToThePosition [

	| aWormholeCreator aWormholeEnding |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aWormholeEnding := Wormhole in: 3.
	self
		assert: aWormholeCreator ending enter
		equals: aWormholeEnding enter
]
