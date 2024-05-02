Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DieTest >> testADieIsCreatedWithAnAmountOfFaces [

| aDie |
aDie:= Die of:3.
self assert: aDie throw equals:3.

]
