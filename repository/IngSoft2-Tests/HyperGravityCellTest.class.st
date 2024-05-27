Class {
	#name : #HyperGravityCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
HyperGravityCellTest >> test01WhenAValueIsLessThanTheConfiguredInTheHyperGravityCellThenThePositionIsTheSame [

	| aHyperGravityCell |
	
	aHyperGravityCell := HyperGravityCell withValueToMove: 6 inPosition: 5.

	self assert: (aHyperGravityCell enter) equals: 5
]

{ #category : #tests }
HyperGravityCellTest >> test02WhenAValueIsGreaterThanTheConfiguredInTheHyperGravityCellThenTrue [

	| aHyperGravityCell |
	
	aHyperGravityCell := HyperGravityCell
		                     withValueToMove: 6
		                     inPosition: 5.

	self assert: (aHyperGravityCell exit: 10)
]

{ #category : #tests }
HyperGravityCellTest >> test03WhenAValueIsLessThanTheConfiguredInTheHyperGravityCellThenFalse [

	| aHyperGravityCell |
	
	aHyperGravityCell := HyperGravityCell
		                     withValueToMove: 6
		                     inPosition: 5.

	self deny: (aHyperGravityCell exit: 4)
]
