Class {
	#name : #AllyCard,
	#superclass : #Object,
	#instVars : [
		'game',
		'allayTwoId',
		'allayOne',
		'allayTwo'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
AllyCard class >> shareFuelWith: aSpaceshipId [

	^ self new initializeShareFuelWith: aSpaceshipId
]

{ #category : #comparing }
AllyCard >> = aCard [

	^ self class == aCard class
]

{ #category : #initialization }
AllyCard >> initializeShareFuelWith: aSpaceshipId [

	allayTwoId := aSpaceshipId.
	
]

{ #category : #accessing }
AllyCard >> withEffectOn: aGame [

	game := aGame.
	allayOne := game currentSpaceship.
	allayTwo := game spaceships detect: [ :spaceship |
		            spaceship id = allayTwoId ].
]
