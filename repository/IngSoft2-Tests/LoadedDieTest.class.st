Class {
	#name : #LoadedDieTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
LoadedDieTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [
	self should: anErrorBlock raise: anErrorClass 
	withExceptionDo: [ :error |self assert: error messageText equals:anErrorMessage  ]
]

{ #category : #tests }
LoadedDieTest >> testALoadedDieCannotHaveLessThanTjreeFaces [

self 
	should: [ LoadedDie of:2 ]
	raise: Error
	withMessage:'A die less than three faces doesnt exist'
]

{ #category : #tests }
LoadedDieTest >> testWhenLoadedDieIsThrownThenReturnsTheAmountOfFaces [

| aLoadedDie |
aLoadedDie:= LoadedDie of: 4.
self assert: aLoadedDie throw equals:4.
]

{ #category : #tests }
LoadedDieTest >> testWhenLoadedDieIsThrownThenReturnsThree [

| aLoadedDie |
aLoadedDie:= LoadedDie of:3.
self assert: aLoadedDie throw equals:3.
]
