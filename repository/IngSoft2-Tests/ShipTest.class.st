Class {
	#name : #ShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ShipTest >> testShipCreatedWithPositionZero [

	| aShip |
	aShip:= Ship new.
	
	self assert: (aShip itsPosition) equals: 0.
]
