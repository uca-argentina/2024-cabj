Class {
	#name : #BoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
BoxTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [
	self should: anErrorBlock raise: anErrorClass 
	withExceptionDo: [ :error |self assert: error messageText equals:anErrorMessage  ]
]

{ #category : #tests }
BoxTest >> test01BoxInitializeWithPositionThenEnterReturnsIt [

| aBox |
aBox:= Box position: 1.

self assert: aBox enter equals: 1 .
]

{ #category : #tests }
BoxTest >> test02PositionOfTheBoxHasToBeGreaterThanZero [

self 
	should: [ Box position: 0 ]
	raise: Error
	withMessage:'A box must have position greater than zero'.
]
