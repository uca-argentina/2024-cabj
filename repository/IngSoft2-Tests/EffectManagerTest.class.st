Class {
	#name : #EffectManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
EffectManagerTest >> test02EffectManagerCreatesCollectionOfEffectsSizeTwoThenCollectionSizeEqualsTwo [

	| aEffectManager array collection |
	array := OrderedCollection with: Cell.
	aEffectManager := EffectManager
		                  manage: array
		                  withProbabilitiesDistribution: #( 100 ).

	collection := aEffectManager createCollectionSize: 2.

	self assert: collection size equals: 2
]

{ #category : #tests }
EffectManagerTest >> test03EffectManagerManagesOnlyOneObjectThenCollectionCreatedOnlyHasThatObject [

	| aEffectManager array collection |
	array := OrderedCollection with: Cell.
	aEffectManager := EffectManager
		                  manage: array
		                  withProbabilitiesDistribution: #( 100 ).

	collection := aEffectManager createCollectionSize: 100.

	self assert: ((collection at: 100 atRandom) = Cell)
]
