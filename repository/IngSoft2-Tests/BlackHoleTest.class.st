Class {
	#name : #BlackHoleTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BlackHoleTest >> test01BlackHoleEnterThenReturnsPositionMinusFour [

	| aBlackHole |
	aBlackHole := BlackHole position: 5.

	self assert: aBlackHole enter equals: 1
]
