Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
DieTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [
	self should: anErrorBlock raise:anErrorClass
	withExceptionDo: [:error| self assert: error messageText equals: anErrorMessage].
]

{ #category : #tests }
DieTest >> testADieCannotBeCreatedWithLessThanThreeFaces [

self
	should:[Die of:2]
	raise: Error 
	withMessage:'A die less than three faces doesnt exist'

]

{ #category : #tests }
DieTest >> testADieIsCreatedWithAnAmountOfFaces [

| aDie |
aDie:= Die of:3.
self assert: ((aDie throw) between:1 and:3).

]

{ #category : #tests }
DieTest >> testDie002 [

| aDie |
aDie:= Die of:5.
self assert: ((aDie throw) between:1 and:5). 
]
