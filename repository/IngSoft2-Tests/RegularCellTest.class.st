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

	| aCell |
	aCell := RegularCell position: 1.

	self assert: aCell enter equals: 1

]

{ #category : #tests }
RegularCellTest >> test02PositionOfTheRegularCellHasToBeGreaterThanZero [ 

	self
		should: [ RegularCell position: 0 ]
		raise: Error
		withMessage: 'A cell must have position greater than zero'

]

{ #category : #tests }
RegularCellTest >> test03RegularCellExitThenReturnsTrue [

	| aCell |
	aCell := RegularCell position: 1.

	self assert: (aCell exit: 3)
]
