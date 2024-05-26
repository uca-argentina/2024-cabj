Class {
	#name : #AllShipsDisabledHanderTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AllShipsDisabledHanderTest >> test01AllShipsDisabledHandlerMovesAnyAmountOfMovementsOnAnythingTheReturnsOne [

	| anAllShipsDisabledHandler position |
	anAllShipsDisabledHandler := AllShipsDisabledHandler fakeLaunch .

	position := OrderedCollection with: 1 with: 1.

	self
		assert: (anAllShipsDisabledHandler move: 6 on: 5 of: 20) getPosition
		equals: position
]

{ #category : #tests }
AllShipsDisabledHanderTest >> test02AllShipsDisabledHandlerPositionThenReturnsCollectionOfOneAndOne [

	| anAllShipsDisabledHandler collectionPosition |
	anAllShipsDisabledHandler := AllShipsDisabledHandler fakeLaunch.
	collectionPosition := OrderedCollection with: 1 with: 1.

	self
		assert: anAllShipsDisabledHandler objectPosition getPosition
		equals: collectionPosition
]

{ #category : #tests }
AllShipsDisabledHanderTest >> test03AllShipsDisabledHandlerKnowsHowToLoadFuel [

	| anAllShipsDisabledHandler |
	anAllShipsDisabledHandler := AllShipsDisabledHandler new.
	anAllShipsDisabledHandler loadFuel: 5.

	self
		assert: (anAllShipsDisabledHandler getFuel)
		equals: 5
]
