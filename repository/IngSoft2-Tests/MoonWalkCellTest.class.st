Class {
	#name : #MoonWalkCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkCellTest >> test01WhenTheSpaceshipItsNotPlayingThenTheMoonWalkCellReturnsItsPositionMinusTheValueConfigured [

	| aMoonWalkCell|
	aMoonWalkCell := MoonWalkCell withValue: 3 inPosition: 6.

	self assert: (aMoonWalkCell enterWithOtherSpaceship) equals:3.
]

{ #category : #tests }
MoonWalkCellTest >> test02WhenTheSpaceshipItsPlayingThenTheMoonWalkCellDoesntChangeItsPosition [

	| aMoonWalkCell|
	aMoonWalkCell := MoonWalkCell withValue: 3 inPosition: 6.

	self assert: (aMoonWalkCell enterWithSpaceshipPlaying) equals:6.
]

{ #category : #tests }
MoonWalkCellTest >> test03WhenTheSpaceshipItsPlayingStaysTheSame [
	| aMoonWalkCell aSpaceship |
	aMoonWalkCell := MoonWalkCell withValue: 3 inPosition: 6.
	aSpaceship:= Spaceship launchWithFuel: 10.
	self assert: (aMoonWalkCell enterWithSpaceship: aSpaceship) equals:6.
]
