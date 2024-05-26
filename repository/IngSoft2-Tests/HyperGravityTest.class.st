Class {
	#name : #HyperGravityTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
HyperGravityTest >> test01 [

	| aHyperGravityCell |
	aHyperGravityCell := HyperGravityCell position: 5.

	self assert: aHyperGravityCell enter equals: 5
]
