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
ShipTest >> testShipMovesOnePositionAndItsPositionReturnsOne [

	| aShip |
	aShip:= Ship beginGame.
	aShip move.
	
	self assert: (aShip itsPosition) equals: 1.
]
