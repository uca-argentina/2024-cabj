Class {
	#name : #MoonWalkCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonWalkCellTest >> test01WhenTheSpaceshipItsNotPlayingThenTheMoonWalkCellReturnsItsPositionMinusTheValueConfigured [

	| aMoonWalkCell collectionOfSpaceships aSpaceship |
	collectionOfSpaceships := OrderedCollection new.
	5 timesRepeat: [
		aSpaceship := Spaceship launchWithFuel: 20.
		collectionOfSpaceships add: aSpaceship.
		aSpaceship objectPosition setIndexWith: 10 ].

	aMoonWalkCell := MoonWalkCell
		                 withValueToMove: 3
		                 spaceships: collectionOfSpaceships
		                 inPosition: 6.

	self assert: aMoonWalkCell enter equals: 6
]

{ #category : #tests }
MoonWalkCellTest >> test02WhenTheSpaceshipItsPlayingThenTheMoonWalkCellDoesntChangeItsPosition [

	| aMoonWalkCell collectionOfSpaceships aSpaceship |
	collectionOfSpaceships := OrderedCollection new.
	5 timesRepeat: [
		aSpaceship := Spaceship launchWithFuel: 20.
		collectionOfSpaceships add: aSpaceship.
		aSpaceship objectPosition setIndexWith: 10 ].

	aMoonWalkCell := MoonWalkCell
		                 withValueToMove: 3
		                 spaceships: collectionOfSpaceships
		                 inPosition: 6.

	self assert: aMoonWalkCell enterWithSpaceshipPlaying equals: 6
]

{ #category : #tests }
MoonWalkCellTest >> test03WhenTheSpaceshipItsPlayingStaysTheSame [

	| aMoonWalkCell collectionOfSpaceships aSpaceship |
	collectionOfSpaceships := OrderedCollection new.
	5 timesRepeat: [
		aSpaceship := Spaceship launchWithFuel: 20.
		collectionOfSpaceships add: aSpaceship.
		aSpaceship objectPosition setIndexWith: 10 ].

	aMoonWalkCell := MoonWalkCell
		                 withValueToMove: 3
		                 spaceships: collectionOfSpaceships
		                 inPosition: 6.
	self assert: (aMoonWalkCell enterWithSpaceship: aSpaceship) equals: 6
]
