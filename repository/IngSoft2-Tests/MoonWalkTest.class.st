Class {
	#name : #MoonWalkTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkTest >> test01WhenTheSpaceshipItsNotPlayingThenTheMoonWalkCellReturnsItsPositionMinusTheValueConfigured [

	| aMoonWalkCell|
	aMoonWalkCell := MoonWalkCell withValue: 3 inPosition: 6.

	self assert: (aMoonWalkCell enterWithOtherSpaceship) equals:3.
]
