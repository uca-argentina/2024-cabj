Class {
	#name : #BlackHoleCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BlackHoleCellTest >> test01BlackHoleEnterThenReturnsPositionMinusFour [

	| aBlackHole |
	aBlackHole := BlackHoleCell position: 10.

	self assert: aBlackHole enter equals: 6
]
