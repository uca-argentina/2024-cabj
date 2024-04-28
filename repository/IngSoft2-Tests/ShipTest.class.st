Class {
	#name : #ShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ShipTest >> testShipCreatedWithPositionZero [

	| aShip |
	aShip:= Ship beginGame.
	
	self assert: (aShip itsPosition) equals: 0.
]

{ #category : #tests }
ShipTest >> testShipInPositionDifferentThanThreeHasntWon [

	| aShip |
	aShip:= Ship beginGame.
	aShip move.
	aShip move.
	
	self deny: (aShip hasWon).
]

{ #category : #tests }
ShipTest >> testShipInPositionThreeWinsTheGame [

	| aShip |
	aShip:= Ship beginGame.
	aShip move.
	aShip move.
	aShip move.
	
	self assert: (aShip hasWon).
]

{ #category : #tests }
ShipTest >> testShipMovesOnePositionAndItsPositionReturnsOne [

	| aShip |
	aShip:= Ship beginGame.
	aShip move.
	
	self assert: (aShip itsPosition) equals: 1.
]

{ #category : #tests }
ShipTest >> testShipMovesTwoPositionsAndItsPositionReturnsTwo [

	| aShip |
	aShip:= Ship beginGame.
	aShip move.
	aShip move.
	
	self assert: (aShip itsPosition) equals: 2.
]
