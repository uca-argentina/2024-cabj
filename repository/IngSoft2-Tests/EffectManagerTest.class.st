Class {
	#name : #EffectManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
EffectManagerTest >> test01EffectManagerInitializeThenDictionaryIsOfSizeOneHundred [

	| aBoardCreator aWormholeCreator aEffectManager |
	aWormholeCreator := WormholeCreator withBeginning: 2 andEnd: 3.
	aBoardCreator := BoardCreator
		                 withCellsAndLaps: #( 10 1 )
		                 withWormholeCreator: aWormholeCreator
		                 andSpecialCellsDistruibution: #( 50 20 0 0 0 0 ).

	aEffectManager := EffectManager for: aBoardCreator probabilitiesDistribution: #( 50 20 0 0 0 0 ).

	self assert: aEffectManager dictionaryOfProbabilities size equals: 100
]
