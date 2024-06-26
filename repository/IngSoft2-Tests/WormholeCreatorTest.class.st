Class {
	#name : #WormholeCreatorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
WormholeCreatorTest >> test00WhenAWormholeIsCreatedThenTheBegginingOfTheWormholeCanEnterOnAPosition [

	| aWormholeCreator aWormholeBeginning aGame |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aWormholeBeginning := Wormhole in: 2.
	self
		assert: (aWormholeCreator beginning enterOn:aGame)
		equals: (aWormholeBeginning enterOn:aGame)
]

{ #category : #tests }
WormholeCreatorTest >> test01WhenAWormholeIsCreatedThenTheEndingCanEnterToThePosition [

	| aWormholeCreator aWormholeEnding aGame |
	aWormholeCreator := WormholeCreator
		                    withBeginning: 2
		                    andEnd: 3.
	aWormholeEnding := Wormhole in: 3.
	self
		assert: (aWormholeCreator ending enterOn:aGame)
		equals:( aWormholeEnding enterOn:aGame)
]
