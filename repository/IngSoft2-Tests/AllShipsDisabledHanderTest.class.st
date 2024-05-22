Class {
	#name : #AllShipsDisabledHanderTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AllShipsDisabledHanderTest >> test01AllShipsDisabledHandlerMovesAnyAmountOfMovementsOnAnythingTheReturnsOne [

	| anAllShipsDisabledHandler |
	anAllShipsDisabledHandler := AllShipsDisabledHandler new.

	self assert: (anAllShipsDisabledHandler move: 6 on: 5) equals: 1
]

{ #category : #tests }
AllShipsDisabledHanderTest >> test02AllShipsDisabledHandlerPositionThenReturnsCollectionOfOneAndOne [

	| anAllShipsDisabledHandler collectionPosition |
	anAllShipsDisabledHandler := AllShipsDisabledHandler new.
	collectionPosition := OrderedCollection with: 1 with: 1.

	self
		assert: anAllShipsDisabledHandler position
		equals: collectionPosition
]
