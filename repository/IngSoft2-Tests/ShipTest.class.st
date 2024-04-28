Class {
	#name : #ShipTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ShipTest >> testShipPlays [

	| aShip |
	aShip:= Ship new.
	
	self assert: (aShip play)
]
