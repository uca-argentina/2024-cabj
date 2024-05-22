Class {
	#name : #AllShipsDisabledHanderTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
AllShipsDisabledHanderTest >> test01AllShipsDisabledHandlerMovesAnyAmountOfMovementsOnAnythingTheReturnsOne [

| anAllShipsDisabledHandler |
anAllShipsDisabledHandler:= AllShipsDisabledHandler new.

self assert: (anAllShipsDisabledHandler move: 6 on: 5) equals:1
]
