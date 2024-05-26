Class {
	#name : #HyperGravityCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
HyperGravityCellTest >> test01WhenAValueIsLessThanTheConfiguredInTheHyperGravityCellThenThePositionIsTheSame [

	| aHyperGravityCell |
	aHyperGravityCell := HyperGravityCell withValue: 5 inPosition: 6.

	self assert: (aHyperGravityCell moveWithValue:4) equals: 6
]

{ #category : #tests }
HyperGravityCellTest >> test02WhenAValueIsGreaterThanTheConfiguredInTheHyperGravityCellThenReturnsTheNewPositionWithTheMovement [

	| aHyperGravityCell |
	aHyperGravityCell := HyperGravityCell withValue: 5 inPosition: 6.

	self assert: (aHyperGravityCell moveWithValue:10) equals: 16
]
