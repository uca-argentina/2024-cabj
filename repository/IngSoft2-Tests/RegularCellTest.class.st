Class {
	#name : #RegularCellTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
RegularCellTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [

	self
		should: anErrorBlock
		raise: anErrorClass
		withExceptionDo: [ :error |
		self assert: error messageText equals: anErrorMessage ]
]

{ #category : #tests }
RegularCellTest >> test01RegularCellInitializeWithPositionThenEnterReturnsIt [

	| aBox |
	aBox := RegularCell position: 1.

	self assert: aBox enter equals: 1
]

{ #category : #tests }
RegularCellTest >> test02PositionOfTheRegularCellHasToBeGreaterThanZero [

	self
		should: [ RegularCell position: 0 ]
		raise: Error
		withMessage: 'A cell must have position greater than zero'
]
